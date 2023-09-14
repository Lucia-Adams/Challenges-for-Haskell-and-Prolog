/*Begin Question 3.1*/
indices([], _, []).
indices([H|T], XS , [V|W])
  :- anindex(H, XS, V),
     indices(T, XS, W).

anindex(0, [H|_], H).
anindex(N, [_|T], V)
    :- N1 is N-1,
       anindex(N1, T, V).
/*End Question 3.1*/

/*Begin Question 3.2*/
takeoutelem(X, [X|T], T).
takeoutelem(X, [H|T], [H|W])
	:- takeoutelem(X, T, W).

permutation([],[]).
permutation([H|T] , V)
	:- permutation(T, R),
	   takeoutelem( H, V, R).

possible(GRID) :- permutation([1,2,3,4,5,6,7,8,9], GRID).
/*End Question 3.2*/

/*Begin Question 3.3*/
sumelem([],0).
sumelem([H|T], V)
	:- sumelem(T, W),
       V is W + H.

/* c for circle, s for set of colour squares, t for total in squares, g for grid
 CP for circle points, SP for set points */
acceptable(C1, C2, C3, C4, S1, T1, S2, T2, S3, T3, G)
	:- indices([0,1,3,4], G, CP1),
       indices([1,2,4,5], G, CP2),
       indices([3,4,6,7], G, CP3),
       indices([4,5,7,8], G, CP4),
       indices(S1, G, SP1),
       indices(S2, G, SP2),
       indices(S3, G, SP3),
       sumelem(CP1, C1), sumelem(CP2, C2), sumelem(CP3, C3),
       sumelem(CP4, C4), sumelem(SP1, T1), sumelem(SP2, T2),
       sumelem(SP3, T3).

filtersuko(_, _, _, _, _, _, _, _, _, _, [], []).
filtersuko(C1, C2, C3, C4, S1, T1, S2, T2, S3, T3, [H|_], H)
	:- acceptable(C1, C2, C3, C4, S1, T1, S2, T2, S3, T3, H).
filtersuko(C1, C2, C3, C4, S1, T1, S2, T2, S3, T3, [_|T], V)
	:- filtersuko(C1, C2, C3, C4, S1, T1, S2, T2, S3, T3, T, V).

suko(C1, C2, C3, C4, S1, T1, S2, T2, S3, T3, GRID)
	:- findall(G, possible(G), X),
       filtersuko(C1, C2, C3, C4, S1, T1, S2, T2, S3, T3, X, GRID).

/*End Question 3.3*/
