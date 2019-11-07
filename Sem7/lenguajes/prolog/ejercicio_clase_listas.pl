


tec_length([H|[]], C).

tec_length([_|T], C) :-
	C1 is C + 1,
	tec_length(T,C1).



tec_length([], C).

tec_length([_|T], L) :-
	tec_length(T, L1),
	L is L1 + 1.


tec_last([], L, L).

tec_last([_|T], A, L) :-
	A is A + 1,
	tec_last(T, A1, L).