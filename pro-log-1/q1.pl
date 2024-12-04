% The discontiguous directive is used here because the parent/2 predicate is defined in multiple, non-contiguous parts of the file.
:- discontiguous parent/2.

% Parent Relations
parent(subala, shakuni).
parent(subala, gandhari).
parent(sudeshna, shakuni).
parent(sudeshna, gandhari).
parent(shantanu, bhishma).
parent(ganga, bhishma).
parent(shantanu, vichitravirya).
parent(satyavati, vichitravirya).
parent(satyavati, chitrangada).
parent(shantanu, chitrangada).
parent(vichitravirya, dhritarashtra).
parent(ambika, dhritarashtra).
parent(vyasa, dhritarashtra).
parent(parashara, satyavati).
parent(satyavati, vyasa).
parent(vichitravirya, pandu).
parent(ambalika, pandu).
parent(pandu, yudhishthira).
parent(kunti, yudhishthira).
parent(pandu, bhima).
parent(kunti, bhima).
parent(pandu, arjuna).
parent(subala, shakuni).
parent(sudeshna, shakuni).
parent(kunti, arjuna).
parent(pandu, nakula).
parent(madri, nakula).
parent(pandu, sahadeva).
parent(madri, sahadeva).
parent(dhritarashtra, duryodhana).
parent(gandhari, duryodhana).
parent(dhritarashtra, dushasana).
parent(gandhari, dushasana).
parent(dhritarashtra, dussala).
parent(gandhari, dussala).
parent(parashara, vyasa).
parent(satyavati, vyasa).
parent(vyasa, pandu).
parent(vyasa, dhritarashtra).

% Draupadi relation line
parent(drupada, draupadi).
parent(prishati, draupadi).
parent(arjuna, shrutakirti).
parent(draupadi, shrutakirti).
parent(bhima, sutasoma).
parent(draupadi, sutasoma).
parent(yudhishthira, pratibindhya).
parent(draupadi, pratibindhya).
parent(nakula, shatanika).
parent(draupadi, shatanika).
parent(sahadeva, shrutasena).
parent(draupadi, shrutasena).

% relation line for abhimanyu
parent(arjuna, abhimanyu).
parent(subhadra, abhimanyu).
parent(abhimanyu, parikshith).
parent(uttara, parikshith).

% new generation
parent(yudhishthira, pratibindhya).
parent(draupadi, pratibindhya).
parent(bhima, sutasoma).
parent(draupadi, sutasoma).
parent(arjuna, shrutakirti).
parent(draupadi, shrutakirti).
parent(nakula, shatanika).
parent(draupadi, shatanika).
parent(sahadeva, shrutasena).
parent(draupadi, shrutasena).
parent(abhimanyu, parikshith).
parent(uttara, parikshith).

% gender 
% male
male(shantanu).
male(bhishma).
male(vichitravirya).
male(chitrangada).
male(parashara).
male(dhritarashtra).
male(pandu).
male(yudhishthira).
male(bhima).
male(arjuna).
male(nakula).
male(sahadeva).
male(duryodhana).
male(dushasana).
male(vyasa).
male(drupada).
male(shakuni).
male(abhimanyu).
male(parikshit).
%female
female(ganga).
female(satyavati).
female(ambika).
female(ambalika).
female(gandhari).
female(dussala).
female(madri).
female(gandhari).
female(draupadi).
female(prishati).
female(subhadra).
female(uttara).

%relation line for ancestor
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% sibling relation
brother(X, Y) :- parent(P, X), parent(P, Y), male(X), X \= Y.
sister(X, Y) :- parent(P, X), parent(P, Y), female(X), X \= Y.

% step sibling relation
stepBrother(X, Y) :- parent(P1, X), parent(P2, Y), P1 \= P2, male(X), X \= Y.
stepSister(X, Y) :- parent(P1, X), parent(P2, Y), P1 \= P2, female(X), X \= Y.

% Relation: mother and father
mother(X, Y) :- parent(X, Y), female(X).
father(X, Y) :- parent(X, Y), male(X).

% Relation: Aunt
aunt(X, Y) :- maternalAunt(X, Y).
aunt(X, Y) :- paternalAunt(X, Y).

% relation: step mother and step father
stepMother(X, Y) :- parent(X, Z), parent(Z, Y), female(X), X \= Y.
stepFather(X, Y) :- parent(X, Z), parent(Z, Y), male(X), X \= Y.

% relation: granparents
grandFather(X, Y) :- father(X, Z), parent(Z, Y). 
grandMother(X, Y) :- mother(X, Z), parent(Z, Y). 

%Relation: maternal
maternalUncle(X, Y) :- mother(M, Y), brother(X, M).
maternalAunt(X, Y) :- mother(M, Y), sister(X, M).
paternalUncle(X, Y) :- father(F, Y), brother(X, F).
paternalAunt(X, Y) :- father(F, Y), sister(X, F).