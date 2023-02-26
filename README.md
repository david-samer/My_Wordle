# My_Wordle
This is a custom made wordle game made using prolog where you can create your own dictionary of categories and words. Test your friends knowledge with your custom words. Check Sim for a Game Simulation


Documentation:-

•	build_kb:
used to read the user’s input and calls the helpIn(input) predicate.

•	helpIn(X):
checks weather if:
1) the user is done building the KB,
	2) the user enters a new word and category, or
	3) the input was a variable therefore it’s not valid.

•	is_category(C): 
checks if c is a valid category available in the KB.

•	categories(L):
creates a set of categories using setof( , , ).

•	available_length(L):
succeeds if L is a length of a word available in the KB.

•	pick_word(W,L,C):
succeeds if W is a word with length L in category C.

•	chooseCat(C):
reads the chosen category and if it is not an available category it requires the user to input again.

•	chooseLen(L):
reads the chosen length and if it is not an available length it requires the user to input again.

•	correct_letters(L1,L2,L3):
succeeds if L3 is composed of elements common between L1 and L2.

•	remove_duplicates(L1 , L2):
succeeds if L2 is composed of the same elements in L1 ,removing the duplicates.

•	correct_positions(L1,L2,L3):
succeeds if L3 is composed of common elements in the same position in L1 and L2.



•	guessLen(X,L,Count):
reads the guessed word and if it’s length is not the same as L it requires the user to input again.

•	guessLoop(Count, L , W):
loops on the game routine until either the guessed word is right (X = W) or you are out of tries (Count = 0).

•	play:
responsible for the game play phase and calls the required predicates in their order.

•	main:
initiates the KB building phase and the playing phase.
