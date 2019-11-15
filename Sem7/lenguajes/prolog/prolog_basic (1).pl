/*
Daniel Pelagio Vazquez A01227873
Program that does basic functions of prolog
*/

%%% Function that take two arguments, a list and an element, and determine if the element can be found inside the list.
in_list([H|_], H) :- %%% If the element exists, it is true, it is recursive for every item in list
    !.
in_list([_|T], X) :-
    in_list(T, X).

%%% Function to calculate length
tec_length([], 0).

tec_length([_|T], L) :-
    tec_length(T, L1),
    L is L1 + 1.

%%% Function that takes as argument a list, and determine if the list has an odd number of elements or not.

odd_length([H|T]) :-
    tec_length([H|T], L),
    L mod 2 =:= 1. %%% If modulo is equal to 1, the length is odd

%%% Function that take as argument an index and a list and return the element at index n of the list

n_th_element(0, [H|_], H):- %%% Stops when the counter is 0
    !.

n_th_element(N,[_|T],X):-
    N > 0,
    N1 is N-1, %%% Goes backwards from the counter given until it reaches 0
    n_th_element(N1, T, X).

%%% Funtion that takes two lists as arguments and determines if they are permutations of each other
is_permutation([], [_|_]).

is_permutation([H1|T1], [H2|T2]):-
    tec_length([H1|T1], X1),
    tec_length([H2|T2], X2),
    X1 = X2,
    is_permutation_helper([H1|T1], [H2|T2]).

is_permutation_helper([], [_|_]).

is_permutation_helper([H1|T1], [H2|T2]):-
    in_list([H2|T2], H1),
    is_permutation_helper(T1, [H2|T2]).

%%% Function that takes as argument a list and generates a list without contiguous elements that are duplicated

remove_doubles([H|T], R):-
    remove_doubles_helper([H|T], R, [H], 0).

remove_doubles_helper([], R, R, A):-
    !.

remove_doubles_helper([H|T], R, [H2|_], A):-
    (A1 is A + 1,
    n_th_element(A1, [H|T], X),
    H2 =:= X,
    remove_doubles_helper(T, R, [H2|_], A1));
    (remove_doubles_helper(T, R, [H2|_], A1),
    append([H2|_],[X],R)).
