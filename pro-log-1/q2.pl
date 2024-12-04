% Base case: GCD of X and 0 is X
gcd(X, 0, X) :- X > 0.

% Recursive case: GCD of X and Y is the GCD of Y and the remainder of X divided by Y
gcd(X, Y, Z) :- 
    Y > 0,
    Rem is X mod Y,
    gcd(Y, Rem, Z).

% Base case: GCD of 0 and Y is Y
gcd(0, Y, Y) :- Y > 0.