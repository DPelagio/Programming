% Daniel Pelagio Vázquez A01227873
% Prolog program to do several functions
% 16/10/2019


in_list([], X).

in_list([X1 | Y1], X):-
	in_list(Y1, X).