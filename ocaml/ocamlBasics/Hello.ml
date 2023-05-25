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
|x::xs -> 1 + len xs *)


