% Check if a number is prime
isPrime(X) :-
    X > 1,
    \+ has_factor(X, 2).

% Check if a number has a factor
has_factor(X, Y) :-
    Y * Y =< X,
    X mod Y =:= 0.
has_factor(X, Y) :-
    Y * Y =< X,
    Y2 is Y + 1,
    has_factor(X, Y2).