# Challenges-for-Haskell-and-Prolog
Assorted tasks written in Haskell and Prolog (inspired by The Sunday Times newspaper challenges)

# Haskell
## Party
(aka `Party.hs`)

Every week, The Sunday Times newspaper publishes a Teaser. Teaser 3026, of Sunday 20th September 2020, was as follows:

> A four-digit number with different positive digits and with the numbers represented by its last two digits a multiple of the number represented by its first two digits, is called a PAR.
>
> A pair of PARs is a PARTY if no digit is repeated and each PAR is a multiple of the missing positive digit.
>
> I wrote down a PAR and challenged Sam to use it to make a PARTY. He was successful.
>
> I then challenged Beth to use my PAR and the digits in Sam’s PAR to make a different PARTY. She too was successful.
>
> What was my PAR? Note that in this Teaser, zero is not considered to be a positive digit.

.1 - Takes a positive integer and returns a list of its digits

.2 - Returns true if an integer (which can be assumed to have four digits) is a PAR

.3 - Returns true if a pair of integers (which can be assumed to be PARs) is a PARTY

## Bilateral
(aka `Bilateral.hs`)

Teaser 3132, of Sunday 1st October 2022, was as follows:

> My son, at a loose end after A-levels, asked me for a mental challenge, As we’d been discussing palindromes, I suggested he try to find an arrangement of the digits 1 to 9 with the multiplication symbol “x” to give a palindrome as the answer, and he came
> up with 29678x1453 = 43122134.
>
> I said “Now try to find the smallest such palindromic product starting in 4, where the last digit of the smallest number is still 3.
>
> He found that smallest product, and, interestingly, if he added the two smaller numbers instead of multiplying them, then added 100, he also go a palindrome.
>
> What was the smallest product?

.1 - Takes a list of digits and returns the positive integer formed from those digits

.2 - Returns all of the non-trivial splits of a list as a list of pairs and shows Haskell definition to list all 2,903,040 pairs that make up the Teaser solution space.

.3 - Takes a possible Teaser solution, and re- turns true if it is an actual solution to the Teaser and shows Haskell definition to list all six acceptable solutions to the Teaser


# Prolog

## Suko
(aka `Suko.pl`)

Every day, The Times newspaper publishes a Suko puzzle. 

Readers are challenged to place the digits 1 to 9 in the cells of a grid so that numbers in four white circles are the sums of the digits in the cells surrounding them, and the numbers in the three coloured circles are the sums of the digits in the cells of the same colour.

.1 - takes a list of indices (numbering from zero) and a list of elements, and returns a list of the elements with the indices, so that

`indices( [1,3,4], [a,b,c,d,e,f], ES ) ES = [b,d,e]`

.2 - Prolog predicate “possible” that may be stepped with ⟨ NEXT ⟩ to return successive arrangements of the digits ‘1’ . . . ‘9’ that might be possible solutions of a Suko puzzle

.3 - Checks if a solution to a Suko puzzle is acceptable


## Trait
(aka `Trait.pl`)

Teaser 3125, of Sunday 14th September 2022, was as follows:

> At Teaser Tor trig. point I found a geocaching box. 
>
> The three-figure compass bearings (bearing 000 = north, 090 = east, etc.) from there to the church spires at Ayton, Beeton and Seaton were needed to decode the clue to the next location.
>
> Each spire lay in a different compass quadrant (eg. 000 to 090 [sic] is the North-East quadrant). Curiously, each of the numerals 1 to 9 occurred in these bearings and none of the bearings were prime values.
>
> Given the above, if you chose one village at random to be told only its church spire’s bearing, it might be that you could not calculate the other two bearings with certainty, but it would be more likely that you could.
>
> Give the three bearings in ascending order.

.1 - Takes and integer and returns true if it is a prime number

.2 - Prolog predicate “possible” that may be stepped with ⟨ NEXT ⟩ to return successive bearings that might be possibe solutions of the Bearings’ Trait

.3 - Checks if a solution to the Bearings’ Trait is acceptable
