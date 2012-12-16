Liar's Lair
======

A (untested) card game for between 3 and 8 players. It's designed to be played with a computer "referee", however there is no reason that a human (or, with some minor rule changes, the players themselves) couldn't perform that role

There are two decks of cards, each card from one deck has an equivalent card in the other deck that has a conflicting piece of information. For example one deck might have a card that states "Goats are renown for their love of prunes" while the other would have "Goats hate prunes", these two cards are referred to as a "card-pair". The information on the cards is intentionally bizarre so that it may not be casually independenctly verified (although goats probably do love prunes). Between games card-pairs may also be swapped between decks, provided they both never appear in the same deck.

* You may add or remove card-pairs to increase or decrease the difficulty or to make the number of cards given to each player be a round number. 
* Players should start with a minimum of 4 cards (2 truth and 2 lies).
* Cards images are available for download and printing in the images directory of this project. 


## Starting a game

1. At the start of play one deck is chosen at random to be the "deck of lies", while the other is the "deck of truth". Each deck is shuffled (but the decks are not mixed together)
2. Each player is given an equal number of cards from both decks and are informed of which cards are facts and which cards are lies. 
	* Note that players only know of the truthfulness of their own cards, not the other players. 
	* Players may write secret notes at any time (not on the cards though - are you crazy?)
3. A player is selected at random to start the first round. Players may volunteer to start the first round, if multiple players volunteer, the starting person is selected at random from those players

## Playing a hand

1. The starting player picks a card from their hand and plays it
2. The player immedately to the left of that player then plays a card, if that card contradicts any card in play then 
	1. the person who played the lie card is knocked out of the game 
	2. both cards are immedately removed from play
	3. the person who played the truth card may select a card from the departing players deck, however that player will not be able to reclaim a card at the end of the round
3. The round continues until everyone has played one card

## Finishing a round

1. The starting player reclaims a card from the cards in play (excepting the card they themselves have just played), unless they have knocked out another player this round, in which case they skip picking up a card
2. The player immediately to the left then reclaims a card, unless they have knocked out another player this round, in which case they skip picking up a card
3. The round continues until there are no more cards
4. The player to the left of the starting player becomes the new starting player and the round continues

## Winning

The game is won when one of two things happen

1. All players except one are knocked out
3. None of the remaining players can prove you to be a liar
	* Any player may declare a themselves the winner at the end of a round by exposing their hand to all the other players. Going in a clockwise direction from the "winner" the other players may expose a single card to the would-be victor, if that card is "true" and contradicts one of the cards in their hand, then the declarer is knocked out and the game continues. If the card is false, then the player who showed the card is knocked out, even if a subsequent player proves the declarer to be a liar. If nobody can prove the declarer a liar, then the delarer wins. 
 	* Multiple people may declare at the end of the round. Declarers are dealt with in a clockwise direction from the starting player. You may not declare after someone on your left has declared.

## Computer Implementation Notes

* To make it easier to remember, the information on the card-pairs should be randomly generated/selected from a large set of potential data. In this way players are less likely to remember "facts" from previous games
* Players should be able to make secret notes to themselves on cards. At the start of the game the computer should mark each card given to the player with a secret note indicating whether it's true or false. In the pen-and-paper version this can be achieved, albiet with somewhat less elegance, by simply writing down the card name
