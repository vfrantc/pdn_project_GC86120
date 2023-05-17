// json_exporter.cpp
#include <iostream>
#include <fstream>
#include <nlohmann/json.hpp>

using json = nlohmann::json;

extern "C" {
    void save_system_state_to_json(const char* filename, const int* state, int state_size);
}

void save_system_state_to_json(const char* filename, const int* state, int state_size) {
    json j;

    for (int i = 0; i < state_size; ++i) {
        j["state"].push_back(state[i]);
    }

    std::ofstream json_file(filename);
    json_file << j.dump(4);
    json_file.close();
}

