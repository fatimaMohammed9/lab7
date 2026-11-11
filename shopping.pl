:- dynamic basket/1.

basket([coffee, milk, chocolate, apple, juice]).
start :-
    menu.
menu :-
    write('** SHOPPING LIST **'), nl,
    write('d. display all items.'), nl,
    write('a. Add an item to the list.'), nl,
    write('e. exit.'), nl,
    write('ENTER YOUR CHOICE .'), nl,
    read(C),
    choice(C).

choice(d) :-
    basket(L),
    show(L),
    menu.
    
choice(a) :-
    write('enter the item you want to add it'), nl,
    read(I),
    retract(basket(L)),
    append(L, [I], L2),
    assert(basket(L2)),
    write('The item has been added'), nl,
    menu.
choice(e).
choice(_) :-
    write('wrong choice'), nl,
    menu.

show([]).
show([H|T]) :-
    write(H), nl,
    show(T).
