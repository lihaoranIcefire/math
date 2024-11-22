#include <iostream>
#include <tuple>
#include <vector>
#include <numeric>  // For std::gcd (greatest common divisor)
#include <unordered_map>

using namespace std;
using Int = int;



class Rat {
private:
    int numerator;
    int denominator;

    // Helper function to reduce the rational number
    void reduce() {
        int gcd_value = std::gcd(numerator, denominator);
        numerator /= gcd_value;
        denominator /= gcd_value;

        // If the denominator is negative, move the sign to the numerator
        if (denominator < 0) {
            numerator = -numerator;
            denominator = -denominator;
        }
    }

public:
    // Constructor
    Rat(int num = 0, int denom = 1) : numerator(num), denominator(denom) {
        if (denominator == 0) {
            throw std::invalid_argument("Denominator cannot be zero.");
        }
        reduce();  // Simplify the fraction
    }

    // Accessor functions
    int getNumerator() const { return numerator; }
    int getDenominator() const { return denominator; }

    // Arithmetic operations
    Rat operator + (const Rat& other) const {
        int num = numerator * other.denominator + other.numerator * denominator;
        int denom = denominator * other.denominator;
        return Rat(num, denom);
    }

    Rat operator - (const Rat& other) const {
        int num = numerator * other.denominator - other.numerator * denominator;
        int denom = denominator * other.denominator;
        return Rat(num, denom);
    }

    Rat operator * (const Rat& other) const {
        int num = numerator * other.numerator;
        int denom = denominator * other.denominator;
        return Rat(num, denom);
    }

    Rat operator / (const Rat& other) const {
        if (other.numerator == 0) {
            throw std::invalid_argument("Cannot divide by zero.");
        }
        int num = numerator * other.denominator;
        int denom = denominator * other.numerator;
        return Rat(num, denom);
    }

    // Output the rational number in the form "numerator/denominator"
    friend std::ostream& operator << (std::ostream& os, const Rat& r) {
        os << r.numerator << "/" << r.denominator;
        return os;
    }
};

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
};



class HSymb {
public:
    vector<Int> args;
    vector<Int> m;
    vector<Int> i;
    vector<Int> n;
    int d;
    int weight;

    HSymb(const vector<Int>& args) : args(args), weight(0) {
        // Validate the number of arguments
        if (args.size() % 2 == 0 || args.size() < 3) {
            throw std::invalid_argument("The number of arguments should be odd and at least 3");
        }

        d = args.size() / 2;
        m.push_back(0);
        n.push_back(0);
        for (Int r = 0; r <= m; r++) {
            n.push_back(args[1 + 2 * r]);
            m.push_back(args[2 + 2 * r]);
            if (n[r] < 1 || i[r] < i[r+1]) {
                throw std::invalid_argument("Invalid arguments");
            }
            weight += n[r];
        }
    }

    bool operator < (const HSymb& other) const {
    }
}



// Custom hash function for ISymb & HSymb
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
    template <>
    struct hash<HSymb> {
        size_t operator()(const HSymb& symb) const {
            size_t h = 0;
            for (int i : symb.args) {
                h ^= std::hash<int>{}(i) + 0x9e3779b9 + (h << 6) + (h >> 2); // Combine hashes
            }
            return h;
        }
    };
}



class ISymbPoly {
public:
    unordered_map<ISymb, Rat> coef;
};

class HSymbPoly {
public:
    unordered_map<HSymb, Rat> coef;
};

int main() {
    

    return 0;
}