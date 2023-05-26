(* type person = { name: string; sur:string; age:int }

let jack = { name="jack"; sur="simons"; age=30 };; *)


(* 
match n 
with 0 -> "null";
    |1 -> "one";
    |_ -> "cant count :)  (come on man we only know binary)";; *)

(* lists *)

(* let mx = [];;

let l1 = 1::mx;;

let l = [1;2;3];;

let l = 1::2::3::[];;

all elements must have the same type *)



(* functions *)

(* let double x = 2*x *)

(* variables in functions *)

(* let double  = fun x -> 2*x *)

(* recursive functions *)

(* let rec fac n = if n < 2 then 1 else n*fac(n-1) 

let rec fib n = if n <= 1 then 1 else fib (n-1) + fib(n-2) *)


(* function pattern matching short cut *)

(* let rec len = fun l -> match l 
with [] -> 0
|x::xs -> 1 + len xs

let rec shortlen = function [] -> 0
|x::xs -> 1 + len xs

 *)

(* mutually recursive *)
    (* if functions call themselver indirectly via other functions
    they are mutuallu recursive  *)

(* let rec even n = if n = 0 then "even" else odd(n-1)
and odd n = if n = 0 then "odd" else even(n-1) *)

(* hint: to get the correct answer from this code call even function 
    and give it a number you want to check *)
(* 
let rec listConcat l y = match l 
    with [] -> y
    |x::xs -> x :: listConcat xs y

let rec lconcat = function [] -> fun y -> y
    |x::xs -> fun y -> x::lconcat xs y *)


(* Local Definitions *)

(* let x = 5
in let sq = x*x
in sq+sq *)

(* as far as I am concerned this is just a local usage of
 let which can not be accessed from outside something like a local variable*)


(* facit means factor it and it doesn't mean
 fuck it get that though you thick skull :) *)
 
(* let facit n  =  let rec 
    iter m yet = if m> n then yet 
        else iter (m+1) (m*yet)in iter 2 1 *)


(* User Defined DataTypes *)

type suit  = Diamonds| Hearts | Spades | Clubs

type value  = Seven| Eight | Nine | Jack | Queen | King | Ten | Ace

let string_of_suit = function 
                (_,Diamonds) -> "Your card is a Diamond"
                |(_,Hearts) -> "I can sence something red is it a Heart??"
                |(_,Spades) -> "You seem to like crows it is a Spade"
                |(_,Clubs) -> "Clubs really?"

let takes c1 c2 = match (c1,c2) 
    with ((f1, Queen),(f2, Queen)) -> f1 > f2
        |((_, Queen),_) -> true
        |(_, (_, Queen)) -> false
        |((f1, Jack), (f2, Jack)) -> f1 > f2
        |((_, Jack),    _) -> true
        |(_, (_, Queen)) -> false
        | ((Hearts,w1),(Hearts,w2)) -> w1 > w2
        | ((Hearts,_),_) -> true
        | (_,(Hearts,_)) -> false
        | ((f1,w1),(f2,w2)) -> if f1=f2 then w1 > w2 else false

(* Sum Types *)