(* ::Package:: *)



(* ::Title:: *)
(*Multiple polylogarithmic Toolkit*)




BeginPackage["LogToolkit`"]



matrixCommutator::usage = "matrixCommutator[x, y] is the matrix commutator {x, y} = x * y * x^(-1) * y^(-1)";
matrixLieBracket::usage = "matrixLieBracket[x, y] is the Lie bracket [x, y] = x * y - y * x";
matrixPower::usage = "matrixPower[A, k] is the matrix power A^k";
nilpotentMatrixExp::usage = "nilpotentMatrixExp[A] is the exponential of a nilpotent matrix A";
unipotentMatrixInverse::usage = "unipotentMatrixInverse[A] is the inverse of a unipotent matrix A";
unipotentMatrixLog::usage = "unipotentMatrixLog[A] is the logarithm of a unipotent matrix A";
useSubscript::usage = "useSubscript turns Li[{1}, {x_1 x_2}] into -v_1,2, turns Li[{n_1, n_2}, {x_1 x_2, x_3}] into Li_2,1[x_1 x_2], ";
encode::usage = "encode[Li[{n_1, ..., n_d}, {x_}]]";



(* ::Section::Closed:: *)
(*Remark*)



(*---------------------------------------------------------------------------------------------------------------------------------------------------------
Reserved symbols:
x                 :   For symbols in the contraction system
Li                :   For multiple polylogarithms
L                 :   For multiple polylogarithms
d                 :   For differential operators
\[DifferentialD]  :   For differential operators
II                :   For iterated integrals
P                 :   For iterated integrals
wedgeConstants    :   For wedge product
tensorConstants   :   For tensor product
nameHolder        :   For temporary name replacing

Updated protected tags:
Element : updated for wedge and tensor product
Conjugate, Re, Im : updated for complex numbers manipulation

Useful substitution:
/.{Subscript[P, l_]:>PToLi[l]}
/.{Subscript[Li, 1][X___]:>-Subscript[v, (X/.Times->List/.Subscript[x, t_]->t/.List->Sequence)]}
/.{Subscript[Li, N___][X___]:>If[Exponent[{X}[[1]],Variables[{X}[[1]]]][[1]]<1,GoncharovInversion[Reverse[{N}],Reverse[1/{X}]],Subscript[Li, N][X]]}
/.{Subscript[Li, N___][X___]:>If[Exponent[{X}[[1]],Variables[{X}[[1]]]][[1]]<1,GoncharovInversionModuloPiI[Reverse[{N}],Reverse[1/{X}]],Subscript[Li, N][X]]}
/.{Log[X___]:>Subscript[u, (X/.Times->List/.Subscript[x, t_]->t/.List->Sequence)]}
/.{Log[X___]:>Total[Subscript[u, #]&/@Flatten@List[X/.Times->List/.Subscript[x, t_]->t]]}
/.{Subscript[u, k___]:>Subscript[u, (Flatten[(X[[#]]/.Times->List/.Subscript[x, t_]->t)&/@{k}]/.{List->Sequence})],Subscript[v, k___]:>Subscript[v, (Flatten[(X[[#]]/.Times->List/.Subscript[x, t_]->t)&/@{k}]/.{List->Sequence})]}
/.{Subscript[u, k___]:>Total[Subscript[u, #]&/@{k}]}
/.{Subscript[Li, N___][X___]:>If[Exponent[{X}[[1]],Variables[{X}[[1]]]][[1]]<1,GoncharovInversion[Reverse[{N}],Reverse[1/{X}]],Subscript[Li, N][X]]}
/.{Subscript[Li, N___][X___]:>If[Exponent[{X}[[1]],Variables[{X}[[1]]]][[1]]<1,GoncharovInversionModuloPiI[Reverse[{N}],Reverse[1/{X}]],Subscript[Li, N][X]]}
/.{u1->Subscript[u, 1],u2->Subscript[u, 2],u12->Subscript[u, 1,2],du1->d[Subscript[u, 1]],du2->d[Subscript[u, 2]],du12->d[Subscript[u, 1,2]],v1->Subscript[v, 1],v2->Subscript[v, 2],v12->Subscript[v, 1,2],dv1->d[Subscript[v, 1]],dv2->d[Subscript[v, 2]],dv12->d[Subscript[v, 1,2]]}
---------------------------------------------------------------------------------------------------------------------------------------------------------*)



(* ::Section::Closed:: *)
(*Matrix Operations*)



matrixCommutator[x_, y_] := x . y . Inverse[x] . Inverse[y];

matrixLieBracket[x_, y_] := x . y - y . x;

matrixPower[A_, k_] := Module[{n = Dimensions[A][[1]], pow},
    If[
        k == 0, IdentityMatrix[n],
        pow = matrixPower[A, Quotient[k, 2]];
        If[Mod[k, 2] == 0, pow . pow, pow . pow . A]
    ]
];

nilpotentMatrixExp[A_] := Module[{i, n = Dimensions[A][[1]], exp, pow},
    exp = IdentityMatrix[n];
    pow = IdentityMatrix[n];
    For[i = 1, i <= n, i++,
        pow = pow . A;
        If[pow == ConstantArray[0, {n, n}], Return[exp, Module], exp += pow / i!]
    ]
];

unipotentMatrixInverse[A_] := Module[{i, n = Dimensions[A][[1]], I, exp, pow},
    I = IdentityMatrix[n];
    pow = I;
    exp = I;
    For[i = 1, i <= n, i++,
        pow = pow . (I - A);
        If[pow == ConstantArray[0, {n, n}], Return[exp, Module], exp += pow]
    ]
];

unipotentMatrixLog[A_] := Module[{i, n = Dimensions[A][[1]], I, exp, pow},
    exp = ConstantArray[0, {n, n}];
    I = IdentityMatrix[n];
    pow = I;
    For[i = 1, i <= n, i++,
        pow = pow . (I - A);
        If[pow == ConstantArray[0, {n, n}], Return[exp, Module], exp -= pow / i]
    ]
];



(* ::Section::Closed:: *)
(*d (differential), wedge, tensor, mul (noncommutative multiplication), conversion to subscripts (useSubscript)*)



useSubscript[expr_] := 
    expr /. {
        Li[{1}, y_List] :> -Subscript[v, (y[[1]] /. Times -> nameHolder /. Subscript[x, t_] -> t /. nameHolder -> Sequence)],
        Li[n_List, y_List] :> Subscript[Li, (n /. List -> Sequence)][y /. List -> Sequence],
        Log[y___] :> Subscript[u, (y /. Times -> nameHolder /. Subscript[x, t_] -> t /. nameHolder -> Sequence)]
    }

Unprotect[Element];
Element[c_, differentialConstants] := True /; NumericQ[c];
Element[Power[a_, b_], differentialConstants] := True /; Element[a, differentialConstants] && Element[b, differentialConstants];
Element[Plus[a_, b_], differentialConstants] := True /; Element[a, differentialConstants] && Element[b, differentialConstants];
Element[Times[a_, b_], differentialConstants] := True /; Element[a, differentialConstants] && Element[b, differentialConstants];
Element[c_, wedgeConstants] := True /; NumericQ[c];
Element[Power[a_, b_], wedgeConstants] := True /; Element[a, wedgeConstants] && Element[b, wedgeConstants];
Element[Plus[a_, b_], wedgeConstants] := True /; Element[a, wedgeConstants] && Element[b, wedgeConstants];
Element[Times[a_, b_], wedgeConstants] := True /; Element[a, wedgeConstants] && Element[b, wedgeConstants];
Element[c_, tensorConstants] := True /; NumericQ[c];
Element[Power[a_, b_], tensorConstants] := True /; Element[a, tensorConstants] && Element[b, tensorConstants];
Element[Plus[a_, b_], tensorConstants] := True /; Element[a, tensorConstants] && Element[b, tensorConstants];
Element[Times[a_, b_], tensorConstants] := True /; Element[a, tensorConstants] && Element[b, tensorConstants];
Element[c_, mulConstants] := True /; NumericQ[c];
Element[Power[a_, b_], mulConstants] := True /; Element[a, mulConstants] && Element[b, mulConstants];
Element[Plus[a_, b_], mulConstants] := True /; Element[a, mulConstants] && Element[b, mulConstants];
Element[Times[a_, b_], mulConstants] := True /; Element[a, mulConstants] && Element[b, mulConstants];
Protect[Element];

d[T_Times] := Sum[ReplacePart[T, k -> d[T[[k]]]], {k, 1, Length[T]}];
d[P_Power] := P[[1]]^P[[2]] * Log[P[[1]]] * d[P[[2]]] + P[[1]]^(P[[2]] - 1) * P[[2]] * d[P[[1]]];
d[] := 0;
d[a___, S_Plus, b___] := d[a, #, b]& /@ S;
d[c_] := 0 /; Element[c, differentialConstants];

d[Li[{n_Integer}, y_List]] := Li[{n - 1}, y] /; n > 1;
d[Li[n_List, y_List]] := Module[{partial},
    partial[i_Integer] = If[n[[i]] > 1,
        Li[Join[n[[;;i-1]], {n[[i]] - 1}, n[[i+1;;]]], y] * d[Log[y[[i]]]],
        Which[
            i == Length[n], Li[n[[;;-2]], Join[y[[;;-3]], {y[[-2]] * y[[-1]]}]] * d[Li[{1}, {y[[i]]}]],
            i == 1, Li[n[[2;;]], y[[2;;]]] * d[Li[{1}, {y[[1]]}]] -
                    Li[n[[2;;]], Join[{y[[1]] * y[[2]]}, y[[3;;]]]] * (d[Li[{1}, {y[[1]]}]] + d[Log[y[[1]]]]),
            True, Li[Join[n[[;;i-1]], n[[i+1;;]]], Join[y[[;;i-2]], {y[[i-1]] * y[[i]]} ,y[[i+1;;]]]] * d[Li[{1}, {y[[i]]}]] -
                    Li[Join[n[[;;i-1]], n[[i+1;;]]], Join[y[[;;i-1]], {y[[i]] * y[[i+1]]}, y[[i+2;;]]]] * (d[Li[{1}, {y[[i]]}]] + d[Log[y[[i]]]])
        ]
    ];
    Total[partial /@ Range[Length[n]]]
] /; Length[n] > 1;
d[Subscript[Li, N___][Y___]] := d[Li[{N}, {Y}]] // useSubscript;

SetAttributes[d, {Listable, Protected}];

wedge[a___] := a /; Length[{a}] === 1;
wedge[a___, S_Plus, b___] := wedge[a, #, b]& /@ S;
wedge[a___, P_Times, b___] := wedge[a, Expand[P], b] /; (Expand[P] =!= P);
wedge[a___, 0, b___] := 0;
wedge[a___, Times[b___, s_, c___], d___] := s * wedge[a, Times[b, c], d] /; Element[s, wedgeConstants];
SetAttributes[wedge, {Flat, Protected}];
(* wedge product in lexigraphical order *)
sortedWedge[w___] := Signature[{w}] * wedge@@Sort[{w}];

tensor[a___] := a /; Length[{a}] === 1;
tensor[a___, S_Plus, b___] := tensor[a, #, b]& /@ Expand[S];
tensor[a___, P_Times, b___] := tensor[a, Expand[P], b] /; Expand[P] =!= P;
tensor[a___, P_Power, b___] := tensor[a, Expand[P], b] /; Expand[P] =!= P;
tensor[a___, 0, b___] := 0;
tensor[a___, Times[b___, s_, c___], d___] := s * tensor[a, Times[b, c], d] /; Element[s, tensorConstants];
SetAttributes[tensor, {Flat, Protected}];
Unprotect[Times];
Times[a___, s_tensor, b___, t_tensor, c___] := Times[a, b, c, tensor@@(s[[#]] * t[[#]]& /@ Range[Length[s]])] /; Length[s] === Length[t];
Protect[Times];

(* Matrix tensor multiplication *)
matrixTensorDot[A_, B_] := Module[{C = ConstantArray[0, {Dimensions[A][[1]], Dimensions[B][[2]]}], i, j, k},
    If[Dimensions[A][[2]] =!= Dimensions[B][[1]], Throw["Dimensions doesn't match]"]];
    For[i = 1, i <= Dimensions[C][[1]], i++,
        For[j = 1, j <= Dimensions[C][[2]], j++,
            For[k = 1, k <= Dimensions[A][[2]], k++,
                C[[i,j]] += tensor[A[[i,k]], B[[k,j]]]
            ]
        ]
    ];
    C
]

(* Matrix tensor power *)
matrixTensorPower[A_, k_] := Module[{n = Dimensions[A][[1]], pow},
    If[
        pow = matrixTensorPower[A, Quotient[k, 2]];
        If[Mod[k, 2] == 0, matrixTensorDot[pow, pow], matrixTensorDot[matrixTensorDot[matrixTensorDot[pow, pow], A]]
    ]
]

(* Shuffle Product for tensor products *)
shuffleProduct[a_, b_] := tensor[a, b] + tensor[b, a];
shuffleProduct[a_, t_tensor] := tensor[a, t] + Sum[tensor[t[[;;i]], a, t[[i+1;;]]], {i, 1, Length[t]-1}] + tensor[t, a];
shuffleProduct[t_tensor, b_] := tensor[t, b] + Sum[tensor[t[[;;i]], b, t[[i+1;;]]], {i, 1, Length[t]-1}] + tensor[b, t];
shuffleProduct[t1_tensor, t2_tensor] := tensor[t1[[1]], shuffleProduct[t1[[2;;]], t2]] + tensor[t2[[1]], shuffleProduct[t1, t2[[2;;]]]];

mul[] := 1;
mul[a___, S_Plus, b___] := mul[a, #, b]& /@ S;
mul[a___, S_Times, b___] := S[[1]] * mul[a, S[[2]], b] /; NumericQ[S[[1]]];
mul[a___, n_, b___] := n * mul[a, b] /; NumericQ[n];
mulPow[a_, n_] := mul[ConstantArray[a, n] /. List -> Sequence];
Unprotect[d];
d[T_mul] := Sum[ReplacePart[T, k -> d[T[[k]]]], {k, 1, Length[T]}];
Protect[d];
SetAttributes[mul, {Flat}];



(* ::Section::Closed:: *)
(*Helper functions*)


(*KMP algorithm*)
KMP[pat_, txt_] := Module[{table, i, j},
    table = Module[{T = {1}},
        For[i = 2, i <= Length[pat], i++,
            j = T[[i-1]];
            While[j > 1 && pat[[j]] != pat[[i]], j = T[[j-1]]];
            AppendTo[T, If[pat[[j]] == pat[[i]], j+1, j]];
        ];
        T
    ];
    j = 1;
    For[i = 1, i <= Length[txt], i++,
        While[j > 1 && txt[[i]] != pat[[j]], j = table[[j-1]]];
        If[txt[[i]] == pat[[j]], j += 1];
        If[j == Length[pat] + 1, Return[True, Module]];
    ];
    False
];

(*Longest common subsequence*)
LCS[X_, Y_] := Module[{n = Length[X], m = Length[Y], prev, cur, i, j},
    prev = ConstantArray[0, m + 1];
    cur = ConstantArray[0, m + 1];
    For[i = 1, i <= n, i++,
        For[j = 1, j <= m, j++,
            If[X[[i]] === Y[[j]],
                cur[[j + 1]] = 1 + prev[[j]],
                cur[[j + 1]] = Max[cur[[j]], prev[[j + 1]]]
            ]
        ];
        prev = cur
    ];
    Length[X] == cur[[m + 1]]
]

(*moduloProducts modulo any products in any expression*)
moduloProducts[expr_] := Module[{},
    If[NumericQ[expr],
        expr,
        If[Length[MonomialList[expr]] > 1,
            Total[moduloProducts /@ MonomialList[expr]],
            If[Total[Exponent[expr, Variables[expr]]] > 1, 0, expr]
        ]
    ]
]
SetAttributes[moduloProducts, {Listable}];


(* ::Section::Closed:: *)
(*Log encoding, decoding and and sorting multiple polylogarithms*)



encode[Li[n_List, y_List]] := Module[{i, indices, min, max},
    For[i = Length[y], i >= 1, i--,
        indices = (y[[i]] /. Times -> List /. Subscript[x, t_] -> t);
        min = Min[indices];
        max = Max[indices];
        n = Flatten[Insert[n, ConstantArray[0, max - min], {i + 1}]]
    ];
    Flatten[Insert[n, ConstantArray[0, min - 1], {1}]]
]

encodingsCompare[l1_, l2_] := Which[
    Total[l1] != Total[l2], If[Total[l1] < Total[l2], 1, -1],
    Length[l1] != Length[l2], If[Length[l1] < Length[l2], 1, -1],
    True, For[k = d, k >=1, k--,
        If[l1[[k]] < l2[[k]], Return[1], Return[-1]]
    ]
];

encodingsPriorTo[m_] := Module[{r, result = {m}},
    If[m === ConstantArray[0, Length[m]], Return[{}, Module]];
    For[r = 1, r <= Length[m], r++,
        Which[
            m[[r]] === 0, ,
            m[[r]] > 1, result = Join[result, encodingsPriorTo[Join[m[[;;r-1]], {m[[r]] - 1}, m[[r+1;;]]]]],
            r === Length[m], result = Join[result, encodingsPriorTo[Join[m[[;;r-1]], {0}]]],
            True, result = Join[result, encodingsPriorTo[Join[m[[;;r-1]], {0}, m[[r+1;;]]]], encodingsPriorTo[Join[m[[;;r-1]], {m[[r+1]], 0}, m[[r+2;;]]]]]
        ]
    ];
    DeleteDuplicates[result]
];

decode[code_] := Module[{indices = Join[Flatten[Position[code, _?(#!=0&)]], {Length[code] + 1}]},
    Li[
        DeleteCases[code,0],
        Product[x[k], {k, indices[[#]], indices[[# + 1]] - 1}]& /@ Range[Length[indices] - 1]
    ]
];



(* ::Section::Closed:: *)
(*Iterated integrals*)



(*IIToLi and PToLi converts iterated integrals(in the sense of Chen) into multiple polylogarithms*)
IIToLi[args_List] := Module[{
        k, n, i, m, ans, a,
        ind = Join[{1}, Flatten[Position[args[[2;;-2]], _?(#=!=0&), {1}, Heads -> False]], {Length[args]}], (* indices for start and end for nonzero args *)
    },
    m = Length[ind];
    a = args[[ ind[[# + 1]] ]] &;
    n = (ind[[# + 2]] - ind[[# + 1]]) &;
    Which[
        m === 0, 1,
        a[0] === 0 && a[m + 1] === 0, 0,
        a[0] =!= 0 && a[m + 1] === 0, (-1)^Length[args] * IIToLi[Reverse[args]],
        a[0] =!= 0 && a[m + 1] =!= 0,
        Sum[
            Sum[
                IIToLi[Join[args[[;; ind[[k]]]], ConstantArray[0, p - 1]]] * IIToLi[Join[ConstantArray[0, n[k] - p - 1], args[[ind[[k + 1]] ;;]]]],
                {p, 1, n[k] - 1}
            ],
            {k, 0, m}
        ]
        a[0] === 0 && a[m + 1] =!= 0,
        Sum[
            i = partition[[# + 1]] &;
            (-1)^(n[0] + i[0] + d - 1) * Log[a[[m+1]]]^i[0] / i[0]! *
            Product[Binomial[n[k] + i[k] - 1, i[k]], {k, 1, m}] *
            Li[(n[#] + i[#] & /@ Range[m]), (a[# + 1] / a[#] & /@ Range[m])]
            {partition, Flatten[Permutations /@ (IntegerPartitions[n[0] + m, {m + 1}] - 1), 1]}
        ]
    ]
]
PToLi[args_List] := (-1)^Length[DeleteCases[args[[2;;-2]], _?(#===0&)]] * IIToLi[args];


GoncharovInversion[n_List, y_List] := Module[{d = Length[n], r, m, i},
    If[
        d == 0, 1,
        - Sum[
            (-1)^Total[n[[r+1;;]]] * GoncharovInversion[n[[;;r]], y[[;;r]]] * Li[n[[r+1;;]], y[[r+1;;]]],
            {r, 0, d - 1}
        ] - Sum[
            Sum[
                (-1) ^ (Total[n[[r;;]]] + Total[m[[r+1;;]]]) * Product[Binomial[n[[i]] + m[[i]] - 1, m[[i]]], {i, Join[Range[r-1], Range[r+1, d]]}] *
                BernoulliB[m[[r]], Log[Times@@y] / (2*Pi*I)] * GoncharovInversion[n[[;;r-1]] + m[[;;r-1]], y[[;;r-1]]] * Li[n[[r+1;;]] + m[[r+1;;]], y[[r+1;;]]],
                {m, Flatten[Permutations /@ (IntegerPartitions[n[[r]] + d, {d}] - 1), 1]}
            ],
            {r, 1, d}
        ]
    ]
]


(*GoncharovInversionModuloPiI is just modulo \[Pi] \[ImaginaryI] terms*)
GoncharovInversionModuloPiI[n_,x_]:=Module[{d=Length[n],ans=0},
If[d===0,Return[1,Module]];
If[d===1,Return[(-1)^(n[[1]]-1) Subscript[Li, n[[1]]][x[[1]]]+(-1)^(n[[1]]-1) Log[x[[1]]]^n[[1]]/n[[1]]!,Module]];
ans=-\!\(
\*UnderoverscriptBox[\(\[Sum]\), \(r = 0\), \(d - 1\)]\(
\*SuperscriptBox[\((\(-1\))\), \(Total[n[\([\)\(\(r + 1\)\(;;\)\)\(]\)]]\)] GoncharovInversionModuloPiI[n[\([\)\(\(;;\)\(r\)\)\(]\)], x[\([\)\(\(;;\)\(r\)\)\(]\)]] 
\(\*SubscriptBox[\(Li\), \(n[\([\)\(\(r + 1\)\(;;\)\)\(]\)] /. List -> Sequence\)]\)[x[\([\)\(\(r + 1\)\(;;\)\)\(]\)] /. List -> Sequence]\)\)-\!\(
\*UnderoverscriptBox[\(\[Sum]\), \(r = 1\), \(d\)]\(Total[\[IndentingNewLine]\((i |-> \((
\*UnderoverscriptBox[\(\[Product]\), \(p = 1\), \(r - 1\)]Binomial[n[\([\)\(p\)\(]\)] + i[\([\)\(p\)\(]\)] - 1, n[\([\)\(p\)\(]\)] - 1])\) \((
\*UnderoverscriptBox[\(\[Product]\), \(p = r + 1\), \(d\)]Binomial[n[\([\)\(p\)\(]\)] + i[\([\)\(p\)\(]\)] - 1, n[\([\)\(p\)\(]\)] - 1])\) 
\*SuperscriptBox[\((\(-1\))\), \(Total[n[\([\)\(\(r\)\(;;\)\)\(]\)]] + Total[i[\([\)\(\(r + 1\)\(;;\)\)\(]\)]]\)] 
\*FractionBox[
SuperscriptBox[\(Log[Times @@ x]\), \(i[\([\)\(r\)\(]\)]\)], \(i[\([\)\(r\)\(]\)]!\)] GoncharovInversionModuloPiI[n[\([\)\(\(;;\)\(r - 1\)\)\(]\)] + i[\([\)\(\(;;\)\(r - 1\)\)\(]\)], x[\([\)\(\(;;\)\(r - 1\)\)\(]\)]] 
\(\*SubscriptBox[\(Li\), \(n[\([\)\(\(r + 1\)\(;;\)\)\(]\)] + i[\([\)\(\(r + 1\)\(;;\)\)\(]\)] /. List -> Sequence\)]\)[x[\([\)\(\(r + 1\)\(;;\)\)\(]\)] /. List -> Sequence])\) /@ Flatten[Permutations /@ \((IntegerPartitions[n[\([\)\(r\)\(]\)] + d, {d}] - 1)\), 1]]\)\);
ans/.{Subscript[Li][]->1}
]



(* ::Section::Closed:: *)
(*Variation & Monodromy matrices construction*)



IIVariationMatrix[n_List]:=
Module[{d=Length[n],a,X,firstColumn,V,IIdecode,computeEntry,fun,i,j},
Subscript[a, i_]=1/\!\(
\*UnderoverscriptBox[\(\[Product]\), \(k = i\), \(d\)]
\*SubscriptBox[\(x\), \(k\)]\);
IIdecode[code_]:=Join@@(If[code[[#]]===0,{},Join[{\!\(
\*SubsuperscriptBox[\(\[Product]\), \(k = #\), \(Length[code]\)]
\*SuperscriptBox[
SubscriptBox[\(x\), \(k\)], \(-1\)]\)},ConstantArray[0,code[[#]]-1]]]&/@Range[Length[code]]);
fun[l1_,l2_]:=
Module[{result=0,L={},k},
If [Length[l2]===0,Return[If[Length[l1]===2,1,Subscript[P,l1]],Module]];
For[k=2,k<Length[l1],k++,If[l1[[k]]===l2[[1]],L=Join[L,{k}]]];
For[k=1,k<=Length[L],k++,
result=result+If[L[[k]]===2,1,Subscript[P,l1[[;;L[[k]]]]]]*fun[l1[[L[[k]];;]],l2[[2;;]]]
];
result
];
computeEntry[i_,j_]:=fun[Join[{0},firstColumn[[i]],{1}],firstColumn[[j]]];
firstColumn=Join[{{}},IIdecode/@Sort[encodingsPriorTo[n],encodingsCompare]];
V=IdentityMatrix[Length[firstColumn]];V[[All,1]]=Subscript[P,Join[{0},#,{1}]]&/@firstColumn;V[[1,1]]=1;
For[j=2,j<Length[firstColumn],j++,
For[i=j+1,i<=Length[firstColumn],i++,
V[[i,j]]=computeEntry[i,j];
]
];
V
]
LiVariationMatrix[n_]:=IIVariationMatrix[n]/.{Subscript[P, l_]:>PToLi[l]}
GoncharovVariationMatrix[n_]:=LiVariationMatrix[n]/.{Subscript[Li, N___][X___]:>If[Exponent[{X}[[1]],Variables[{X}[[1]]]][[1]]<1,GoncharovInversion[Reverse[{N}],Reverse[1/{X}]],Subscript[Li, N][X]]}
GoncharovVariationMatrixModuloPiI[n_]:=LiVariationMatrix[n]/.{Subscript[Li, N___][X___]:>If[Exponent[{X}[[1]],Variables[{X}[[1]]]][[1]]<1,GoncharovInversionModuloPiI[Reverse[{N}],Reverse[1/{X}]],Subscript[Li, N][X]]}
IIVariationMatrix[n_List,X_List]:=IIVariationMatrix[n]/.{Subscript[x, k_]:>X[[k]]};
LiVariationMatrix[n_List,X_List]:=LiVariationMatrix[n]/.{Subscript[x, k_]:>X[[k]]}
GoncharovVariationMatrix[n_List,X_List]:=GoncharovVariationMatrix[n]/.{Subscript[x, k_]:>X[[k]]}
GoncharovVariationMatrixModuloPiI[n_List,X_List]:=GoncharovVariationMatrixModuloPiI[n]/.{Subscript[x, k_]:>X[[k]]}


tauMatrix[n_List,c_]:=
Module[{d=Length[n],a,L,V,decode,i,j,k,p},
Subscript[a, i_]=1/\!\(
\*UnderoverscriptBox[\(\[Product]\), \(k = i\), \(d\)]
\*SubscriptBox[\(x\), \(k\)]\);
decode[code_]:=Module[{r,List={}},
For[r=1,r<=Length[code],r++,
If[code[[r]]!=0,List=Join[List,{Subscript[a, r]},ConstantArray[0,code[[r]]-1]]]
];
List
];
L=Join[{{0}},Sort[encodingsPriorTo[n],encodingsCompare]];
V=IdentityMatrix[Length[L]];
For[j=1,j<=Length[L],j++,
V[[j,j]]=c^Total[L[[j]]];
];
V
]


monodromyMatrix[{i0_Integer},n_List,V_List]:=
Module[{d=Length[n],M=IdentityMatrix[Dimensions[V][[1]]],a,INDEX,MONODROMY,i,j,k,vars,exps,mono},
Subscript[a, i_]=1/\!\(
\*UnderoverscriptBox[\(\[Product]\), \(k = i\), \(d\)]
\*SubscriptBox[\(x\), \(k\)]\);
INDEX[X_]:=Which[X===0,0,X===1,d+1,True,Min[Variables[1/X]/.Subscript[x, i_]->i]];
(*Computes the extra monodromy of a monomial in an entry in the variation matrix*)
MONODROMY[Integral_]:=
Module[{SingularPoints=Integral[[2]][[2;;-2]],p,q=0,startIdx=INDEX[Integral[[2]][[1]]],endIdx=INDEX[Integral[[2]][[-1]]]},
(-1)^(Length[SingularPoints]-Count[SingularPoints,0]) If[(startIdx*endIdx===0&&DeleteDuplicates[SingularPoints]==={0})||(startIdx*endIdx=!=0&&startIdx<=i0<endIdx&&LCS[DeleteDuplicates[SingularPoints],Join[(Subscript[a, #]&/@Range[i0+1,endIdx-1]),{0}]]),
(-1)^If[endIdx===0,Length[SingularPoints],0]/Count[SingularPoints,0]!,0
]
];
(*Construct the monodromy matrix*)
For[j=1,j<Dimensions[V][[1]],j++,
For[i=j+1,i<=Dimensions[V][[1]],i++,
mono=MonomialList[V[[i,j]]];
For[k=1,k<=Length[mono],k++,
vars=Variables[mono[[k]]];
exps=Exponent[mono[[k]],vars];
M[[i,j]]+=Times@@(MONODROMY[vars[[#]]]^exps[[#]]&/@Range[Length[vars]])*mono[[k]]/(Times@@(vars^exps))
]
]
];
M
]
monodromyMatrix[{i0_Integer},n_List]:=monodromyMatrix[{i0},n,IIVariationMatrix[n]];


monodromyMatrix[{i0_Integer,j0_Integer},n_List,V_List]:=
Module[{d=Length[n],M=IdentityMatrix[Dimensions[V][[1]]],a,INDEX,MONODROMY,i,j,k,vars,exps,mono},
Subscript[a, i_]=1/\!\(
\*UnderoverscriptBox[\(\[Product]\), \(k = i\), \(d\)]
\*SubscriptBox[\(x\), \(k\)]\);
INDEX[X_]:=Which[X===0,0,X===1,d+1,True,Min[Variables[1/X]/.Subscript[x, i_]->i]];
(*Computes the extra monodromy of a monomial in an entry in the variation matrix*)
MONODROMY[Integral_]:=
Module[{SingularPoints=Integral[[2]][[2;;-2]],p,q=0,startIdx=INDEX[Integral[[2]][[1]]],endIdx=INDEX[Integral[[2]][[-1]]]},
(-1)^Length[SingularPoints] Which[startIdx<i0&&endIdx===j0+1&&LCS[SingularPoints,(Subscript[a, #]&/@Range[i0,j0])]&&INDEX[SingularPoints[[1]]]===i0,1,startIdx===i0&&endIdx>j0+1&&LCS[SingularPoints,(Subscript[a, #]&/@Range[i0+1,j0+1])]&&INDEX[SingularPoints[[-1]]]===j0+1,-1,True,0]
];
(*Construct the monodromy matrix*)
For[j=1,j<Dimensions[V][[1]],j++,
For[i=j+1,i<=Dimensions[V][[1]],i++,
mono=MonomialList[V[[i,j]]];
For[k=1,k<=Length[mono],k++,
vars=Variables[mono[[k]]];
exps=Exponent[mono[[k]],vars];
M[[i,j]]+=Times@@(MONODROMY[vars[[#]]]^exps[[#]]&/@Range[Length[vars]])*mono[[k]]/(Times@@(vars^exps))
]
]
];
M
];
monodromyMatrix[{i0_Integer,j0_Integer},n_List]:=monodromyMatrix[{i0,j0},n,IIVariationMatrix[n]];



(* ::Section::Closed:: *)
(*Connection form*)

(*omega computes the connection form of multiple polylogarithms, Omega removes d*)
omega[n_]:=Module[{vec,l=(Join[{1},decode/@Sort[encodingsPriorTo[encode[Subscript[Li, (n/.List->Sequence)][(Subscript[x, #]&/@Range[Length[n]]/.List->Sequence)]]],encodingsCompare]]),ComputeColumn,omega,j},
vec=d[l];
ComputeColumn[i_]:=Which[i===1,vec-Join[ConstantArray[0,1+Length[n]],vec[[2+Length[n];;]]],2<=i,vec-(vec/.{l[[i]]->0})/.{l[[i]]->1}];omega=ConstantArray[0,{Length[l],Length[l]}];
For[j=1,j<=Length[l],j++,
omega[[All,j]]=ComputeColumn[j];
];
omega
];
omega[n_,X_]:=omega[n]/.{Subscript[u, k___]:>Subscript[u, (Flatten[(X[[#]]/.Times->List/.Subscript[x, t_]->t)&/@{k}]/.{List->Sequence})],Subscript[v, k___]:>Subscript[v, (Flatten[(X[[#]]/.Times->List/.Subscript[x, t_]->t)&/@{k}]/.{List->Sequence})]};


Omega[n_]:=omega[n]/.{d[X_]->X};
Omega[n_,X_]:=Omega[n]/.{Subscript[u, k___]:>Subscript[u, (Flatten[(X[[#]]/.Times->List/.Subscript[x, t_]->t)&/@{k}]/.{List->Sequence})],Subscript[v, k___]:>Subscript[v, (Flatten[(X[[#]]/.Times->List/.Subscript[x, t_]->t)&/@{k}]/.{List->Sequence})]};



(* ::Section::Closed:: *)
(*Holomorphic and motivic one forms*)

(*omegaHat computes the connection form of Lifted multiple polylogarithms, whereas the entries are motivic one form, and holomorphic differ by constant, and serve as the differential of Lifted multiple polylogarithms*)
omegaHat[n_]:=d[nilpotentMatrixExp[-Omega[n]]] . nilpotentMatrixExp[Omega[n]]+nilpotentMatrixExp[-Omega[n]] . omega[n] . nilpotentMatrixExp[Omega[n]]//Expand;

holomorphicOneForm[n_]:=omegaHat[n][[-1,1]];

motivicOneForm[n_]:=If[Total[n]===1,-d[Subscript[v, 1]],holomorphicOneForm[n]/(Total[n]-1)];

motivicOneForm[n_,y_]:=Module[{f=Subscript[x, (#/.Times->List/.Subscript[x, t_]->t/.List->Sequence)]&,ff,Seq=(#/.{List->Sequence})&},ff=((f[y[[#]]]/.{Subscript->List})[[2;;]]/.{List->Sequence})&;
motivicOneForm[n]/.{Subscript[u, m___]:>Subscript[u, Seq[ff/@{m}]],Subscript[v, m___]:>Subscript[v, Seq[ff/@{m}]]}]

holomorphicOneForm[n_,y_]:=Module[{f=Subscript[x, (#/.Times->List/.Subscript[x, t_]->t/.List->Sequence)]&,ff,Seq=(#/.{List->Sequence})&},ff=((f[y[[#]]]/.{Subscript->List})[[2;;]]/.{List->Sequence})&;
holomorphicOneForm[n]/.{Subscript[u, m___]:>Subscript[u, Seq[ff/@{m}]],Subscript[v, m___]:>Subscript[v, Seq[ff/@{m}]]}]

(*symbolMap computes the symbol of a multiple polylogarithms*)
Unprotect[Element];
Element[c_, symbolMapConstants] := True /; NumericQ[c];
Element[Power[a_, b_], symbolMapConstants] := True /; Element[a, symbolMapConstants] && Element[b, symbolMapConstants];
Element[Plus[a_, b_], symbolMapConstants] := True /; Element[a, symbolMapConstants] && Element[b, symbolMapConstants];
Element[Times[a_, b_], symbolMapConstants] := True /; Element[a, symbolMapConstants] && Element[b, symbolMapConstants];
Protect[Element];
symbolMap[Subscript[Li, N___][X___]]:=matrixTensorPower[Omega[{N},{X}]\[Transpose],Total[{N}]][[1,-1]];
symbolMap[a___, S_Plus, b___] := symbolMap[a, #, b]& /@ S;
symbolMap[T_Times] := shuffleProduct@@(symbolMap/@List@@T);
symbolMap[P_Power] := shuffleProduct@@ConstantArray[symbolMap[P[[1]]],P[[2]]];


(* ::Section::Closed:: *)
(*Coproduct and cobracket*)



(*GoncharovCoproduct comoputes the coproduct of multiple polylogarithms Hopf algebra with inverses*)
ClearAll[GoncharovCoproduct];
GoncharovCoproduct[n_,y_]:=Module[{d,a,leftPart,rightPart,V,IIdecode,fun,i,j},
d=Length[n];Subscript[a, i_]=1/\!\(
\*UnderoverscriptBox[\(\[Product]\), \(k = i\), \(d\)]
\*SubscriptBox[\(x\), \(k\)]\);
IIdecode[code_]:=Join@@(If[code[[#]]===0,{},Join[{\!\(
\*SubsuperscriptBox[\(\[Product]\), \(k = #\), \(Length[code]\)]
\*SuperscriptBox[
SubscriptBox[\(x\), \(k\)], \(-1\)]\)},ConstantArray[0,code[[#]]-1]]]&/@Range[Length[code]]);
fun[l1_,l2_]:=
Module[{result=0,L={},k},
If [Length[l2]===0,Return[If[Length[l1]===2,1,Subscript[P,l1]],Module]];
For[k=2,k<Length[l1],k++,If[l1[[k]]===l2[[1]],L=Join[L,{k}]]];
For[k=1,k<=Length[L],k++,
result=result+If[L[[k]]===2,1,Subscript[P,l1[[;;L[[k]]]]]]*fun[l1[[L[[k]];;]],l2[[2;;]]]
];
result
];
leftPart=Join[{{}},IIdecode/@Sort[encodingsPriorTo[encode[Subscript[Li, n/.List->Sequence][y/.List->Sequence]]],encodingsCompare]];
rightPart=(fun[Join[{0},leftPart[[-1]],{1}],leftPart[[#]]]&/@Range[Length[leftPart]])/.{Subscript[P, l_]:>PToLi[l]};
leftPart=(Subscript[P, Join[{0},#,{1}]]&/@leftPart)/.{Subscript[P, l_]:>PToLi[l]};
Total[tensor[leftPart[[#]],rightPart[[#]]]&/@Range[Length[leftPart]]]
]

(*GoncharovCoproduct comoputes the coproduct of multiple polylogarithms Hopf algebra without inverses*)
LiCoproduct[n_,y_]:=GoncharovCoproduct[n,y]/.{Subscript[Li, N___][X___]:>If[Exponent[{X}[[1]],Variables[{X}[[1]]]][[1]]<1,GoncharovInversionModuloPiI[Reverse[{N}],Reverse[1/{X}]],Subscript[Li, N][X]]};


(*GoncharovCobracket comoputes the cobracket of multiple polylogarithms Lie coalgebra with inverses*)
GoncharovCobracket[n_,y_]:=Module[{d,a,leftPart,rightPart,V,IIdecode,fun,i,j},
d=Length[n];Subscript[a, i_]=1/\!\(
\*UnderoverscriptBox[\(\[Product]\), \(k = i\), \(d\)]
\*SubscriptBox[\(x\), \(k\)]\);
IIdecode[code_]:=Join@@(If[code[[#]]===0,{},Join[{\!\(
\*SubsuperscriptBox[\(\[Product]\), \(k = #\), \(Length[code]\)]
\*SuperscriptBox[
SubscriptBox[\(x\), \(k\)], \(-1\)]\)},ConstantArray[0,code[[#]]-1]]]&/@Range[Length[code]]);
fun[l1_,l2_]:=
Module[{result=0,L={},k},
If [Length[l2]===0,Return[If[Length[l1]===2,1,Subscript[P,l1]],Module]];
For[k=2,k<Length[l1],k++,If[l1[[k]]===l2[[1]],L=Join[L,{k}]]];
For[k=1,k<=Length[L],k++,
result=result+If[L[[k]]===2,1,Subscript[P,l1[[;;L[[k]]]]]]*fun[l1[[L[[k]];;]],l2[[2;;]]]
];
result
];
leftPart=Join[{{}},IIdecode/@Sort[encodingsPriorTo[encode[Subscript[Li, n/.List->Sequence][y/.List->Sequence]]],encodingsCompare]];
rightPart=(fun[Join[{0},leftPart[[-1]],{1}],leftPart[[#]]]&/@Range[Length[leftPart]])/.{Subscript[P, l_]:>PToLi[l]};
leftPart=(Subscript[P, Join[{0},#,{1}]]&/@leftPart)/.{Subscript[P, l_]:>PToLi[l]};
Total[sortedWedge[moduloProducts[leftPart[[#]]],moduloProducts[rightPart[[#]]]]&/@Range[Length[leftPart]]]
]

(*GoncharovCobracket comoputes the cobracket of multiple polylogarithms Lie coalgebra with inverses*)
LiCobracket[n_List, y_List] := GoncharovCobracket[n, y] /. {
    Subscript[Li, N___][X___]
    Li[m_List, z_List] :> If[Exponent[z[[1]], Variables[z[[1]]]][[1]] < 1,
        moduloProducts[GoncharovInversionModuloPiI[Reverse[m], Reverse[1 / z]]],
        Li[m, z]
    ]
};



(* ::Section::Closed:: *)
(*Conjugation & Single-valued Li*)



Unprotect[Conjugate, Re, Im];
Conjugate[a___, S_Plus, b___] := Conjugate[a, #, b]& /@ S;
Re[a___, S_Plus, b___] := Re[a, #, b]& /@ S;
Im[a___, S_Plus, b___] := Im[a, #, b]& /@ S;
Conjugate[a___, T_Times, b___] := Conjugate[a, #, b]& /@ T;
Conjugate[P_Power] := Conjugate[P[[1]]] ^ P[[2]];
Protect[Conjugate, Re, Im];


SingleValuedLi[n_List] := Module[{V, SV},
    V = GoncharovVariationMatrixModuloPiI[n];
    SV = I^(2Floor[Total[n]/2]-1) / 2 * unipotentMatrixLog[tauMatrix[n, I] . V . tauMatrix[n,-1] . Conjugate[unipotentMatrixInverse[V]] . tauMatrix[n,I]];
    SV[[-1,1]] /. {Li[m_List, y_List] :> Re[Li[m, y]] + I * Im[Li[m, y]], Log[y___] :> Re[Log[y]] + I * Im[Log[y]]} // Expand
]


EndPackage[]