(* ::Package:: *)



(* ::Title:: *)
(*Multiple polylogarithmic Toolkit*)




BeginPackage["LogToolkit`"]



matrixCommutator::usage = "matrixCommutator[x, y] is the matrix commutator {x, y} = x * y * x^(-1) * y^(-1)";
matrixLieBracket::usage = "matrixLieBracket[x, y] is the Lie bracket [x, y] = x * y - y * x";
matrixPower::usage = "matrixPower[A, k] is the matrix power A^k";
nilpotentMatrixExp::usage = "nilpotentMatrixExp[A] is the exponential of a nilpotent matrix A";
unipotentMatrixInverse::usage = "unipotentMatrixInverse[A] is the inverse of a unipotent matrix A"
unipotentMatrixLog::usage = "unipotentMatrixLog[A] is the logarithm of a unipotent matrix A"



(* ::Section::Closed:: *)
(*Remark*)



(*---------------------------------------------------
Reserved symbols:
Li                :   For multiple polylogarithms
li                :   For multiple polylogarithms
L                 :   For multiple polylogarithms
d                 :   For differential operators
\[DifferentialD]  :   For differential operators
II                :   For iterated integrals
P                 :   For iterated integrals
wedgeConstants    :   For wedge product
tensorConstants   :   For tensor product

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
---------------------------------------------------*)



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
(*Differential*)

Unprotect[Element];
Element[c_, differentialConstants] := True /; NumericQ[c];
Element[Power[a_, b_], differentialConstants] := True /; Element[a, differentialConstants] && Element[b, differentialConstants];
Element[Plus[a_, b_], differentialConstants] := True /; Element[a, differentialConstants] && Element[b, differentialConstants];
Element[Times[a_, b_], differentialConstants] := True /; Element[a, differentialConstants] && Element[b, differentialConstants];
Protect[Element];
d[T_Times] := Sum[ReplacePart[T, k -> d[T[[k]]]], {k, 1, Length[T]}];
d[P_Power]:=P[[1]]^P[[2]] * Log[P[[1]]] * d[P[[2]]] + P[[1]]^(P[[2]] - 1) * P[[2]] * d[P[[1]]];
d[] := 0;
d[a___, S_Plus, b___] := d[a, #, b]& /@ S;
d[c_] := 0 /; Element[c, differentialConstants];
d[li[n_List, y_List]] := Module[{i, ind},
    (*gather the indices*)
    index = (y[[#]] /. Times -> List /. Subscript[x, t_] -> t /. List -> Sequence)&;
    partial = Function[i,
        If[n[[i]] > 1, li[Join[n[[;;i-1]], {n[[i]] - 1}, n[[i+1;;]]]), y] * d[Subscript[u, index[i]]],
    Which[i===Length[n],-Subscript[Li, (n[[;;-2]]/.List->Sequence)][(Join[y[[;;-3]],{y[[-2]]y[[-1]]}]/.List->Sequence)]d[Subscript[v, ind[-1]]],
    i===1,-Subscript[Li, (n[[2;;]]/.List->Sequence)][(y[[2;;]]/.List->Sequence)]d[Subscript[v, ind[1]]]+Subscript[Li, (n[[2;;]]/.List->Sequence)][(Join[{y[[1]]y[[2]]},y[[3;;]]]/.List->Sequence)](d[Subscript[v, ind[1]]]-d[Subscript[u, ind[1]]]),
    True,-Subscript[Li, (Join[n[[;;i-1]],n[[i+1;;]]]/.List->Sequence)][(Join[y[[;;i-2]],{y[[i-1]]y[[i]]},y[[i+1;;]]]/.List->Sequence)]d[Subscript[v, ind[i]]]+Subscript[Li, (Join[n[[;;i-1]],n[[i+1;;]]]/.List->Sequence)][(Join[y[[;;i-1]],{y[[i]]y[[i+1]]},y[[i+2;;]]]/.List->Sequence)]*(d[Subscript[v, ind[i]]]-d[Subscript[u, ind[i]]])
    ]]];
    Total[partial /@ Range[Length[n]]]
];
d[Subscript[Li, N___][Y___]] := d[li[List[N], List[Y]]];
(*d[Log[Y___]]:=d[Subscript[u, (Y/.Times\[Rule]List/.Subscript[x, t_]->t/.List\[Rule]Sequence)]];*)
(*d[Subscript[u, n___]]:=Total[(d[Subscript[u, #]]&/@{n})]/;Length[{n}]>1;*)
SetAttributes[d, {Listable, Protected}];

(* ::Section::Closed:: *)
(*Wedge*)

ClearAll[wedge,wedgeConstants];
Unprotect[Element];
(*Element[c_,wedgeConstants]:=True /; (MemberQ[{t},c]);*)
(*Element[c_,wedgeConstants]:=True /; (c\[Element]\[DoubleStruckCapitalZ] \[Or] c\[Element]\[DoubleStruckCapitalQ] \[Or] c\[Element]\[DoubleStruckCapitalR] \[Or] c\[Element]\[DoubleStruckCapitalC]);*)
Element[c_,wedgeConstants]:=True /; NumericQ[c];
Element[Power[a_,b_],wedgeConstants]:=True /; (a\[Element]wedgeConstants\[And]b\[Element]wedgeConstants);
Element[Plus[a_,b_],wedgeConstants]:=True /;  (a\[Element]wedgeConstants\[And]b\[Element]wedgeConstants);
Element[Times[a_,b_],wedgeConstants]:=True /; (a\[Element]wedgeConstants\[And]b\[Element]wedgeConstants);
Protect[Element];
wedge[a___]:=a /; (Length[{a}]===1);
wedge[a___,S_Plus,b___]:=wedge[a,#,b]&/@S;
wedge[a___, P_Times, b___]:= wedge[a, Expand[P], b] /; (Expand[P] =!= P);
wedge[a___,0,b___] := 0;
wedge[a___, Times[b___,s_,c___], d___]:=s*wedge[a,Times[b,c],d] /; s\[Element]wedgeConstants;
SetAttributes[wedge,{Flat,Protected}];
sortedWedge[w___]:=Signature[{w}]wedge@@Sort[{w}];

(* ::Section::Closed:: *)
(*Tensor*)

ClearAll[tensor,tensorConstants];
Unprotect[Element];
Element[c_,tensorConstants]:=True /; NumericQ[c];
Element[Power[a_,b_],tensorConstants]:=True /; (a\[Element]tensorConstants\[And]b\[Element]tensorConstants);
Element[Plus[a_,b_],tensorConstants]:=True /;  (a\[Element]tensorConstants\[And]b\[Element]tensorConstants);
Element[Times[a_,b_],tensorConstants]:=True /; (a\[Element]tensorConstants\[And]b\[Element]tensorConstants);
Protect[Element];
tensor[a___]:=a /; Length[{a}]===1;
tensor[a___,S_Plus,b___]:=tensor[a,#,b]&/@Expand[S];
tensor[a___, P_Times, b___]:= tensor[a, Expand[P], b] /; Expand[P] =!= P;
tensor[a___, P_Power, b___]:= tensor[a, Expand[P], b] /; Expand[P] =!= P;
tensor[a___,0,b___] := 0;
tensor[a___, Times[b___,s_,c___], d___]:=s*tensor[a,Times[b,c],d] /; s\[Element]tensorConstants;
SetAttributes[tensor,{Flat,Protected}];
Unprotect[Times];
Times[a___,s_tensor,b___,t_tensor,c___]:=Times[a,b,c,tensor@@(s[[#]]t[[#]]&/@Range[Length[s]])] /; Length[s]===Length[t];
Protect[Times];


ClearAll[matrixTensorDot,matrixTensorPower]
matrixTensorDot[A_,B_]:=Module[{C=ConstantArray[0,{Dimensions[A][[1]],Dimensions[B][[2]]}],i,j,k},
If[Dimensions[A][[2]]=!=Dimensions[B][[1]],Throw["Dimensions doesn't match]"]];
For[i=1, i<= Dimensions[C][[1]],i++,
For[j=1, j<= Dimensions[C][[2]],j++,
For[k=1, k<= Dimensions[A][[2]],k++,
C[[i,j]] += tensor[A[[i,k]],B[[k,j]]]
]
]
];
C
]
matrixTensorPower[A_,n_]:=Which[n<0 \[Or] Dimensions[A][[1]]=!=Dimensions[A][[2]],Throw["Error"],n===0,IdentityMatrix[Dimensions[A][[1]]],n>0,Nest[matrixTensorDot[A,#]&,A,n-1]];


ClearAll[shuffleProduct];
shuffleProduct[a_,b_]:=tensor[a,b]+tensor[b,a];
shuffleProduct[a_,t_tensor]:=tensor[a,t]+\!\(
\*UnderoverscriptBox[\(\[Sum]\), \(i = 1\), \(Length[t] - 1\)]\(tensor[t[\([\)\(\(;;\)\(i\)\)\(]\)], a, t[\([\)\(\(i + 1\)\(;;\)\)\(]\)]]\)\)+tensor[t,a];
shuffleProduct[t_tensor,b_]:=tensor[t,b]+\!\(
\*UnderoverscriptBox[\(\[Sum]\), \(i = 1\), \(Length[t] - 1\)]\(tensor[t[\([\)\(\(;;\)\(i\)\)\(]\)], b, t[\([\)\(\(i + 1\)\(;;\)\)\(]\)]]\)\)+tensor[b,t];
shuffleProduct[t1_tensor, t2_tensor]:=tensor[t1[[1]],shuffleProduct[t1[[2;;]],t2]]+tensor[t2[[1]],shuffleProduct[t1,t2[[2;;]]]];

(* ::Section::Closed:: *)
(*mul*)

ClearAll[mul,mulPow];
mul[]:=1;
mul[a___,S_Plus,b___]:=mul[a,#,b]&/@S;
mul[a___,S_Times,b___]:=S[[1]]*mul[a,S[[2]],b]/;NumericQ[S[[1]]];
mul[a___,n_,b___]:=n*mul[a,b]/;NumericQ[n];
mulPow[a_,n_]:=mul[ConstantArray[a,n]/.List->Sequence];
SetAttributes[mul,{Flat}];
d[T_mul]:=\!\(
\*UnderoverscriptBox[\(\[Sum]\), \(k = 1\), \(Length[T]\)]\(ReplacePart[T, k -> d[T[\([\)\(k\)\(]\)]]]\)\);





(* ::Section::Closed:: *)
(*Variation Matrix*)


(* ::Subsection::Closed:: *)
(*Helper functions*)


(*KMP algorithm*)
KMP[pat_,txt_]:=Module[{table,i,j},
table=Module[{T={1}},
For[i=2,i<=Length[pat],i++,
j=T[[i-1]];
While[j>1&&pat[[j]]!=pat[[i]],j=T[[j-1]]];
AppendTo[T,If[pat[[j]]==pat[[i]],j+1,j]];
];
T
];
j=1;
For[i=1,i<=Length[txt],i++,
While[j>1&&txt[[i]]!=pat[[j]],j=table[[j-1]]];
If[txt[[i]]==pat[[j]],j+=1];
If[j==Length[pat]+1,Return[True,Module]];
];
False
];

(*Longest common subsequence*)
LCS[X_,Y_]:=Module[{n=Length[X],m=Length[Y],prev,cur,i,j},
prev=ConstantArray[0,m+1];
cur=ConstantArray[0,m+1];
For[i=1,i<=n,i++,
For[j=1,j<=m,j++,
If[X[[i]]===Y[[j]],
cur[[j+1]]=1+prev[[j]],
cur[[j+1]]=Max[cur[[j]],prev[[j+1]]]]
];
prev=cur
];
Length[X]===cur[[m+1]]
]

(* ::Subsection::Closed:: *)
(*Log encoding and decoding*)


(*These modules encode,decode and sort multiple polylogarithms*)


encode[Subscript[Li, N___][Y___]]:=Module[{n={N},y={Y},i,indices,min,max},
For[i=Length[y],i>=1,i--,
indices=(y[[i]]/.Times->List/.Subscript[x, t_]->t);
min = Min[indices]; max=Max[indices];
n=Flatten[Insert[n,ConstantArray[0,max-min],{i+1}]]
];
Flatten[Insert[n,ConstantArray[0,min-1],{1}]]
]


decode[code_]:=Module[{indices=Join[Flatten[Position[code,_?(#!=0&)]],{Length[code]+1}]},Subscript[Li, (DeleteCases[code,0]/.List->Sequence)][(\!\(
\*UnderoverscriptBox[\(\[Product]\), \(k = indices[\([\)\(#\)\(]\)]\), \(indices[\([\)\(# + 1\)\(]\)] - 1\)]
\*SubscriptBox[\(x\), \(k\)]\)&/@Range[Length[indices]-1]/.List->Sequence)]];


encodingsCompare[l1_,l2_]:=Which[
Total[l1]!=Total[l2],If[Total[l1]<Total[l2],1,-1],
Length[l1]!=Length[l2],If[Length[l1]<Length[l2],1,-1],
True,For[k=d,k>=1,k--,
Which[l1[[k]]<l2[[k]],Return[1],l1[[k]]>l2[[k]],Return[-1]]
]]


encodingsPriorTo[m_]:=Module[{r,result={m}},
If[m===ConstantArray[0,Length[m]],Return[{},Module]];
For[r=1,r<=Length[m],r++,
Which[m[[r]]===0,,
m[[r]]>1,result=Join[result,encodingsPriorTo[Join[m[[;;r-1]],{m[[r]]-1},m[[r+1;;]]]]],
r===Length[m],result=Join[result,encodingsPriorTo[Join[m[[;;r-1]],{0}]]],
True,result=Join[result,encodingsPriorTo[Join[m[[;;r-1]],{0},m[[r+1;;]]]],encodingsPriorTo[Join[m[[;;r-1]],{m[[r+1]],0},m[[r+2;;]]]]]
]
];
DeleteDuplicates[result]
];

(* ::Subsection::Closed:: *)
(*Iterated integrals*)

(*IIToLi and PToLi converts iterated integrals(in the sense of Chen) into multiple polylogarithms*)
ClearAll[IIToLi,PToLi];
IIToLi[l_]:=Module[{ans,a=Join[{l[[1]]},DeleteCases[l[[2;;-2]],_?(#===0&)],{l[[-1]]}],K=Join[{1},Flatten[Position[l[[2;;-2]],_?(#=!=0&),{1},Heads->False]]+1,{Length[l]}],i,j,n,d},n=K[[2;;]]-K[[;;-2]];d=Length[a]-2;
ans=Which[Length[l]===2,1,
a[[1]]===0&&a[[-1]]===0,0,
a[[1]]===0&&a[[-1]]=!=0,If[d===0,(-Log[1/a[[-1]]])^(n[[1]]-1)/(n[[1]]-1)!,
(-1)^(n[[1]]+d-1) Total[(i|->If[i[[1]]===0,1,Log[1/a[[-1]]]^i[[1]]]/i[[1]]! Subscript[Li, (n[[2;;]]+i[[2;;]]/.List->Sequence)][(a[[3;;]]/a[[2;;-2]]/.List->Sequence)]\!\(
\*UnderoverscriptBox[\(\[Product]\), \(p = 1\), \(Length[n] - 1\)]\((Binomial[n[\([\)\(p + 1\)\(]\)] + i[\([\)\(p + 1\)\(]\)] - 1, n[\([\)\(p + 1\)\(]\)] - 1])\)\))/@Flatten[Permutations/@(IntegerPartitions[n[[1]]+d,{d+1}]-1),1]]],
a[[1]]=!=0&&a[[-1]]===0,(-1)^Length[l] IIToLi[Reverse[l]],
a[[1]]=!=0&&a[[-1]]=!=0,\!\(
\*UnderoverscriptBox[\(\[Sum]\), \(p = 1\), \(Length[n]\)]\(Total[\((i |-> IIToLi[Join[l[\([\)\(\(;;\)\(K[\([\)\(p\)\(]\)]\)\)\(]\)], ConstantArray[0, i[\([\)\(1\)\(]\)] + 1]]] IIToLi[Join[ConstantArray[0, i[\([\)\(2\)\(]\)] + 1], l[\([\)\(\(K[\([\)\(p + 1\)\(]\)]\)\(;;\)\)\(]\)]]])\) /@ Flatten[Permutations /@ \((IntegerPartitions[n[\([\)\(p\)\(]\)] + 1, {2}] - 1)\), 1]]\)\)
];
ans
]
PToLi[l_]:=(-1)^Length[DeleteCases[l[[2;;-2]],_?(#===0&)]] IIToLi[l];


(*GoncharovIversion convert multiple polylogarithms involving inverses into multiple polylogarithms that don't*)
GoncharovInversion[n_,x_]:=Module[{d=Length[n],ans=0},
If[d===0,Return[1,Module]];
If[d===1,Return[(-1)^(n[[1]]-1) Subscript[Li, n[[1]]][x[[1]]]+(-1)^(n[[1]]-1) (2\[Pi] I)^n[[1]]/n[[1]]! BernoulliB[n[[1]],Log[x[[1]]]/(2\[Pi] I)],Module]];
ans=-\!\(
\*UnderoverscriptBox[\(\[Sum]\), \(r = 0\), \(d - 1\)]\(
\*SuperscriptBox[\((\(-1\))\), \(Total[n[\([\)\(\(r + 1\)\(;;\)\)\(]\)]]\)] GoncharovInversion[n[\([\)\(\(;;\)\(r\)\)\(]\)], x[\([\)\(\(;;\)\(r\)\)\(]\)]] 
\(\*SubscriptBox[\(Li\), \(n[\([\)\(\(r + 1\)\(;;\)\)\(]\)] /. List -> Sequence\)]\)[x[\([\)\(\(r + 1\)\(;;\)\)\(]\)] /. List -> Sequence]\)\)-\!\(
\*UnderoverscriptBox[\(\[Sum]\), \(r = 1\), \(d\)]\(Total[\[IndentingNewLine]\((i |-> \((
\*UnderoverscriptBox[\(\[Product]\), \(p = 1\), \(r - 1\)]Binomial[n[\([\)\(p\)\(]\)] + i[\([\)\(p\)\(]\)] - 1, n[\([\)\(p\)\(]\)] - 1])\) \((
\*UnderoverscriptBox[\(\[Product]\), \(p = r + 1\), \(d\)]Binomial[n[\([\)\(p\)\(]\)] + i[\([\)\(p\)\(]\)] - 1, n[\([\)\(p\)\(]\)] - 1])\) 
\*SuperscriptBox[\((\(-1\))\), \(Total[n[\([\)\(\(r\)\(;;\)\)\(]\)]] + Total[i[\([\)\(\(r + 1\)\(;;\)\)\(]\)]]\)] 
\*FractionBox[
SuperscriptBox[\((2  \[Pi]\ I)\), \(i[\([\)\(r\)\(]\)]\)], \(i[\([\)\(r\)\(]\)]!\)] BernoulliB[i[\([\)\(r\)\(]\)], 
\*FractionBox[\(Log[Times @@ x]\), \(2  \[Pi]\ I\)]] GoncharovInversion[n[\([\)\(\(;;\)\(r - 1\)\)\(]\)] + i[\([\)\(\(;;\)\(r - 1\)\)\(]\)], x[\([\)\(\(;;\)\(r - 1\)\)\(]\)]] 
\(\*SubscriptBox[\(Li\), \(n[\([\)\(\(r + 1\)\(;;\)\)\(]\)] + i[\([\)\(\(r + 1\)\(;;\)\)\(]\)] /. List -> Sequence\)]\)[x[\([\)\(\(r + 1\)\(;;\)\)\(]\)] /. List -> Sequence])\) /@ Flatten[Permutations /@ \((IntegerPartitions[n[\([\)\(r\)\(]\)] + d, {d}] - 1)\), 1]]\)\);
ans/.{Subscript[Li][]->1}
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

(* ::Subsection:: *)
(*Variation & Monodromy matrices construction*)

ClearAll[IIVariationMatrix,LiVariationMatrix,GoncharovVariationMatrix,GoncharovVariationMatrixModuloPiI];
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
decode[code_]:=Module[{r,list={}},
For[r=1,r<=Length[code],r++,
If[code[[r]]!=0,list=Join[list,{Subscript[a, r]},ConstantArray[0,code[[r]]-1]]]
];
list
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

(*omegaHat computes the connection form of lifted multiple polylogarithms, whereas the entries are motivic one form, and holomorphic differ by constant, and serve as the differential of lifted multiple polylogarithms*)
omegaHat[n_]:=d[nilpotentMatrixExp[-Omega[n]]] . nilpotentMatrixExp[Omega[n]]+nilpotentMatrixExp[-Omega[n]] . omega[n] . nilpotentMatrixExp[Omega[n]]//Expand;

holomorphicOneForm[n_]:=omegaHat[n][[-1,1]];

motivicOneForm[n_]:=If[Total[n]===1,-d[Subscript[v, 1]],holomorphicOneForm[n]/(Total[n]-1)];

motivicOneForm[n_,y_]:=Module[{f=Subscript[x, (#/.Times->List/.Subscript[x, t_]->t/.List->Sequence)]&,ff,Seq=(#/.{List->Sequence})&},ff=((f[y[[#]]]/.{Subscript->List})[[2;;]]/.{List->Sequence})&;
motivicOneForm[n]/.{Subscript[u, m___]:>Subscript[u, Seq[ff/@{m}]],Subscript[v, m___]:>Subscript[v, Seq[ff/@{m}]]}]

holomorphicOneForm[n_,y_]:=Module[{f=Subscript[x, (#/.Times->List/.Subscript[x, t_]->t/.List->Sequence)]&,ff,Seq=(#/.{List->Sequence})&},ff=((f[y[[#]]]/.{Subscript->List})[[2;;]]/.{List->Sequence})&;
holomorphicOneForm[n]/.{Subscript[u, m___]:>Subscript[u, Seq[ff/@{m}]],Subscript[v, m___]:>Subscript[v, Seq[ff/@{m}]]}]

(*symbolMap computes the symbol of a multiple polylogarithms*)
ClearAll[symbolMap,symbolMapConstants];
Unprotect[Element];
Element[c_,symbolMapConstants]:=True /; NumericQ[c];
Element[Power[a_,b_],symbolMapConstants]:=True /; (a\[Element]symbolMapConstants\[And]b\[Element]symbolMapConstants);
Element[Plus[a_,b_],symbolMapConstants]:=True /;  (a\[Element]symbolMapConstants\[And]b\[Element]symbolMapConstants);
Element[Times[a_,b_],symbolMapConstants]:=True /; (a\[Element]symbolMapConstants\[And]b\[Element]symbolMapConstants);
Protect[Element];
symbolMap[Subscript[Li, N___][X___]]:=matrixTensorPower[Omega[{N},{X}]\[Transpose],Total[{N}]][[1,-1]];
symbolMap[a___,S_Plus,b___]:=symbolMap[a,#,b]&/@S;
symbolMap[T_Times]:=shuffleProduct@@(symbolMap/@List@@T);
symbolMap[P_Power]:=shuffleProduct@@ConstantArray[symbolMap[P[[1]]],P[[2]]];


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

(*moduloProducts modulo any products in any expression*)
moduloProducts[f_]:=Module[{},
If[NumericQ[f],Return[f,Module]];
If[Length[MonomialList[f]]>1,Total[moduloProducts/@MonomialList[f]],
If[Total[Exponent[f,Variables[f]]]>1,0,f]
]
]
SetAttributes[moduloProducts,{Listable}]

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
LiCobracket[n_,y_]:=GoncharovCobracket[n,y]/.{Subscript[Li, N___][X___]:>If[Exponent[{X}[[1]],Variables[{X}[[1]]]][[1]]<1,moduloProducts[GoncharovInversionModuloPiI[Reverse[{N}],Reverse[1/{X}]]],Subscript[Li, N][X]]};



(* ::Section::Closed:: *)
(*Conjugation & Single-valued Li*)

Unprotect[Conjugate,Re,Im];
Conjugate[a___,S_Plus,b___]:=Conjugate[a,#,b]&/@S;
Re[a___,S_Plus,b___]:=Re[a,#,b]&/@S;
Im[a___,S_Plus,b___]:=Im[a,#,b]&/@S;
Conjugate[a___,T_Times,b___]:=Conjugate[a,#,b]&/@T;
Conjugate[P_Power]:=Conjugate[P[[1]]]^P[[2]];
Protect[Conjugate,Re,Im];


(* ::Input::Initialization:: *)
SingleValuedLi[n_List]:=Module[{V},
V=GoncharovVariationMatrixModuloPiI[n];
I^(2Floor[Total[n]/2]-1)/2*unipotentMatrixLog[tauMatrix[n,I] . V . tauMatrix[n,-1] . Conjugate[unipotentMatrixInverse[V]] . tauMatrix[n,I]][[-1,1]]/.{Conjugate[Subscript[Li, m___][x___]]->Subscript[ConjLi, m][x],Conjugate[Log[x___]]->ConjLog[x]}/.{Subscript[Li, m___][x___]->Re[Subscript[Li, m][x]]+I Im[Subscript[Li, m][x]],Log[x___]->Re[Log[x]]+I Im[Log[x]],Subscript[ConjLi, m___][x___]->Re[Subscript[Li, m][x]]-I Im[Subscript[Li, m][x]],ConjLog[x___]->Re[Log[x]]-I Im[Log[x]]}//Expand
]


EndPackage[]
