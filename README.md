Liar's Lair
======

A (untested) card game for between 3 and 8 players. Liar's Lair is a game of deceit, misdirection, theft, accusation, and trickery.  

It's designed to be played with a computer "referee", however there is no reason that a human (or, with some minor rule changes, the players themselves) couldn't perform that role.

![Card back](https://github.com/madmaw/LD4825/blob/master/images/back_bw_medium.png?raw=true)

## Setting Up

There are two decks of cards, each card from one deck has an equivalent card in the other deck that has a conflicting piece of information. For example one deck might have a card that states "Goats are renown for their love of prunes" while the other would have "Goats hate prunes", these two cards are referred to as a "card-pair". The information on the cards is intentionally bizarre so that it may not be casually independenctly verified (although goats probably do love prunes). Between games card-pairs may also be swapped between decks, provided they both never appear in the same deck.

* You may add or remove card-pairs to increase or decrease the difficulty or to make the number of cards given to each player be a round number. 
* Players should start with a minimum of 4 cards (2 truth and 2 lies).
* Cards images are available for download and printing in the images directory of this project. You can also obtain a zip file of the entire project, including the images, by using the 'ZIP' button at the top of the page.

![Card front 1](https://github.com/madmaw/LD4825/blob/master/images/goat_prune_1_bw_medium.png?raw=true) ![Card front 2](https://github.com/madmaw/LD4825/blob/master/images/goat_prune_2_bw_medium.png?raw=true)


## Starting a game

1. At the start of play one deck is chosen at random to be the "deck of lies", while the other is the "deck of truth". Each deck is shuffled (but the decks are not mixed together)
2. Each player is given an equal number of cards from both decks and are informed of which cards are facts and which cards are lies. 
	* Note that players only know of the truthfulness of their own cards, not the other players. 
	* Players may write secret notes at any time (not on the cards though - are you crazy?)
3. A player is selected at random to start the first round. Players may volunteer to start the first round, if multiple players volunteer, the starting person is selected at random from those players

## Playing a hand

1. The starting player picks a card from their hand and plays it
2. The player immediately to the left of that player then plays a card, if that card contradicts any card in play then
	1. the person who played the lie card is knocked out of the game 
	2. both cards are immediately removed from play
	3. the person who played the truth card may select a card from the departing players deck, however that player will not be able to reclaim a card at the end of the round
3. The round continues in an clockwise direction until everyone has played one card

## Finishing a round

1. The last player to play a card, reclaims a card from the cards in play (including, if they wish, the card they themselves have just played), unless they have knocked out another player this round, in which case they skip picking up a card
2. The player immediately to ther right then reclaims a card, unless they have knocked out another player this round, in which case they skip picking up a card
3. Players continue to reclaim cards in an anti-clockwise direction  until there are no more cards (at this point, every player still in the game should have the same number of cards in their hand that they started with)
4. The player to the left of the starting player becomes the new starting player and a new round starts

## Winning

The game is won when one of two things happen

1. All players except one are knocked out
2. None of the remaining players can prove you to be a liar
	* Any player may declare a themselves the winner at the end of a round by exposing their hand to all the other players. Going in a clockwise direction from the "winner" the other players may expose a single card to the would-be victor, if that card is "true" and contradicts one of the cards in their hand, then the declarer is knocked out and the game continues. If the card is false, then the player who showed the card is knocked out, even if a subsequent player proves the declarer to be a liar. If nobody can prove the declarer a liar, then the declarer wins.
 	* Multiple people may declare at the end of the round. Declarers are dealt with in a clockwise direction from the starting player. You may not declare after someone on your left has declared.
	* If you declare and you have conflicting cards in your hand (both cards in a card-pair) then you are immediately disqualified

## Variations

These may help address various balance issues with the game or make it more fun

* Players start with a random selection of truth and lies cards (not an evenly matched number of both)
* Upon finishing a round, the new starting player is the person on the old starting players right (instead of left), all other directions remain the same
* Only deal a portion of the deck at the start of the game, so the equivalent card for a given pair may not be in play
* A player can win by having a hand composed entirely of provable lies (that is, lies for which someone else is holding the equivalent truth card). Call this style of win "absolution"
* Upon being knocked out, the departing player does not reveal their hand to the victor, but instead "gifts" them a card from their hand
* Upon being knocked out, the departing player does not reveal their hand to the victor, but instead chooses a card from their hand to add to the cards in play. They are still knocked out, however this card may be reclaimed by any player, as per the normal rules for reclaiming cards, at the end of the round
* Each player is assigned a fictional character (eg. Ms Scarlet, Colonel Mustard, etc...) and the facts/lies in play relate directly to the fictional character of the players (eg. Ms Scarlet is prone to bouts of drinking/Ms Scarlet is known for her abstinence)
    * A further variation would be to have all the truth cards for a given player start with that player and the lies be distributed amongst the other players (I suspect this will make the game too predicable though)
    * Alternatively the player could start with all the lies about themselves and the other players could start with a random selection of truth cards
        * The character assigned to the player is known only to themselves, an additional victory condition is to remove any truth cards about that character from play (either by knocking out players who hold them, or by having them in your own hand) and revealing your identity

## Software Implementation Notes

* The computer takes the place of the referee (and potentially other players), keeping track of which cards are true and which are lies and resolving conflicts
* To make it easier to remember, the information on the card-pairs should be randomly generated/selected from a large set of potential data. In this way players are less likely to remember, and be confused by, "facts" from previous games
* Players should be able to make secret notes to themselves on cards. At the start of the game the computer should mark each card given to the player with a secret note indicating whether it's true or false. In the pen-and-paper version this can be achieved, albeit with somewhat less elegance, by simply writing down the card name