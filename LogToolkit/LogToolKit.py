import itertools
from IPython.display import display, Math
from sympy import *
from sympy.utilities.iterables import partitions


# Reserve some symbol heads
II = IndexedBase('II') # Iterated integrals
L = IndexedBase('L') # Multiple polylogs encodings
Li = IndexedBase('Li') # Multiple polylogs
du = IndexedBase('du') # du
dv = IndexedBase('dv') # dv
otimes = IndexedBase('otimes') # Tensor
wedge = IndexedBase('wedge') # Wedge





class QQAlgebraic:
    '''
    Implementatino of rationally algebraic expression
    '''



    def __init__(self, expr):
        # similify and expand the expr first
        expr = expand(simplify(expr))

        # test whether the expr is rationally algebraic
        if not QQAlgebraic.is_valid(expr):
            raise ValueError("This is not valid")

        self.expr = expr
        self.deg = QQAlgebraic.degree(expr)



    def __eq__(self, other):
        return self.expr == other.expr




    @staticmethod
    def is_valid(expr):
        '''
        Test whether an expression is algebraic
        '''
        if expr.is_Add or expr.is_Mul:
            return all(QQAlgebraic.is_valid(arg) for arg in expr.args)
        elif expr.is_Pow:
            return QQAlgebraic.is_valid(expr.args[0]) and expr.args[1].is_integer and expr.args[1] >= 0
        
        return expr.is_rational or expr.is_symbol



    @staticmethod
    def degree(expr):
        '''
        Get the degree of an ISymb
        '''
        if expr.is_Add:
            return max(QQAlgebraic.degree(arg) for arg in expr.args)
        elif expr.is_Mul:
            return sum(QQAlgebraic.degree(arg) for arg in expr.args)
        elif expr.is_Pow:
            return QQAlgebraic.degree(expr.args[0]) * expr.args[1]
        return 1 if expr.is_symbol else 0



    def __add__(self, other):
        if isinstance(other, QQAlgebraic):
            return QQAlgebraic(self.expr + other.expr)
        if isinstance(other, int) or other.is_rational:
            return QQAlgebraic(self.expr + other)
        return NotImplemented
    def __radd__(self, other):
        if isinstance(other, QQAlgebraic):
            return QQAlgebraic(self.expr + other.expr)
        if isinstance(other, int) or other.is_rational:
            return QQAlgebraic(self.expr + other)
        return NotImplemented

    def __mul__(self, other):
        if isinstance(other, QQAlgebraic):
            return QQAlgebraic(self.expr * other.expr)
        if isinstance(other, int) or other.is_rational:
            return QQAlgebraic(self.expr * other)
        return NotImplemented
    def __rmul__(self, other):
        if isinstance(other, QQAlgebraic):
            return QQAlgebraic(self.expr * other.expr)
        if isinstance(other, int) or other.is_rational:
            return QQAlgebraic(self.expr * other)
        return NotImplemented

    def __neg__(self):
        return QQAlgebraic(-self.expr)

    def __pow__(self, other):
        if isinstance(other, int):
            if other == 0:
                return 1
            elif other == 1:
                return QQAlgebraic(self.expr)
            elif other > 1:
                return QQAlgebraic(self.expr ** other)
        return NotImplemented

    def __sub__(self, other):
        if isinstance(other, QQAlgebraic):
            return QQAlgebraic(self.expr - other.expr)
        if isinstance(other, int) or other.is_rational:
            return QQAlgebraic(self.expr - other)
        return NotImplemented
    def __rsub__(self, other):
        if isinstance(other, QQAlgebraic):
            return QQAlgebraic(-self.expr + other.expr)
        if isinstance(other, int) or other.is_rational:
            return QQAlgebraic(-self.expr + other)
        return NotImplemented




    def _repr_latex_(self):
        return "$\\displaystyle " + QQAlgebraic._toLaTeX(self.expr) + "$"

    @staticmethod
    def _toLaTeX(expr):
        if expr.is_number:
            LaTeX_string = expr._repr_latex_()
        elif expr.is_Add:
            LaTeX_string = f"{'+'.join(QQAlgebraic._toLaTeX(arg) for arg in expr.args)}"
        elif expr.is_Mul:
            LaTeX_string = f"{''.join(QQAlgebraic._toLaTeX(arg) for arg in expr.args)}"
        elif expr.is_Pow:
            LaTeX_string = f"{QQAlgebraic._toLaTeX(expr.args[0])}^{expr.args[1]}"
        elif expr.is_symbol:
            LaTeX_string = expr._repr_latex_()

        return LaTeX_string.replace("$", "").replace("\\displaystyle", "")



class ISymb(Indexed):
    '''
    Implementation of an iterated integral symbol
    '''
    def __new__(cls, *args, **kwargs):
        if not ISymb.is_valid(*args):
            raise ValueError("This is not valid")
        return super().__new__(cls, II, *args, **kwargs)


    def __init__(self, *args):
        self.weights = sum(args[1::2])


    @staticmethod
    def is_valid(*args):
        if len(args) % 2 == 0:
            return False

        m = len(args) // 2 - 1
        i = lambda index: args[2 * index] if index > 0 else 0
        n = lambda index: args[1 + 2 * index]

        return m > 0 and all(n(r) >= 1 and i(r) < i(r+1) for r in range(m + 1))


    def __lt__(self, other):
        if self.weights != other.weights:
            return self.weights < other.weights
        
        m = len(self.args) // 2 - 2
        m_ = len(other.args) // 2 - 2
        i = lambda r: self.args[1 + 2 * r] if r > 0 else 0
        i_ = lambda r: other.args[1 + 2 * r] if r > 0 else 0
        n = lambda r: self.args[2 + 2 * r]
        n_ = lambda r: other.args[2 + 2 * r]

        if i(m+1) != i_(m_+1):
            return i(m+1) < i_(m_+1)
        for r in range(0, m+1):
            if n(m-r) != n_(m_-r):
                return n(m-r) > n_(m_-r)
            if i(m-r) - i(m-r-1) != i_(m_-r) - i_(m_-r-1):
                return i(m-r) - i(m-r-1) > i_(m_-r) - i_(m_-r-1)

        return False


    def to_HSymbExpr(self, d):
        '''
        Phi: ISymb(d) -> HSymbExpr(d), given depth d
        '''
        m = len(self.args) // 2 - 2
        i = lambda r: self.args[1 + 2 * r] if r > 0 else 0
        n = lambda r: self.args[2 + 2 * r]
        if m == 1:
            return 1
        elif i(0) == 0 and i(-1) == 0:
            return 0
        elif i(0) != 0 and i(-1) == 0:
            pass
            # return (-1)^(sum(n) - 1) * ISymbExpr(*self.args[:0:-1]).toHSymbExpr(d)
        elif i(0) != 0 and i(-1) != 0:
            return sum()
        elif i(0) == 0 and i(-1) != 0:
            pass
        

    def _repr_latex_(self):
        m = len(self.args) // 2 - 2
        i = lambda r: self.args[1 + 2 * r] if r > 0 else 0
        n = lambda r: self.args[2 + 2 * r]

        arglist = []
        for r in range(m + 1):
            arglist.append(f"a_{{{i(r)}}}")
            if n(r) == 2:
                arglist.append(f"0")
            elif n(r) > 2:
                arglist.append(f"0^{{{n(r)-1}}}")
        arglist.append(f"a_{{{i(m+1)}}}")
        
        return f"I({','.join(arglist)})".replace("$", "").replace("\\displaystyle", "")



class ISymbExpr(QQAlgebraic):
    '''
    Implementation of ISymb exrpressions
    '''



    def __init__(self, expr):
        
        if isinstance(expr, ISymb):
            self.expr = expr
            self.deg = 1
            return

        print(expr)

        # similify and expand the expr first
        expr = expand(simplify(expr))
        

        # test whether the expr is rationally algebraic
        if not ISymbExpr.is_valid(expr):
            raise ValueError("This is not valid")

        self.expr = expr
        self.deg = QQAlgebraic.degree(expr)



    def __lt__(self, other):
        if self.deg != other.deg:
            return self.deg < other.deg
        pass



    @staticmethod
    def is_valid(expr):
        '''
        Test whether an expression is a valid ISymbExpr
        '''
        
        if expr.is_Add or expr.is_Mul:
            return all(ISymbExpr.is_valid(arg) for arg in expr.args)
        elif expr.is_Pow:
            return ISymbExpr.is_valid(expr.args[0]) and expr.args[1].is_integer and expr.args[1] >= 0
        return expr.is_rational or isinstance(expr, ISymb)



    def __add__(self, other):
        if isinstance(other, ISymbExpr):
            return ISymbExpr(self.expr + other.expr)
        if isinstance(other, (int, ISymb)) or other.is_rational:
            return ISymbExpr(self.expr + other)
        return NotImplemented
    def __radd__(self, other):
        if isinstance(other, ISymbExpr):
            return ISymbExpr(self.expr + other.expr)
        if isinstance(other, (int, ISymb)) or other.is_rational:
            return ISymbExpr(self.expr + other)
        return NotImplemented

    def __mul__(self, other):
        if isinstance(other, ISymbExpr):
            return ISymbExpr(self.expr * other.expr)
        if isinstance(other, (int, ISymb)) or other.is_rational:
            return ISymbExpr(self.expr * other)
        return NotImplemented
    def __rmul__(self, other):
        if isinstance(other, ISymbExpr):
            return ISymbExpr(self.expr * other.expr)
        if isinstance(other, (int, ISymb)) or other.is_rational:
            return ISymbExpr(self.expr * other)
        return NotImplemented

    def __neg__(self):
        return ISymbExpr(-self.expr)

    def __pow__(self, other):
        if isinstance(other, (int, ISymb)):
            if other == 0:
                return 1
            elif other == 1:
                return ISymbExpr(self.expr)
            elif other > 1:
                return ISymbExpr(self.expr ** other)
        return NotImplemented

    def __sub__(self, other):
        if isinstance(other, ISymbExpr):
            return ISymbExpr(self.expr - other.expr)
        if isinstance(other, (int, ISymb)) or other.is_rational:
            return ISymbExpr(self.expr - other)
        return NotImplemented
    def __rsub__(self, other):
        if isinstance(other, ISymbExpr):
            return ISymbExpr(-self.expr + other.expr)
        if isinstance(other, (int, ISymb)) or other.is_rational:
            return ISymbExpr(-self.expr + other)
        return NotImplemented



    def toHSymbExpr(self, d):
        '''
        Phi: ISymbExpr(d) -> HSymbExpr(d), given depth d
        '''
        if self.expr.is_number:
            return self
        elif self.expr.is_Pow:
            return self.args[0].toHSymbExpr(d) ** self.expr.args[1]
        elif self.expr.is_Mul:
            return prod(arg.toHSymbExpr(d) for arg in self.expr.args)
        elif self.expr.is_Add:
            return sum(arg.toHSymbExpr(d) for arg in self.expr.args)
        elif isinstance(self.expr, ISymb):
            self.expr.to_HSymbExpr(d)



    def _repr_latex_(self):
        return "$\\displaystyle " + ISymbExpr._toLaTeX(self.expr) + "$"

    @staticmethod
    def _toLaTeX(expr):
        if expr.is_number:
            LaTeX_string = expr._repr_latex_()
        elif expr.is_Add:
            LaTeX_string = f"{'+'.join(ISymbExpr._toLaTeX(arg) for arg in expr.args)}"
        elif expr.is_Mul:
            LaTeX_string = f"{''.join(ISymbExpr._toLaTeX(arg) for arg in expr.args)}"
        elif expr.is_Pow:
            LaTeX_string = f"{ISymbExpr._toLaTeX(expr.args[0])}^{expr.args[1]}"
        elif isinstance(expr, ISymb):
            LaTeX_string = expr._repr_latex_()

        return LaTeX_string.replace("$", "").replace("\\displaystyle", "")



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



class HSymbExpr(QQAlgebraic):
    '''
    Implementatino of HSymb expressions
    '''



    def __init__(self, expr):
        expr = expand(simplify(expr))
        if not HSymb.is_HSymb(expr):
            raise ValueError("This is not an HSymb")

        self.expr = expr
        self.deg = HSymb.degree(expr)



    def __lt__(self, other):
        pass



    @staticmethod
    def is_HSymb(expr):
        '''
        Test whether an expression is a valid ISymb
        '''
        if expr.is_Add or expr.is_Mul:
            return all(HSymb.is_HSymb(arg) for arg in expr.args)
        elif expr.is_Pow:
            return HSymb.is_HSymb(expr.args[0]) and expr.args[1].is_integer and expr.args[1] >= 0

        elif expr.is_Indexed and expr.base == Li and len(expr.args) % 2 == 0:
            d = len(expr.args) // 2 - 1
            m = lambda index: expr.args[1 + 2 * index] if index > 0 else 0
            n = lambda index: expr.args[2 + 2 * index]
            return d > 0 and all(m(r) >= 1 and n(r) >= 1 for r in range(d + 1)) and m(d + 1) >= 1
        
        return expr.is_rational



    @staticmethod
    def degree(expr):
        '''
        Get the degree of an HSymb
        '''
        if expr.is_Add:
            return max(HSymb.degree(arg) for arg in expr.args)
        elif expr.is_Mul:
            return sum(HSymb.degree(arg) for arg in expr.args)
        elif expr.is_Pow:
            return HSymb.degree(expr.args[0]) * expr.args[1]
        return 1 if expr.is_Indexed else 0



    def __add__(self, other):
        if isinstance(other, HSymb):
            return HSymb(self.expr + other.expr)
        if isinstance(other, int) or other.is_rational:
            return HSymb(self.expr + other)
        return NotImplemented
    def __radd__(self, other):
        if isinstance(other, HSymb):
            return HSymb(self.expr + other.expr)
        if isinstance(other, int) or other.is_rational:
            return HSymb(self.expr + other)
        return NotImplemented

    def __mul__(self, other):
        if isinstance(other, HSymb):
            return HSymb(self.expr * other.expr)
        if isinstance(other, int) or other.is_rational:
            return HSymb(self.expr * other)
        return NotImplemented
    def __rmul__(self, other):
        if isinstance(other, HSymb):
            return HSymb(self.expr * other.expr)
        if isinstance(other, int) or other.is_rational:
            return HSymb(self.expr * other)
        return NotImplemented

    def __neg__(self):
        return HSymb(-self.expr)

    def __pow__(self, other):
        if isinstance(other, int):
            if other == 0:
                return 1
            elif other == 1:
                return HSymb(self.expr)
            elif other > 1:
                return HSymb(self.expr ** other)
        return NotImplemented

    def __sub__(self, other):
        if isinstance(other, ISymb):
            return ISymb(self.expr - other.expr)
        if isinstance(other, int) or other.is_rational:
            return ISymb(self.expr - other)
        return NotImplemented
    def __rsub__(self, other):
        if isinstance(other, ISymb):
            return ISymb(-self.expr + other.expr)
        if isinstance(other, int) or other.is_rational:
            return ISymb(-self.expr + other)
        return NotImplemented



    def toISymb(self):
        '''
        Turn HSymb into ISymb
        '''
        args = [0, 1]
        for r in range(1, self.d + 1):
            args.extend([self.i[r], self.n[r]])
        args.append(self.i[self.d + 1])
        return ISymb(*args)



    @staticmethod
    def partial_differential(expr, r):
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



    def _repr_latex_(self):
        return "$\\displaystyle " + ISymb._ISymbToLaTeX(self.expr) + "$"

    @staticmethod
    def _ISymbToLaTeX(expr):
        if expr.is_number:
            return expr._repr_latex_()[1:-1]
        elif expr.is_Add:
            return f"{'+'.join(ISymb._ISymbToLaTeX(arg) for arg in expr.args)}"
        elif expr.is_Mul:
            return f"{''.join(ISymb._ISymbToLaTeX(arg) for arg in expr.args)}"
        elif expr.is_Pow:
            return f"{ISymb._ISymbToLaTeX(expr.args[0])}^{expr.args[1]}"

        elif expr.is_Indexed:
            m = len(expr.args) // 2 - 2
            i = lambda index: expr.args[1 + 2 * index] if index > 0 else 0
            n = lambda index: expr.args[2 + 2 * index]

            arglist = []
            for r in range(m + 1):
                arglist.append(f"a_{{{i(r)}}}")
                if n(r) == 2:
                    arglist.append(f"0")
                elif n(r) > 2:
                    arglist.append(f"0^{{{n(r)-1}}}")
            arglist.append(f"a_{{{i(m+1)}}}")
            return f"I({','.join(arglist)})"



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





