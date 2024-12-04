%Set-B
name(suryansh_rohil).
rollno(2310110314).

%HARRY POTTER

%males
male(james).
male(arthur).
male(fred).
male(harry).
male(george).
male(albusseverus).
male(jamessirius).
male(ron).
male(hugo).
%females
female(lily).
female(molly).
female(ginny).
female(angelina).
female(hermione).
female(rose).

% parents

parents(harry, james, lily).
parents(ginny, arthur, molly).
parents(ron, arthur, molly).
parents(fred, arthur, molly).
parents(george, arthur, molly).
parents(albusSeverus, harry, ginny).
parents(jamesSirius, harry, ginny).
parents(rose, ron, hermionie).
parents(hugo, ron, hermionie).

% wife

wife(lily, james).
wife(molly, arthur).
wife(ginny, harry).
wife(angelina, george).
wife(hermionie, ron).

% sister

sister(X, Y) :-
    female(X),          
    parents(X, Father, Mother), 
    parents(Y, Father, Mother),
    X \= Y.          

% maternalUncle

maternalUncle(X, Y) :-
    male(X),
    parents(Y, _, Mother),       
    parents(Mother, Grandfather, Grandmother),
    parents(X, Grandfather, Grandmother),
    X \= Mother.    