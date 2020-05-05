/*
Binary search trees in Prolog
Daniel Pelagio A01227873
10/11/2019
*/

% Relations to store predefined trees
test_tree(1, node(6, node(2, nil, node(5, nil, nil)), node(8, node(7, nil, nil), nil))).
% This tree is asymmetrical
test_tree(2, node(6, node(2, nil, node(5, nil, nil)), node(8, nil, nil))).
% Invalid tree
test_tree(3, nil).
% Mirror tree of 2
test_tree(4, node(6, node(2, nil, nil), node(8, node(7, nil, nil), nil))).
% Larger tree to test height
test_tree(5, node(6, node(2, nil, node(5, node(4, nil, nil), nil)), node(8, nil, nil))).

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

%%% Delete an element from the tree
tree_delete(_, nil, nil).
% Find the element
tree_delete(X, node(R, LT, RT), node(R, NLT, RT)) :-
    X < R,
    tree_delete(X, LT, NLT).
tree_delete(X, node(R, LT, RT), node(R, LT, NRT)) :-
    X > R,
    tree_delete(X, RT, NRT).
% Delete the element found
% Leaf node
tree_delete(X, node(X, nil, nil), nil).
% Only one branch
tree_delete(X, node(X, LT, nil), LT).
tree_delete(X, node(X, nil, RT), RT).
% Two branches
tree_delete(X, node(X, LT, RT), node(Min, LT, NRT)) :-
    tree_min(RT, Min),
    tree_delete(Min, RT, NRT).

% Find the smallest number in a tree
tree_min(nil, nil).
tree_min(node(R, nil, _), R).
tree_min(node(_, LT, _), Min) :-
    tree_min(LT, Min).

% Print the height of a tree
tree_height(nil, 0).
tree_height(node(_, LT, RT), H) :-
    tree_height(LT, H1),
    tree_height(RT, H2),
    H is max(H1, H2) + 1.

% take all the leaves from a tree and append them into a list
list_leaves(nil, []).    
list_leaves(node(R, nil, nil), [R]).
list_leaves(node(_, LT, RT), LL) :-
    list_leaves(LT, LTL),
    list_leaves(RT, RTL),
    append(LTL, RTL, LL).

% Returns true if the tree has symmetry, and false if it doesnt
symmetric_tree(nil).
symmetric_tree(node(_, LT, RT)) :- 
    symmetric_helper(LT, RT).

% helper that checks if the left half is the same as the other half
symmetric_helper(nil, nil).
symmetric_helper(node(_, LT1, RT1),node(_, LT2, RT2)) :- 
    symmetric_helper(LT1, RT2), 
    symmetric_helper(RT1, LT2).

% function that receives two trees and returns true if one is the mirror of the other
mirror_tree(nil, nil).
mirror_tree(node(_, LT1, RT1), node(_, LT2, RT2)) :-
    mirror_helper2(LT1, RT2),
    mirror_helper2(RT1, LT2).

% helper that checks if one side of the tree is mirror to its corresponding part
mirror_helper2(nil, nil).
mirror_helper2(node(_, LT1, RT1), node(_, LT2, RT2)) :-
    mirror_helper2(LT1, RT2),
    mirror_helper2(RT1, LT2).