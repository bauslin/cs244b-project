#include "structs.h"
// #include "utils.h"
#include <queue>
#include <thread>
#include "KeyValueStateMachine.h"
#include <ncurses.h>
#undef OK

#include <string.h>
#include <ctype.h>
#include <stdlib.h>

// START HELPER FUNCTIONS FOR DISPLAY

void KeyValueStateMachine::make_buffer(struct input_line *buf) {
    buf->ln = NULL;
    buf->length = 0;
    buf->capacity = 0;
    buf->cursor = 0;
    buf->last_rendered = 0;
}

void KeyValueStateMachine::destroy_buffer(struct input_line *buf) {
    free(buf->ln);
    make_buffer(buf);
}

void KeyValueStateMachine::render_line(WINDOW* window, struct input_line *buf) {
            // mvwprintw(prompt, 0, 0, ">                     ");
    wmove(window, 0, 5);
    int i = 0;
    for(; i < buf->length; i ++) {
        chtype c = buf->ln[i];
        if(i == buf->cursor) {
            c |= A_REVERSE;
        }
        waddch(window, c);
    }
    if(buf->cursor == buf->length) {
        waddch(window, ' ' | A_REVERSE);
        i ++;
    }
    int rendered = i;
    // Erase previously rendered characters
    for(; i < buf->last_rendered; i ++) {
        waddch(window, ' '); 
    }
    buf->last_rendered = rendered;
}

int KeyValueStateMachine::retrieve_content(struct input_line *buf, char *target, int max_len) {
    int len = buf->length < (max_len - 1) ? buf->length : (max_len - 1);
    memcpy(target, buf->ln, len);
    target[len] = '\n';
    target[len + 1] = '\0';
    buf->cursor = 0;
    buf->length = 0;
    return len + 2;
}

void KeyValueStateMachine::add_char(struct input_line *buf, char ch) {
    // Ensure enough space for new character
    if(buf->length == buf->capacity) {
        int ncap = buf->capacity + 128;
        char *nln = (char*) realloc(buf->ln, ncap);
        if(!nln) {
            // Out of memory!
            return;
        }
        buf->ln = nln;
        buf->capacity = ncap;
    }

    // Add new character
    memmove(
        &buf->ln[buf->cursor+1],
        &buf->ln[buf->cursor],
        buf->length - buf->cursor
    );
    buf->ln[buf->cursor] = ch;
    ++ buf->cursor;
    ++ buf->length;
}

int KeyValueStateMachine::handle_input(struct input_line *buf, char *target, int max_len, int key) {
    if(!(key & KEY_CODE_YES) && isprint(key)) {
        add_char(buf, key);
        return 0;
    }

    switch(key) {
    case ERR: /* no key pressed */ break;
    case KEY_LEFT:  if(buf->cursor > 0)           { buf->cursor --; } break;
    case KEY_RIGHT: if(buf->cursor < buf->length) { buf->cursor ++; } break;
    case KEY_HOME:  buf->cursor = 0;           break;
    case KEY_END:   buf->cursor = buf->length; break;
    case '\t':
        add_char(buf, '\t');
        break;
    case KEY_BACKSPACE:
    case 127:
    case 8:
        if(buf->cursor <= 0) {
            break;
        }
        buf->cursor --;
        // Fall-through
    case KEY_DC:
        if(buf->cursor < buf->length) {
            memmove(
                &buf->ln[buf->cursor],
                &buf->ln[buf->cursor+1],
                buf->length - buf->cursor - 1
            );
            buf->length --;
        }
        break;
    case KEY_ENTER:
    case '\r':
    case '\n':
        return retrieve_content(buf, target, max_len);
    }
    return 0;
}

int KeyValueStateMachine::get_line_non_blocking(WINDOW * window,  input_line *buf, char *target, int max_len) {
    while(1) {
        int key = wgetch(window);
        if(key == ERR) {
            // No more input
            return 0;
        }
        int n = handle_input(buf, target, max_len, key);
        if(n) {
            return n;
        }
    }
}

// START HELPER FUNCTIONS

void KeyValueStateMachine::print(std::string str){
    to_print_mutex.lock();
    to_print.push(str);
    to_print_mutex.unlock();
}
void KeyValueStateMachine::add(std::pair<int, int> item){
    to_add_mutex.lock();
    to_add.push(item);
    to_add_mutex.unlock();
}
void KeyValueStateMachine::update_state(std::pair<int, int> target, std::string new_status){
    if (target.first == -1 && target.second == -1) return;
    to_update_mutex.lock();
    to_update.push(Update{target, new_status});
    to_update_mutex.unlock();
}
//TODO: add protection for stoi/substr and also running out of key/value pairs

KeyValueStateMachine::KeyValueStateMachine(uint32_t id) :
    ReplicatedStateMachine() {
    for (int i = id; i < 15; i += 2){
        add({i, i + 100});
    }
}
KeyValueStateMachine::~KeyValueStateMachine() {
    
}

void KeyValueStateMachine::TransactionsFinalized(const std::string &transaction, uint64_t epoch)
{
    print("finalized: " + transaction);
    // std::cout << "finalized: " << transaction << std::endl;
    std::pair<int, int> t = parse_string(transaction);
    update_state(t, "FINALIZED");
    // if (states.find(t.first) == states.end()) {
    //     states.insert({t.first, Status({true, true, true, t.second})});
    // } else {
    //     states[t.first].finalized = true;
    // }
}

void KeyValueStateMachine::TransactionsNotarized(const std::string &transaction, uint64_t epoch)
{
    print("notarized: " + transaction);
    // std::cout << "notarized: " << transaction << std::endl;
    std::pair<int, int> t = parse_string(transaction);
    update_state(t, "NOTARIZED");
    // if (states.find(t.first) == states.end()) {
    //     states.insert({t.first, Status({true, true, false, t.second})});
    // } else {
    //     states[t.first].notarizied = true;
    // }
}

bool KeyValueStateMachine::ValidateTransactions(const std::string &transaction, uint64_t epoch)
{
    print("validated: " + transaction);
    update_state(parse_string(transaction), "VALIDATED");
    return true;
}

void KeyValueStateMachine::GetTransactions(std::string *txns, uint64_t epoch)
{
    to_add_mutex.lock();
    if (to_add.empty()) {
        txns->clear();
        to_add_mutex.unlock();
        return;
    }

    std::pair<int, int> n = to_add.front();
    to_add.pop();
    to_add_mutex.unlock();
    *txns = "key: ";
    *txns += std::to_string(n.first);
    *txns += " value: ";
    *txns += std::to_string(n.second);
    update_state(n, "PROPOSED");
    // std::string ret = std::string("key: " + std::to_string(n.first) + " value: " + std::to_string(n.second));
    // std::cout << "get transactions: " << ret << std::endl;

    // states[n.first].onchain = true;
}

std::pair<int, int> KeyValueStateMachine::parse_string(std::string s)
{
    if (s.length() < 13 || !s.find(" value: ")) return std::make_pair(-1, -1);
    int k = stoi(s.substr(5, s.find(" value: ")));
    int v = stoi(s.substr(s.find(" value: ") + 8));

    return std::make_pair(k, v);
}

void KeyValueStateMachine::InputThread()
{
    initscr();
    cbreak();             // Immediate key input
    nonl();               // Get return key
    timeout(0);           // Non-blocking input
    keypad(stdscr, 1);
    noecho();
    curs_set(0);
    intrflush(stdscr, 0);
    leaveok(stdscr, 1);
    if (has_colors() == FALSE) {
        endwin();
        printf("Your terminal does not support color\n");
        exit(1);
    }

    start_color();
    init_pair(1, COLOR_WHITE, COLOR_GREEN);
    init_pair(2, COLOR_WHITE, COLOR_BLUE);
    init_pair(3, COLOR_WHITE, COLOR_MAGENTA);
    init_pair(4, COLOR_WHITE, COLOR_GREEN);
    clear();

    int display_height = 15;
    int debug_height = 5;
    WINDOW *display = newwin(display_height, 0, 0, 0);
    WINDOW *debug = newwin(debug_height, 0, display_height, 0);
    WINDOW *prompt = newwin(1, 0, debug_height + display_height, 0);
    wtimeout(prompt, 0); 
    refresh();
    scrollok(display, TRUE);
    scrollok(debug, TRUE);
    struct input_line lnbuffer;
    make_buffer(&lnbuffer);
    int lines_written = 0;
    int display_lines = 0;
    while (true){
        char ln[1024];
        wrefresh(display);
        wrefresh(debug);
        wrefresh(prompt);

        //read input
        int len = get_line_non_blocking(prompt, &lnbuffer, ln, sizeof(ln));
        render_line(prompt, &lnbuffer);
        wrefresh(prompt);
        
        if(len > 0) {
            if(strcmp(ln, "exit") == 0) {
                break;
            }
            std::string s = std::string(ln);
            int k = stoi(s.substr(0, s.find(" ")));
            int v = stoi(s.substr(s.find(" ")));
            add(std::make_pair(k, v));

        }

        //print debug
        to_print_mutex.lock();
        while (!to_print.empty()){
            std::string printstr = to_print.front();
            printstr += "\n";
            to_print.pop();
            int write_line = lines_written < debug_height - 1 ? lines_written : debug_height - 1;

            wmove(debug, write_line, 5);
            waddstr(debug, printstr.c_str());
            lines_written ++;
        }
        to_print_mutex.unlock();

        //update states / display
        to_update_mutex.lock();
        while (!to_update.empty()){
            Update u = to_update.front();
            std::string k = std::to_string(u.target.first) + " " + std::to_string(u.target.second);
            std::string printstr = k + " " + u.new_status;
            to_update.pop();
            if (states.find(k) == states.end()){
                states.insert({k, Status{int(states.size()), u.new_status}});
                int write_line = display_lines < display_height - 1 ? display_lines : display_height - 1;
                wmove(display, write_line, 5);

                printstr += "\n";
                wattron(display, COLOR_PAIR(status_codes[u.new_status]));
                waddstr(display, printstr.c_str());
                wattron(display, COLOR_PAIR(status_codes[u.new_status]));

                display_lines ++;

            }
            else{
                if (status_codes[states[k].status] < status_codes[u.new_status]){
                    states[k].status = u.new_status;
                    int write_line = states[k].line_number;
                    if (display_lines >= display_height){
                        write_line = display_height - 1 - (display_lines - states[k].line_number);
                    }
                    // int write_line = display_height - (display_lines - states[k].line_number) - (states[k].line_number < display_lines - 1 ? 1 : 0);
                    // mvwprintw(display, 0, 5, ("write_line " + std::to_string(write_line) + " display_lines " + std::to_string(states.size()) + " line number " + std::to_string(display_lines) + u.new_status).c_str());
                    if (write_line < 0) continue;
                    wattron(display, COLOR_PAIR(status_codes[u.new_status]));
                    mvwprintw(display, write_line, 5, printstr.c_str());	
                    wattron(display, COLOR_PAIR(status_codes[u.new_status]));

                }
            }


        }
        to_update_mutex.unlock();
    }

    destroy_buffer(&lnbuffer);
    delwin(stdscr);
    endwin();
    refresh();

    // while (true){
    //     std::string line;
    //     // std::getline(std::cin, line);
    //     std::pair<int, int> p = std::make_pair(2, 4);
    //     add(p);
    //     to_print_mutex.lock();
    //     while (!to_print.empty()){
    //         std::string printstr = to_print.front();
    //         to_print.pop();
    //         std::cout << printstr << std::endl;
    //     }
    //     to_print_mutex.unlock();

    // }
}

std::thread KeyValueStateMachine::SpawnThread()
{
    return std::thread (&KeyValueStateMachine::InputThread, this);

}
void KeyValueStateMachine::BeginTime()
{

}