% Define gcd/3 predicate
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- 
    Y > 0,
    R is X mod Y,
    gcd(Y, R, G).

% Define lcm/3 predicate
lcm(X, Y, Z) :-
    X > 0,
    Y > 0,
    gcd(X, Y, G),
    Z is (X * Y) // G.