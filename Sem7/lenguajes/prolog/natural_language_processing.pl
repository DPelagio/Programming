/*
    Simple example of Nautral Language Processing

    Daniel Pelagio A01227873
    04/11/2019

*/

%%% Vocabulary

article(el).
article(la).
noun(niño).
noun(bici).
verb(corre).
verb(monta).

%%% Rules
sentence(L) :-
    noun_phrase(NL),
    verb_phrase(VL),
    append(NL, VL, L).

noun_phrase(L) :-
    article(X),
    noun(N),
    append([A], [N], L).

%%% Only a verb
verb_phrase(L) :-
    verb(V),
    append(V, [], L).

verb_phrase(L) :-
    verb(V),
    noun_phrase(N),
    append(V, N, L).

