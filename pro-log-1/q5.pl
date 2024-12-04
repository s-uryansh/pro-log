% Check if a number is prime
isPrime(2).
isPrime(3).
isPrime(X) :-
    X > 3,
    X mod 2 =\= 0,
    \+ has_factor(X, 3).

% Check if a number has a factor starting from Y
has_factor(X, Y) :-
    X mod Y =:= 0.
has_factor(X, Y) :-
    Y * Y < X,
    Y2 is Y + 2,
    has_factor(X, Y2).

% Find prime factors of a number
factors(X, L) :-
    X > 1,
    find_factors(X, 2, [], L).

% Helper predicate to find factors
find_factors(1, _, L, L).
find_factors(X, F, Acc, L) :-
    X > 1,
    (   X mod F =:= 0
    ->  count_factor(X, F, 0, Count, Rest),
        append(Acc, [[F, Count]], NewAcc),
        find_factors(Rest, F, NewAcc, L)
    ;   next_factor(F, NextF),
        find_factors(X, NextF, Acc, L)
    ).

% Count the occurrences of a factor in a number
count_factor(X, F, Acc, Count, Rest) :-
    (   X mod F =:= 0
    ->  NewAcc is Acc + 1,
        NewX is X // F,
        count_factor(NewX, F, NewAcc, Count, Rest)
    ;   Count = Acc,
        Rest = X
    ).

% Find the next factor to check
next_factor(2, 3).
next_factor(F, NextF) :-
    F > 2,
    NextF is F + 2.