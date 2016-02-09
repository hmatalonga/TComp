(*
 * Problem B
 * OhhI - a little Logic Game
 *
 * Hugo Matalonga
 * a33031@ubi.pt
 *)

(* Helper functions ------------------------------------- *)
let explode s =
  let rec exp i l =
    if i < 0 then l else exp (i - 1) (s.[i] :: l) in
  exp (String.length s - 1) []
;;

let rec get_col k xs ys =
  match xs with
  | [] -> List.rev ys
  | hd :: tl -> get_col k tl (List.nth hd k :: ys)
;;

(* Input functions ------------------------------------- *)
let input_size () =
  let n = read_int () in
  (* Constraints *)
  match n with
  | 4 | 6 | 8 | 10 -> n
  | _ -> -1
;;

let input_line n =
  let line = read_line () in
  (* Constraints *)
  if String.length line != n then failwith "Wrong size"
  else line
;;

let rec input_board board n =
  if n <= 0 then board
  else
    let line = read_line () in
    input_board (board @ [explode line]) (n-1)
;;

(* Check No.1 ------------------------------------- *)
let rec count_colors xs (r, b) =
  (* (Red, Blue) *)
  match xs with
  | [] -> (r, b)
  | 'A' :: tl -> count_colors tl (r, b+1)
  | 'V' :: tl -> count_colors tl (r+1, b)
  | _ -> (-1, -1)
;;

let check_colors n (r, b) =
  if r < 0 || b < 0 then false
  else
  if r = b then true
  else false
;;

(* Check No.2 ------------------------------------- *)
let rec check_block xs =
  match xs with
  | [] -> true
  | 'A' :: 'A' :: 'A' :: tl -> false
  | 'V' :: 'V' :: 'V' :: tl -> false
  | _ :: tl -> check_block tl
;;


(* Input ------------------------------------- *)
let n = input_size ();; (* Board Size *)
let board = input_board [] n;; (* Board lines *)

(* Check rules here -------------------------- *)
try
  if n < 0 then failwith "Wrong board size";
  (* Check No.1 ------------------------------------- *)
  (* Rows *)
  List.iter (
    fun xs -> let pair = count_colors xs (0, 0) in
      if not (check_colors n pair) then failwith "NO"
  ) board;

  (* Cols *)
  for i = 0 to (List.length board) - 1 do
    let xs = get_col i board [] in
    let pair = count_colors xs (0, 0) in
    if not (check_colors n pair) then failwith "NO"
  done;

  (* Check No.2 ------------------------------------- *)
  if n > 4 then (
    (* Rows *)
    List.iter (fun xs -> let ret = check_block xs in
                if not ret then failwith "NO"
              ) board;

    (* Cols *)
    for i = 0 to (List.length board) - 1 do
      let xs = get_col i board [] in
      if not (check_block xs) then failwith "NO"
    done;
  );
  (* Check No.3 ------------------------------------- *)
  (* Rows *)
  List.iter (fun xs -> let ys = List.filter (fun zs -> zs = xs) board in
              if List.length ys > 1 then failwith "NO"
            ) board;

  (* Cols *)
  for i = 0 to (List.length board) - 1 do
    let xs = get_col i board [] in
    let ys = List.filter (fun zs -> zs = xs) board in
    if List.length ys > 1 then failwith "NO"
  done;

  (* We're done *)
  print_endline "YES"
with
| _ -> print_endline "NO"