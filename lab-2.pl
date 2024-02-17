% COMMANDS:
% trace.
% Enables trace mode in Prolog, providing detailed information about the execution of predicates and queries.

% gtrace.
% Enables graphical trace mode in some Prolog systems, offering a visual representation of the execution flow.

% nodebug.
% Disables debugging mode in Prolog, ceasing the generation of detailed trace information about program execution.


% EXERCISE 2
edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(d, e).

path(X, Y) :-
  edge(X, Y); % Base case: Direct edge from X to Y

  edge(X, Mid), % Indirect edge from X to Mid
  path(Mid, Y). % Recursively check path from Mid to Y.


% EXERCISE 3
ingredient(flour, dough).
ingredient(egg, dough).
ingredient(dough, cake).
ingredient(chocolate, cake).

partOfRecipe(X, Y) :-
  ingredient(X, Y);

  (ingredient(X, Any), 
  partOfRecipe(Any, Y)).


% EXERCISE 4
reaction(h, h, h2).
reaction(h2, o, h2o).
reaction(o, h, oh).
reaction(h2, h, h3).
reaction(h, o, naoh).

% Base case: X is directly involved in the reaction leading to Y
checkPartOf(X, Y) :-
  reaction(X, _, Y);

  reaction(_, X, Y).

% Inductive case: X is indirectly involved in a reaction leading to Y
checkPartOf(X, Y) :-
  reaction(X, _, Z),
  checkPartOf(Z, Y);

  reaction(_, X, Z),
  checkPartOf(Z, Y).


% EXERCISE 5
before(the_hunger_games, the_hunger_games_catching_fire).
before(the_hunger_games_catching_fire, the_hunger_games_mockingjay_part1).
before(the_hunger_games_mockingjay_part1, the_hunger_games_mockingjay_part2).

mustWatchBefore(M1, M2) :-
  before(M1, M2); % M1 must be watched directly before M2
  (before(M1, Any), % M1 must be watched directly before Any
  mustWatchBefore(Any, M2)). % Any must be watched before M2


% EXERCISE 6
parent(john, jim).
parent(jim, jill).

descendant(X, Y) :-
  parent(Y, X); % X is a direct child of Y
  (parent(Y, Z), % Y is a parent of Z
  descendant(X, Z)). % X is a descendant of Z


% EXERCISE 7
composedOf(aggregate, sand).
composedOf(aggregate, rock).
composedOf(aggregate, gravel).
composedOf(concrete, aggregate).
composedOf(concrete, cement).
composedOf(concrete, water).
composedOf(wall, concrete).
composedOf(wall, brick).

partOf(X, Y) :-
  composedOf(Y, X); % X is a component of Y
  (composedOf(Y, Z), % Y is composed of Z
  partOf(X, Z)). % X is part of Z
