build_kb:-
	write('Please enter a word and its category on separate lines: '), nl , 
	read(X),
	helpIn(X).

helpIn(X):-
	nonvar(X),
	X=done,
	write('Done building the words database...').
helpIn(X):-
	nonvar(X),
	X \= done,
	read(Y),
	assert(word(X,Y)),
	build_kb.
	
helpIn(X):-
	\+nonvar(X),
	write('Variables are not valid'),nl,
	build_kb.



is_category(C):-
	word(_,C).
	
categories(L):-
	setof(C , is_category(C) , L).
	
available_length(L):-
	word(X , _) ,
	string_length(X , L).
	
pick_word(W , L , C):-
	word(W,C),
	string_length(W,L),!.
	
	
chooseCat(C):-
	write('Please choose a category.'),nl,
	read(C),
	(is_category(C))->
	true
	;write('This category does not exist.'),nl,
	chooseCat(C).

lenInCat(L , C):-
	word(W , C),
	string_length(W , L).

chooseLen(L , C):-
	write('Choose a length:'),nl,
	read(L),
	(lenInCat(L , C))->
	true
	;write('There are no words of this length.'),nl,
	chooseLen(L ,C).

correct_letters(_,[],[]).

correct_letters(L1,[H|T],[H|T1]):-
	member(H,L1),
	correct_letters(L1,T,T1).
	
correct_letters(L1,[H|T],CL):-
	\+(member(H,L1)),
	correct_letters(L1,T,CL).


remove_duplicates([], []).

remove_duplicates([Head | Tail], Result) :-
    member(Head, Tail), !,
    remove_duplicates(Tail, Result).
	
remove_duplicates([Head | Tail], [Head | Result]) :-
    remove_duplicates(Tail, Result).
	
	
	

correct_positions([],[],[]).

correct_positions([H|T],[H|T1],[H|T2]):-
	correct_positions(T,T1,T2).
correct_positions([H|T],[H1|T1],Pl):-
	H\=H1,
	correct_positions(T,T1,Pl).


	
guessLen(X,L,Count):-
	read(X),
	
	(string_length(X , L))->true
	;write('Word is not composed of '),
	write(L),
	write(' letters. Try again.'),nl,
	write('Remaining Guesses are '),
	write(Count),nl,
	guessLen(X,L,Count).	
	
	
	
	
	
guessLoop(0,_,W):- 
	write('The word is '),
	write(W),nl,
	write('YOU LOSE').
guessLoop(Count,L,W):-	
	(Count>0),
	write('Enter a word composed of '),
	write(L),
	write(' letters: '),nl,
	
	guessLen(X,L,Count),
	
	(X\=W)->
	atom_chars(W,Lword),
	
	atom_chars(X,Lguess),
	correct_letters(Lword,Lguess,CL),
	write('Correct letters are: '),
	remove_duplicates(CL,Result),
	write(Result),nl,
	
	correct_positions(Lword,Lguess,Pl),
	write('Correct letters in correct positions are: '),
	write(Pl),nl,
	
	Temp is Count - 1,
	write('Remaining Guesses are '),
	write(Temp),nl,nl,
	guessLoop(Temp,L,W)
	;write('YOU WON!!!!!').
	

	
play:-
	write('The available categories are: '),nl,
	categories(N),
	write(N),
	
	
	chooseCat(C),
	chooseLen(L , C),
	
	
	
	pick_word(W , L , C),
	write(' Game started. You have '),
	Tmp is L + 1 , 
	write(Tmp),
	write(' guesses.'),nl,nl,
	
	
	guessLoop(Tmp,L,W).
	
	
	
main:-
	build_kb,
	play.