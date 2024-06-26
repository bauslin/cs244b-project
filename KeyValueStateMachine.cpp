#include "structs.h"
#include "utils.h"
#include <queue>
#include <iostream>
#include <thread>
#include "KeyValueStateMachine.h"
#include <iostream>

//TODO: add protection for stoi/substr and also running out of key/value pairs
KeyValueStateMachine::KeyValueStateMachine(uint32_t id) :
    ReplicatedStateMachine() {
    for (int i = id; i < 100; i += 2){
        states.insert({i, Status({false, false, false, i + 100})});
        to_add.push({i, i + 100});
    }
}
KeyValueStateMachine::~KeyValueStateMachine() {
    
}

void KeyValueStateMachine::TransactionsFinalized(const std::string &transaction, uint64_t epoch)
{
    // std::cout << "finalized: " << transaction << std::endl;
    std::pair<int, int> t = parse_string(transaction);
    if (states.find(t.first) == states.end()) {
        states.insert({t.first, Status({true, true, true, t.second})});
    } else {
        states[t.first].finalized = true;
    }
}

void KeyValueStateMachine::TransactionsNotarized(const std::string &transaction, uint64_t epoch)
{
    // std::cout << "notarized: " << transaction << std::endl;
    std::pair<int, int> t = parse_string(transaction);
    if (states.find(t.first) == states.end()) {
        states.insert({t.first, Status({true, true, false, t.second})});
    } else {
        states[t.first].notarizied = true;
    }
}

bool KeyValueStateMachine::ValidateTransactions(const std::string &transaction, uint64_t epoch)
{
    return true;
}

void KeyValueStateMachine::GetTransactions(std::string *txns, uint64_t epoch)
{
    if (to_add.empty()) {
        txns->clear();
        return;
    }

    std::pair<int, int> n = to_add.front();
    to_add.pop();

    *txns = "key: ";
    *txns += std::to_string(n.first);
    *txns += " value: ";
    *txns += std::to_string(n.second);
    // std::string ret = std::string("key: " + std::to_string(n.first) + " value: " + std::to_string(n.second));
    // std::cout << "get transactions: " << ret << std::endl;

    states[n.first].onchain = true;
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
    while (true){
        std::string line;
        std::getline(std::cin, line);
        std::pair<int, int> p = parse_string(line);
        to_add.push(p);
    }
}

std::thread KeyValueStateMachine::SpawnThread()
{
    return std::thread (&KeyValueStateMachine::InputThread, this);

}
void KeyValueStateMachine::BeginTime()
{

}