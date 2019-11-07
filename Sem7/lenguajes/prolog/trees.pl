/*
Implementations of binary search trees in Prolog

Gilberto Echeverria
21/10/2019
*/

% Relations to store predefined trees
test_tree(1, node(6, node(2, nil, node(5, nil, nil)), node(8, nil, nil))).
% Invalid tree
test_tree(2, node(6, node(2, node(5, nil, nil)), node(8, nil, nil))).


%%% Predicate to determine if an expression is a valid tree
% Base case fact
is_tree(nil).
% Recursive calls
is_tree(node(_, LT, RT)) :-
    is_tree(LT),
    is_tree(RT).

%%% Search for an element inside the tree
tree_element(X, node(R, _, _)) :-
    X = R.
tree_element(X, node(R, LT, _)) :-
    X < R,
    tree_element(X, LT).
tree_element(X, node(R, _, RT)) :-
    X > R,
    tree_element(X, RT).

%%% Insert a new element X in the tree. The result is NewTree
% Base case
tree_insert(X, nil, node(X, nil, nil)).
% If the element is already in the tree, do nothing
tree_insert(X, node(R, LT, RT), node(R, LT, RT)) :-
    X = R.
tree_insert(X, node(R, LT, RT), node(R, NLT, RT)) :-
    X < R,
    tree_insert(X, LT, NLT).
tree_insert(X, node(R, LT, RT), node(R, LT, NRT)) :-
    X > R,
    tree_insert(X, RT, NRT).

%%% Convert a tree into an ordered list
tree_inorder(nil, []).
tree_inorder(node(R, LT, RT), L) :-
    tree_inorder(LT, LL),
    tree_inorder(RT, RL),
    append(LL, [R|RL], L).

/*
%%% Print a tree
print_tree(nil, 0).
print_tree(node(R, LT, RT), depth) :-
*/