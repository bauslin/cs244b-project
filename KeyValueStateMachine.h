#pragma once

#include "structs.h"
#include <queue>
#include <ncurses.h>
#undef OK
class KeyValueStateMachine : public ReplicatedStateMachine {
public:
    KeyValueStateMachine(uint32_t id);
    ~KeyValueStateMachine() override;
    void TransactionsFinalized(const std::string &txns, uint64_t epoch) override;
    void TransactionsNotarized(const std::string &txns, uint64_t epoch) override;
    bool ValidateTransactions(const std::string &txns, uint64_t epoch) override;
    void GetTransactions(std::string *txns, uint64_t epoch) override;
    void BeginTime() override;
    std::thread SpawnThread() override;
    struct Status{
        int line_number;
        std::string status;
    };
        

private:
    struct Update{
        std::pair<int, int> target;
        std::string new_status;
    };
    std::unordered_map<std::string, Status> states;
    std::unordered_map<std::string, int> status_codes = {  //inserting element directly in map 
    {"PROPOSED", 1}, 
    {"VALIDATED", 2}, 
    {"NOTARIZED", 3},
    {"FINALIZED", 4} 
    }; 
    std::queue<std::pair<int, int>> to_add;
    std::mutex to_add_mutex;
    std::queue<std::string> to_print;
    std::mutex to_print_mutex;
    std::queue<Update> to_update;
    std::mutex to_update_mutex;

    void print(std::string);
    void add(std::pair<int, int>);
    void update_state(std::pair<int, int>, std::string);
    std::pair<int,int> parse_string(std::string);
    void InputThread();
    struct input_line {
        char *ln;
        int length;
        int capacity;
        int cursor;
        int last_rendered;
    };
    void make_buffer(struct input_line *buf);
    void destroy_buffer(struct input_line *buf);
    void render_line(WINDOW *window, struct input_line *buf);
    int retrieve_content(struct input_line *buf, char *target, int max_len);
    void add_char(struct input_line *buf, char ch);
    int handle_input(struct input_line *buf, char *target, int max_len, int key);
    int get_line_non_blocking(WINDOW *window, struct input_line *buf, char *target, int max_len);
};
