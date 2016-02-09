(*
 * Problem A
 * As sequências de Hofstadter-Huber
 *
 * Hugo Matalonga
 * a33031@ubi.pt
 *)


(* Helper function *)
let is_valid n =
  if n > 0 && n <= 50 then true
  else false
;;

(* Input *)
let r = read_int ();;
let s = read_int ();;
let n = read_int ();;

(* Recursive function *)
let rec hh n =
  (* Constraints *)
  if not (is_valid n) || r >= s || s < 2 then failwith "Dead!"
  else
  if n >= 1 && n <= s then 1
  else
    let a, b = n - (hh (n - r)), n - (hh (n - s)) in
    if a < 1 || b < 1 then failwith "Dead!"
    else hh a + hh b
;;

(* Output *)
try
  (* Constraints *)
  if not (is_valid r) || not (is_valid s) then failwith "Dead!"
  else
    print_int (hh n);
  print_newline ()
with _ ->
  print_string "Dead!\n"
;;

