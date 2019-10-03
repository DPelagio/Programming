/*
Daniel Pelagio A01227873
Hello World 2 en Prolog
3/Oct/2019
*/

% Facts
father(goku, gohan).
father(goku, goten).
father(bardock, goku).
father(bardock, raditz).
father(vegeta, trunks).
father(vegeta, bulla).
mother(gine, goku).
mother(gine, raditz).
mother(chichi, gohan).
mother(chichi, goten).
mother(bulma, trunks).
mother(bulma, bulla).
male(bardock).
male(goku).
male(vegeta).
male(gohan).
male(goten).
male(trunks).
female(gine).
female(chichi).
female(bulma).
female(bulla).

% Rules
brothers(X, Y) :-
	father(Z, X),
	father(Z, Y),
	mother(W, X),
	mother(W, Y),
	X \= Y.

brother(X, Y) :-
	brothers(X, Y),
	male(X, Y).

sister(X, Y) :-
	brothers(X, Y),
	female(X, Y).

grandfather(X, Y) :-
	father(Z, Y),
	father(X, Z).

grandmother(X, Y) :-
	father(Z, Y),
	mother(X, Z).

grandchild(X, Y) :-
	father(Z, Y),
	father(Y, Z).

grandson(X, Y) :-
	male(X),
	father(Z, X),
	father(Y, Z).

granddaughter(X, Y) :-
	female(X),
	father(Z, X),
	father(Y, Z).





