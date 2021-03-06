module WordsCharacters where 

import qualified Data.Map as Map

gfWords = Map.fromList [
	("A",a)
	, ("ADV",adv)
	, ("Aux",aux)
	, ("CONJ",conj)
	, ("Det",det)
	, ("N",n)
	, ("PN",pn)
	, ("Pron",pron)
	, ("Prep",prep)
	, ("Rel",rel)
	, ("Tag",tag)
	, ("V",v) ]

wordlist = concat ( map (gfWords Map.!) (Map.keys gfWords) )

posMap = Map.fromList [
	("A","Adjective")
	, ("ADV","Adverb")
	, ("Aux","Auxiliary")
	, ("CONJ","Conjunction")
	, ("Det","Determiner")
	, ("N","Noun")
	, ("PN","Proper Noun")
	, ("Pron","Pronoun")
	, ("Prep","Preposition")
	, ("Rel","Relative Pronoun")
	, ("Tag","Question Tag")
	, ("V","Verb")
	]

a = [
	"beautiful"
	, "big"
	, "first"
	, "great"
	, "homeless"
	, "little"
	, "lonely"
	, "middle-class"
	]

adv = [
	"pretty"
	]

aux = [
	"doesn't"
	, "don't"
	, "does"
	, "do"
	, "is"
	, "are"
	, "isn't"
	, "aren't"
	]
	

conj = [
	"because"
	]


det = [
	"'s"
	, "a"
	, "about"
	, "an"
	, "no"
	, "some"
	, "the"
	, "five"
	, "one"
	]

n = cn ++ un

cn = [
	"ten-dollar bill"
	, "age"
	, "apartment"
	, "gift bag"
	, "birthday"
	, "bottle"
	, "budget"
	, "card"
	, "children"
	, "daughter"
	, "dummy"
	, "fragrance"
	, "idea"
	, "job"
	, "man"
	, "month"
	, "shelter"
	, "sign"
	, "smell"
	, "spirit"
	, "week"
	, "woman"
	]

un = [
	"cooking"
	, "lotion"
	, "money"
	, "rent"
	, "savings"
	, "unemployment"
	, "enjoying life"
	, "retiring"
	, "sitting back"
	]

pn = [
	"Christmas"
	, "the state of Colorado"
	, "Queen"
	]

pron = [
	"who"
	, "whom"
	]

prep = [
	"for"
	]

rel = [
	"that"
	, "who"
	]

tag = [
	"doesn't he"
	, "doesn't she"
	, "doesn't it"
	, "don't they"
	, "does he"
	, "does she"
	, "does it"
	, "do they"
	, "isn't he"
	, "isn't she"
	, "isn't it"
	, "aren't they"
	, "is he"
	, "is she"
	, "is it"
	, "are they"
	]

v = [
	"work"
	, "buy, buys"
	, "lose"
	, "take care"
	, "cover"
	, "cry"
	, "dress"
	, "feel"
	, "get"
	, "go"
	, "hand"
	, "have"
	, "lay off"
	, "lift"
	, "look"
	, "look"
	, "move in"
	, "open"
	, "receive"
	, "remember"
	, "smell"
	, "take"
	, "thank"
	, "think"
	, "turn"
	, "want"
	, "work for"
	]

{-

ten-dollar bill	: CN;
thirties
forties
sixty
Christmas	: PN;
the state of Colorado	: PN;
one
Queen	: PN;
work	: V2;
age	: CN;
all
another
apartment	: CN;
as
at
badly
be
beautiful	: AP;
because
big	: A;
birthday	: CN;
bottle	: CN;
budget	: CN;
buy	: V;
card	: CN;
children	: CN;
cooking	: N;
cover	: V;
cry	: V;
daughter	: CN;
deal
dress	: V;
dummy	: CN;
enjoying life	: N;
ever
feel	: VA;
first	: A;
five	: Det;
for	: Prep;
fragrance	: CN;
get	: V2;
gift bag	: CN;
go	: V;
great	: A;
hand	: V;
have	: V2;
homeless	: A;
idea	: CN;
in
interview
into
it
job	: CN;
joy
just
lay off	: V;
life	: N;
lift	: V;
like
little	: A;
lonely	: A;
look	: VA;
lose	: V;
lotion	: N;
man	: CN;
middle-class	: A;
money	: N;
month	: CN;
most
move in	: V;
never
no
nobody
not
of
off
one	: Det;
open	: V;
or
out
pretty	: Adv;
receive	: V;
remember	: V;
rent	: N;
retiring	: N;
savings	: N;
shelter	: CN;
sign	: CN;
sitting back	: N;
smell	: V2;
smell	: CN;
so
some
spirit	: CN;
take	: V;
thank	: V;
think	: VS;
to
turn	: V;
um
unemployment	: N;
up
very
want	: V2V;
way
week	: CN;
were
when
which
with
woman	: CN;
working

-}

-- vim: set ts=2 sts=2 sw=2 noet:
