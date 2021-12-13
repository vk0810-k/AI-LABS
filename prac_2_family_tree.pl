% Fathers Side
male(varun).
male(karan).
male(yogesh).
male(mahendra).
male(prashant).
male(sanjay).
male(yash).
male(arvind).

female(amita).
female(jyoti).
female(deepal).
female(taruni).
female(archana).
female(arpita).
female(hemlata).

parent_of(mahendra,varun).
parent_of(amita,varun).
parent_of(jyoti,karan).
parent_of(jyoti,deepal).
parent_of(yogesh,karan).
parent_of(yogesh,deepal).
parent_of(prashant,yash).
parent_of(prashant,arpita).
parent_of(taruni,yash).
parent_of(taruni,arpita).
parent_of(arvind,mahendra).
parent_of(arvind,yogesh).
parent_of(arvind,prashant).
parent_of(arvind,sanjay).
parent_of(hemlata,yogesh).
parent_of(hemlata,mahendra).

married(yogesh,jyoti).
married(mahendra,amita).
married(prashant,taruni).
married(sanjay,archana).
married(arvind,hemlata).


%self roles rule
father(X, Y) :- male(X), parent_of(X, Y).
mother(X,Y) :- female(X), parent_of(X,Y).

brother(X, Y) :- male(X), father(Z, Y), father(Z, X), X \= Y.
brother(X, Y) :- male(X), mother(Z, Y), mother(Z, X), X \= Y.

sister(X, Y) :- female(X), father(Z, Y), father(Z, X), X \= Y.
sister(X, Y) :- female(X), mother(Z, Y), mother(Z, X), X \= Y.

uncle_of(X,Y) :- parent_of(Z,Y), brother(Z,X).

grandparent(X, Y) :- parent_of(X, Z), parent_of(Z, Y).

grandmother(X, Y) :- parent_of(X, Z), parent_of(Z, Y),female(X).
grandfather(X, Y) :- parent_of(X, Z), parent_of(Z, Y),male(X).

aunt_of(X,Y) :- female(X), father(Z,Y), brother(Z,W), married(W,X).











