import itertools
from IPython.display import display, Math
from sympy import *
from sympy.utilities.iterables import partitions


# Reserve some symbol heads
II, Li, du, dv = IndexedBase('II'), IndexedBase('Li'), IndexedBase('du'), IndexedBase('dv')



class ISymb(Indexed):
    def __new__(cls, *args):
        return super().__new__(cls, II, *args)
    def __init__(self, *args):
        # self.args[0] is the symbol head II
        self.m = len(args) // 2 - 1
        self.i = args[::2]
        self.n = args[1::2]
    def __lt__(self, other):
        pass
    def toHSymb(self, depth):
        '''
        Turn HSymb into ISymb given depth
        '''
        if self.m == 1:
            return 1
        elif self.i[0] == 0 and self.i[-1] == 0:
            return 0
        elif self.i[0] != 0 and self.i[-1] == 0:
            return (-1)^(sum(self.n) - 1) * ISymb(*self.args[:0:-1]).toHSymb(depth)
        elif self.i[0] != 0 and self.i[-1] != 0:
            return sum()
        elif self.i[0] == 0 and self.i[-1] != 0:
            pass
    def __repr__(self):
        return f"I({','.join('a_{'+str(i)+'},0^{'+str(n)+'-1}' for i, n in zip(self.i[:-1], self.n))},a_{{{self.i[-1]}}})"



class HSymb(Indexed):
    def __new__(cls, *args):
        return super().__new__(cls, Li, *args)
    def __init__(self, *args):
        # self.args[0] is the symbol head Li
        self.d = len(args) // 2
        self.m = (0, *args[::2])
        self.n = (0, *args[1::2])
        self.i = list(itertools.accumulate(self.m))
    def __eq__(self, other):
        return self.args == other.args
    def __lt__(self, other):
        if sum(self.n) != sum(other.n):
            return sum(self.n) < sum(other.n)

        if self.i[-1] != other.i[-1]:
            return self.i[-1] < other.i[-1]
        
        for r in range(1, len(self.args)):
            if self.args[-r] != other.args[-r]:
                return self.m[-r] > other.m[-r]

        return False

    def toISymb(self):
        '''
        Turn HSymb into ISymb
        '''
        args = [0, 1]
        for r in range(1, self.d + 1):
            args.extend([self.i[r], self.n[r]])
        args.append(self.i[self.d + 1])
        return ISymb(*args)
        
    def __repr__(self):
        return f'Li{self.args[1:]}'

    def partial_differential(self, r):
        '''
        Take the partial_r of a polylogarithm
        '''
        if self.d == 1 and self.n[1] == 1:
            return -dv[self.i[1], self.i[2] - 1]
        if self.n[r] > 1 or self.d == 1:
            return HSymb(*self.args[1:2*r-1], self.n[r] - 1, *self.args[2*r+1:]) * du[self.i[r], self.i[r+1] - 1]
        elif r == self.d:
            return -HSymb(*self.args[1:-3], self.m[r] + 1 + self.m[r+1]) * dv[self.i[r], self.i[r+1] - 1]
        else:
            return -HSymb(*self.args[1:2*(r-1)], self.m[r] + 1 + self.m[r+1], *self.args[2*(r+1):]) * dv[self.i[r], self.i[r+1] - 1] +\
                    HSymb(*self.args[1:2*r-1], self.n[r+1], self.m[r+1] + 1 + self.m[r+2], *self.args[2*(r+2):]) *\
                    (du[self.i[r], self.i[r+1] - 1] - dv[self.i[r], self.i[r+1] - 1])

    def differential(self):
        '''
        Take the differential of a polylogarithm
        '''
        return sum(self.partial_differential(r) for r in range(1, self.d + 1))



def differential(expr):
    '''
    Take the differential of an element in HSymb
    '''
    if expr.is_Add:
        return sum(differential(arg) for arg in expr.args)
    elif expr.is_Mul:
        return sum(expr / arg * differential(arg) for arg in expr.args if not arg.is_number)
    elif expr.is_Pow:
        return expr.args[1] * expr.args[0] ** (expr.args[1] - 1) * differential(expr.args[0])
    elif expr.is_number:
        return 0
    
    elif isinstance(expr, HSymb):
        return expr.differential()



class tensor():
    def __init__(self, *args):
        self.is_number = False
        # Giving coefficients and terms already
        if len(args) == 2 and all(isinstance(arg, (list, tuple)) for arg in args):
            self.c, self.t = args
        # Giving the arguments of a single raw tensor
        else:
            # expand the args first
            args = [expand(arg) for arg in args]

            self.c, self.t = [], []
            for comp in list(itertools.product(*map(tensor._split_coef, args))):
                c, t = zip(*comp)
                self.c.append(prod(c))
                self.t.append(t)
            
    @staticmethod
    def _split_coef(expr):
        if expr.is_Add:
            return [tensor._split_coef(arg)[0] for arg in expr.args]
        elif expr.is_number:
            return [[expr, 1]]
        elif expr.is_Mul:
            coef = prod(arg for arg in expr.args if arg.is_number)
            return [[coef, expr / coef]]
        else:
            return [[1, expr]]
            
    def __add__(self, other):
        return tensor(self.c + other.c, self.t + other.t)
    def __neg__(self):
        return tensor(list(map(lambda x: -x, self.c)), self.t)
    def __sub__(self, other):
        return self + (-other)
    def __rmul__(self, other):
        # Scalar multiplication (scalar on the left side)
        if isinstance(other, (int, float)) or other.is_number:
            return tensor([c * other for c in self.c], self.t)
        return self * other
    def __mul__(self, other):
        if isinstance(other, (int, float)) or other.is_number:
            return tensor([c * other for c in self.c], self.t)
        return tensor(list(map(prod, itertools.product(self.c, other.c))),
                      [tensor._mul(t1, t2) for t1, t2 in itertools.product(self.t, other.t)])

    @staticmethod
    def _mul(t1, t2):
        if not isinstance(t1, (list, tuple)) or not isinstance(t2, (list, tuple)):
            raise ValueError('Must be a list or a tuple')
        if len(t1) != len(t2):
            raise ValueError('Dimension Mismatch')
        return tuple(map(prod, zip(t1, t2)))
    
    def __repr__(self):
        ct = []
        for c, t in zip(self.c, self.t):
            if c == 1:
                ct.append(f"{t}")
            elif c == -1:
                ct.append(f"-{t}")
            else:
                ct.append(f"{c}*{t}")
                
        return ' + '.join(ct)



class wedge:
    def __init__(self, *comp):
        self.comp = comp
    def __repr__(self):
        return f'{self.comp}'
    def __repr__(self):
        ct = []
        for c, t in zip(self.c, self.t):
            if c == 1:
                ct.append(f"{t}")
            elif c == -1:
                ct.append(f"-{t}")
            else:
                ct.append(f"{c}*{t}")
                
        return ' + '.join(ct)



class VariationMatrix:
    def __init__(self, *args):
        self.args = args
    def firstColumn(self):
        pass
    def complementaryEntry(w1, w2):
        pass
    def __repr__(self):
        return f'{self.args}'





