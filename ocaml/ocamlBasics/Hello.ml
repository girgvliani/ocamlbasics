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

(* type suit  = Diamonds| Hearts | Spades | Clubs

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
        | ((f1,w1),(f2,w2)) -> if f1=f2 then w1 > w2 else false *)

(* Sum Types *)
(* 
type 'a option = None| Some of 'a  *)

(* Option is a module which collects 
useful functions and values for option *)

(* let is_some x = match x with 
    |Some _ -> true
    |None -> false

let get x = match x with 
    |Some y -> y

let value x a = match x with
    |Some y -> y
    |None -> None

let map f x = match x with 
    |Some y -> Some (f y)
    |None -> None

let join a = match a with 
    |Some a' -> a'
    |None -> None  *)


(* option type is useful in defining patial functions*)

(* let rec get_value a l = match l with 
    |[] -> None
    |(b,z)::rest -> if a=b then Some z
        else get_value a rest *)


(* TODO have to check up on this dont get how this works*)


(* int sequence: *)

(* type sequence = End | Next of (int * sequence) *)

(* polymorphic sequence: *)

(* type 'a sequence = End| Next of ('a * 'a sequence)

let rec nth n s = match (n,s) with 
    |(_, End) -> None
    |(0,Next (x,_)) -> Some x
    |(n,Next (_,rest)) -> nth (n-1) rest

let rec down = function 
    0 -> End
    | n -> Next(n, down(n-1)) *)

(* last call *)

(* let f x = x +5
let g y = let z = 7
    in if y>5 then f (-y )
        else z + f y *)

(* tail recursion *)
(* 
let rec fac1 = function 
    (1, acc) -> acc
    |(n, acc) -> fac1 (n-1, n*acc)

let rec loop x = if x<2 then x
    else if x mod 2 = 0 then loop(x/2)
    else loop(3*x+1) *)

(* a recursive function is called a tail recursive function
if all calls to f (are last)?? *)

(* reversing a list using tail recursion *)

(* let rec rev list = let rec r a l = 
    match l 
    with [] -> a
    |x::xs -> r (x::a) xs
    in r [] list *)


(* Some List Functions *)

(* let plus y x = x + y


let rec map f  = function
    [] -> []
    |x::xs -> f x :: map f xs

let rec fold_left f a = function
    [] -> a
    |x::xs -> fold_left f (f a x) xs

let rec fold_right f = function
    [] -> fun b -> b
    |x::xs -> fun b -> f x (fold_right f xs b)

let rec find_opt f = function
    [] -> None
    |x::xs -> if f x then Some x else find_opt f xs *)


(* Polymorphic Datatypes *)

(* type 'a tree =  Leaf of 'a
    |Node of ('a tree * 'a tree)

let rec size  = function 
    Leaf _ -> 1
    |Node(t,t') -> size t + size t'

let rec flatten = function
    Leaf x -> [x]
    |Node (t,t') -> flatten t @ flatten t'

let flatten1 t = let rec doit = function
    (Leaf x, xs) -> x::xs
    |(Node(t,t'), xs) -> let xs = doit(t',xs)
        in doit (t,xs)
    in doit (t, []) *)

(* 
type 'a queue = 'a list

let dequeue =  function
    [] -> (None, [])
    |x::xs -> (Some x, xs)

let enqueue x xs = xs @ [x] *)

(* if we represent queue as two lists it gets better *)

(* type 'a queue  = Queue of 'a list * 'a list

let is_empty = function
    Queue([],[]) -> true
    |_ ->false

let queue_of_list list = Queue(list, [])

let list_of_queue = function
    Queue(first , []) -> first
    |Queue(first , last) -> first @ List.rev last

let enqueue x (Queue (first, last)) =
        Queue (first, x::last)

let dequeue = function 
    Queue ([], last) -> (match List.rev last 
    with [] -> (None, Queue([],[]))
    |x::xs -> (Some x, Queue (xs, [])))
    |Queue(x::xs, last) -> (Some x, Queue (xs, last)) 
 *)

(* CH5 Practical features of ocaml *)

(* Some examples of pre-defined constructos for Exeptions *)

(* Division_by_zero   
    Invalid_argument of string
    Failure of string
    Match_Failure of string * int * int | incompetent match
    Not_Found 
    Out_of_memory
    End_of_file
    Exit
*)

(* an exeption is a first class citizen a value from a datatype "exn" *)

(* to introduce a new exception we have to extend the datatype exn *)

(* raising exceptions  *)

(* let divide (n,m) = try (n/m) with Division_by_zero -> raise Division_by_zero

let rec member x l = try if x = List.hd l then true else member x (List.tl l)
    with Failure _ -> false *)

(* to raise exception use the keywork raise *)

(* let f (x,y) = x/(y-1)

let g (x,y) = try let n = try f (x,y)
    with Division_by_zero -> raise(Failure "Division by zero")
        in string_of_int n
    with Failure str -> "Error: "^str *)


(* Textual Input and Output *)

(* ocaml is not complitely functional  *)

(* print_string "your number = " *)

(*let x = read_line()  works in command line doesnt work here dont know why*)

(* Reading from a file *)

(* let infile = open_in "test";;
val infile : in_channel = <abstr>
input_line infile;;
- : string = "The file’s single line ...";;
input_line infile;;
Exception: End_of_file *)

(* this should happen it doesn't *)

(* stdin : in_channel (is the strandard input as channel)
    input_chat : in_channel -> char (returns the next character if the channel)
    in_channel_length : in_channel -> int (returns the total length if the channel)
*)

(* let outfile = open_out "test" *)


(*output_string outfile "Hello" *)


(* close_out outfile this is for closing should be used independently  *)

(* this creates a new file named test  *)


(* Several actions can be sequences by the means of sequence operator  ';'*)

(* print_string "Hello";
print_string " ";
print_string "Bye\n"; *)


let rec iter f = function 
    [] -> ()
    |x::[] -> f x
    |x::xs -> f x; iter f xs
