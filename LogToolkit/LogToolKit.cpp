#include <iostream>
#include <tuple>
#include <vector>
#include <unordered_map>

using namespace std;

class ISymb {
public:
    std::tuple<int> args;
    std::tuple<int> i;
    std::tuple<int> n;
    int m;
    int weight;

    ISymb(const std::tuple<int>& args) : args(args), weight(0) {
        // Validate the number of arguments
        if (args.size() % 2 == 0 || args.size() < 3) {
            throw std::invalid_argument("The number of arguments should be odd and at least 3");
        }

        m = args.size() / 2 - 1;
        for (int r = 0; r <= m; ++r) {
            int i_r = (r > 0) ? args[2 * r] : 0;
            int n_r = args[1 + 2 * r];
            if (n_r < 1 || (r > 0 && i_r >= args[2 * r + 1])) {
                throw std::invalid_argument("Invalid arguments");
            }
            weight += n_r;
        }
    }

    bool operator < (const ISymb& other) const {
        return std::tie(weight, args) < std::tie(other.weight, other.args);
    }

    // For debugging
    void print() const {
        std::cout << "ISymb(weight=" << weight << ", args={";
        for (size_t i = 0; i < args.size(); ++i) {
            std::cout << args[i];
            if (i != args.size() - 1) std::cout << ", ";
        }
        std::cout << "})" << std::endl;
    }
};

// Custom hash function for ISymb
namespace std {
    template <>
    struct hash<ISymb> {
        size_t operator()(const ISymb& symb) const {
            size_t h = 0;
            for (int i : symb.args) {
                h ^= std::hash<int>{}(i) + 0x9e3779b9 + (h << 6) + (h >> 2); // Combine hashes
            }
            return h;
        }
    };
}

int main() {
    try {
        // Create instances of ISymb
        ISymb a({1, 2, 3});
        ISymb b({1, 2, 3, 4, 5});
        ISymb c({1, 3, 5, 7, 9});

        // Create a map with ISymb as the key
        std::unordered_map<ISymb, int> symbMap;

        // Insert elements
        symbMap[a] = 10;
        symbMap[b] = 20;
        symbMap[c] = 30;

        // Iterate and print
        for (const auto& [key, value] : symbMap) {
            key.print();
            std::cout << " -> " << value << std::endl;
        }
    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
    }

    return 0;
}