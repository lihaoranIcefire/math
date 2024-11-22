#include <iostream>
#include <tuple>
#include <vector>
#include <unordered_map>

using namespace std;

using Int = int;

class ISymb {
public:
    vector<Int> args;
    vector<Int> i;
    vector<Int> n;
    int m;
    int weight;

    ISymb(const vector<Int>& args) : args(args), weight(-1) {
        // Validate the number of arguments
        if (args.size() % 2 == 0 || args.size() < 3) {
            throw std::invalid_argument("The number of arguments should be odd and at least 3");
        }

        m = args.size() / 2 - 1;
        i.push_back(args[0]);
        for (Int r = 0; r <= m; r++) {
            n.push_back(args[1 + 2 * r]);
            i.push_back(args[2 + 2 * r]);
            if (n[r] < 1 || i[r] < i[r+1]) {
                throw std::invalid_argument("Invalid arguments");
            }
            weight += n[r];
        }
    }

    bool operator < (const ISymb& other) const {
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
    

    return 0;
}