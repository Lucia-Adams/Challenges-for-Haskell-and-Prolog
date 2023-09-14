/*Begin Question 4.1*/
prime(2).
prime(3).
prime(N)
  :- X is N//2,
     numlist(2, X, W),
     primeloop(N, W).

/* returns true if no elements in list divide it */
primeloop(N, [E])
  :- not(N mod E =:= 0).
primeloop(N, [H|T])
  :- not(N mod H =:= 0),
     primeloop(N, T).
/*End Question 4.1*/

/*Begin Question 4.2*/
countup(A, B, A)
  :- A =< B.
countup(A, B , X)
  :- A < B,
     C is A +1,
     countup(C, B, X).

possible( X, Y, Z )
	:- countup(111, 179, X),
       countup(181, 269, Y),
       countup(271, 359, Z).
/*End Question 4.2*/

/*Begin Question 4.3*/
digits(N, [A,B,C])
  :- A is N // 100,
     B is (N-(A*100)) //10,
     C is (N mod 10).

diglist(A, B, C, L)
  :- digits(A, AL),
     digits(B, BL),
     digits(C, CL),
     append(AL, BL, L1),
     append(L1, CL, L).

uniquedig(A,B,C)
  :- diglist(A,B,C,L),
     memberchk(1,L),memberchk(2,L),memberchk(3,L),
     memberchk(4,L),memberchk(5,L),memberchk(6,L),
     memberchk(7,L),memberchk(8,L),memberchk(9,L).


acceptable(A,B,C)
  :- uniquedig(A,B,C),
     not(prime(A)), not(prime(B)), not(prime(C)).

trait(X,Y,Z)
  :- possible(X,Y,Z),
     acceptable(X,Y,Z).

/*End Question 4.3*/
