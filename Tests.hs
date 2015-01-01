module Tests where

import Control.Monad
import Data.Maybe

import Data.DRS

import PGF
import Jackson
import Representation
import Evaluation
import Model
import WordsCharacters

-- handler gr core tests = putStr $ unlines $ map (\(x,y) -> x++show y) $ zip (map (++"\t") tests ) ( map (\string -> map (\x -> core ( x) ) (parse gr (mkCId "DicksonEng") (startCat gr) string)) tests )

-- import System.Environment.FindBin

ans tests = do
  gr	<- readPGF ( "./Jackson.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map (map ( (linear gr) <=< transform ) ) ps
  let zs = zip (map (++"\t") tests) ls
  putStrLn (unlines (map (\(x,y) -> x ++ (show $ unwords (map displayResult y))) zs) )

displayResult = fromMaybe "Nothing"

trans tests = do
  gr	<- readPGF ( "./Jackson.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ls = map id ps
  let zs = zip (map (++"\t") tests) (map (map (showExpr []) ) ps)
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

reps tests = do
  gr	<- readPGF ( "./Jackson.pgf" )
  let ss = map (chomp . lc_first) tests
  let ps = map ( parses gr ) ss
  let ts = map (map (\x -> (((unmaybe . rep) x) (term2ref drsRefs var_e) ))) ps
  let zs = zip (map (++"\t") tests) ts
  putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

lf tests = do
	gr	<- readPGF ( "./Jackson.pgf" )
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToLF (((unmaybe . rep) p) (DRSRef "r1"))) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

fol tests = do
	gr	<- readPGF ( "./Jackson.pgf" )
	let ss = map (chomp . lc_first) tests
	let ps = map ( parses gr ) ss
	let ts = map (map (\p -> drsToFOL ( (unmaybe . rep) p (term2ref drsRefs var_e) ) ) ) ps
	let zs = zip (map (++"\t") tests) ts
	putStrLn (unlines (map (\(x,y) -> x ++ (show y ) ) zs) )

dic_test = [
  "Queen works for the State of Colorado."
  , "Queen has great ideas of retiring."
  , "Queen has great ideas of sitting back."
  , "Queen has great ideas of enjoying life."
  , "Queen is laid off."
  , "Queen has some money in savings."
  , "Queen thinks no big deal."
  , "Queen thinks that Queen can get another job."
  , "One week turns into a month."
  , "One week turns into five months."
  , "Unemployment does not cover Queen's rent."
  , "Queen loses Queen's apartment."
  , "Queen's daughter wants Queen to move in."
  , "Queen thinks that Queen's daughter should not take care of Queen."
  , "Queen thinks that Queen should take care of Queen's children."
  , "Queen doesn't have money to buy a birthday card."
  , "Queen goes out with a sign."
  , "Queen gets dressed up."
  , "Queen looks pretty middle-class."
  , "A man hands Queen a 10-dollar bill."
  , "Queen thanks the man."
  , "Queen buys Queen's daughter a card."
  , "Queen remembers Christmas."
  , "Queen is in the shelter."
  , "Queen remembers Queen's daughters as little girls."
  , "Queen remembers the smells of cooking."
  , "Queen remembers the joy of Christmas."
  , "Queen feels pretty lonely."
  , "The women receive a gift bag."
  , "Queen gets a little bottle of lotion."
  , "Queen opens the little bottle of lotion."
  , "Queen smells the lotion."
  , "The lotion is the most beautiful fragrance Queen has ever smelled."
  , "Queen cries because the lotion lifts Queen's spirits."

  ]

yn_dic_test = [
  "Does Queen work for the state of Colorado?"
  -- , "Does Queen have great ideas of retiring?"
  -- , "Does Queen have great ideas of sitting back?"
  -- , "Does Queen have great ideas of enjoying life?"
  -- , "Is Queen laid off?"
  , "Does Queen have some money in savings?"
  , "Does Queen think that being laid off is no big deal?"
  -- , "Does Queen think that Queen can get another job?"
  , "Does one week turn into a month?"
  , "Does one week turn into five months?"
  , "Does unemployment cover Queen's rent?"
  , "Does Queen lose Queen's apartment?"
  -- , "Does Queen's daughter want Queen to move in?"
  , "Does Queen think that Queen's daughter should not take care of Queen?"
  , "Does Queen think that Queen's daughter shouldn't take care of the rent?"
  , "Does Queen think that Queen should take care of Queen's daughter?"
  -- , "Does Queen have money to buy a birthday card?"
  , "Does Queen go out with a sign?"
  , "Does Queen get dressed up?"
  , "Is Queen middle-class?"
  , "Is Queen very middle-class?"
  , "Does Queen look pretty middle-class?"
  , "Does Queen look very middle-class?"
  , "Does Queen look middle-class?"
  , "Does a man give Queen a 10-dollar bill?"
  , "Does a man give Queen money?"
  , "Does a man hand Queen a 10-dollar bill?"
  , "Does a man hand Queen money?"
  , "Does Queen thank the man?"
  , "Does Queen buy Queen's daughter a card?"
  , "Does Queen buy a birthday card?"
  , "Does Queen remember Christmas?"
  , "Does Queen remember the rent of the apartment?"
  , "Is Queen a woman?"
  , "Is Queen Queen?"
  , "Is Queen a lonely woman?"
  , "Is Queen lonely?"
  , "Is Queen in the shelter?"
  , "Does Queen remember Queen's daughters as little girls?"
  , "Does Queen remember the smell of cooking?"
  , "Does Queen remember the smells of cooking?"
  , "Does Queen remember the joy of Christmas?"
  , "Does Queen feel so lonely?"
  , "Do the women receive a gift bag?"
  , "Does Queen get a bottle of lotion?"
  , "Does Queen get a little bottle of lotion?"
  , "Does Queen open the little bottle of lotion?"
  , "Does Queen smell the lotion?"
  , "Is the lotion the most beautiful fragrance Queen has ever smelled?"
  , "Does Queen cry because the lotion lifts Queen's spirits?"

  ]

wh_dic_test = [
  "Who works for the State of Colorado?"
  , "Who has great ideas of retiring?"
  , "Who has great ideas of sitting back?"
  , "Who has great ideas of enjoying life?"
  , "Who is laid off?"
  , "Who has some money in savings?"
  , "Who thinks that being laid off is no big deal?"
  , "Who thinks that Queen can get another job?"
  , "What turns into a month?"
  , "What turns into five months?"
  , "What covers Queen's rent?"
  , "Who loses an apartment?"
  , "Whose daughter want Queen to move in?"
  , "Who thinks that Queen's daughter should not take care of Queen?"
  , "Who thinks that Queen's daughter shouldn't take care of Queen?"
  , "Who thinks that Queen should take care of Queen's children?"
  , "Who has money to buy a birthday card?"
  , "Who goes out with a sign?"
  , "Who gets dressed up?"
  , "Who is middle-class?"
  , "Who is very middle-class?"
  , "Who looks pretty middle-class?"
  , "Who looks very middle-class?"
  , "Who looks middle-class?"
  , "Who gives Queen a 10-dollar bill?"
  , "Who gives Queen money?"
  , "Who hands Queen a 10-dollar bill?"
  , "Who hands Queen money?"
  , "Who thanks the man?"
  , "Who buys Queen's daughter a card?"
  , "Who buys a birthday card?"
  , "Who remembers Christmas?"
  , "Who is in the shelter?"
  , "Who remembers Queen's daughters as little girls?"
  , "Who remembers the smell of cooking?"
  , "Who remembers the smells of cooking?"
  , "Who remembers the joy of Christmas?"
  , "Who feels so lonely?"
  , "Who receive a gift bag?"
  , "Who gets a little bottle of lotion?"
  , "Who opens the little bottle of lotion?"
  , "Who smells the lotion?"
  , "What is the most beautiful fragrance Queen has ever smelled?"
  , "Who cries because the lotion lifts Queen's spirits?"

  ]


-- vim: set ts=2 sts=2 sw=2 noet:
