#include <iostream>
#include <vector>
#include <limits>
#include <algorithm>

std::vector<int> plan_truck_content(const std::vector<int>& demands, int truck_capacity) {
    int n = demands.size();
    std::vector<int> min_trucks(n + 1, std::numeric_limits<int>::max());
    std::vector<int> result;

    min_trucks[0] = 0;
    for (int i = 1; i <= n; ++i) {
        int remaining_capacity = truck_capacity;
        for (int j = i; j > 0; --j) {
            remaining_capacity -= demands[j - 1];
            if (remaining_capacity >= 0) {
                if (min_trucks[i] > 1 + min_trucks[j - 1]) {
                    min_trucks[i] = 1 + min_trucks[j - 1];
                }
            } else {
                break;
            }
        }
    }

    int i = n;
    while (i > 0) {
        int remaining_capacity = truck_capacity;
        for (int j = i; j > 0; --j) {
            remaining_capacity -= demands[j - 1];
            if (remaining_capacity >= 0) {
                if (min_trucks[i] == 1 + min_trucks[j - 1]) {
                    result.push_back(j - 1);
                    i = j - 1;
                    break;
                }
            } else {
                break;
            }
        }
    }

    std::reverse(result.begin(), result.end());
    return result;
}

int main() {
    std::vector<int> demands = {1000, 2000, 3000, 4000, 5000};
    int truck_capacity = 10000;

    std::vector<int> truck_plan = plan_truck_content(demands, truck_capacity);

    std::cout << "Truck plan: ";
    for (const auto& idx : truck_plan) {
        std::cout << idx << " ";
    }
    std::cout << std::endl;

    return 0;
}

