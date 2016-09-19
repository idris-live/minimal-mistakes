import Data.Vect

strange : (n : Nat) -> if n == 0 then Int else String
strange Z = 0
strange (S k) = "positive"

strange_length : (s : String) -> if length s == 0 then Int else String
strange_length s = strange (length s)

-- Doesn't compile
strange_length_broken : (s : String) -> if length s == 0 then Int else String
strange_length_broken s = strange (length s + 1)


{-
zip_replicas_broken : (numAs : Nat) -> a -> (numBs : Nat) -> b -> Vect numAs (a, b)
zip_replicas_broken numAs valA numBs valB =
  let aVec = replicate numAs valA
      bVec = replicate numBs valB
  in Vect.zip aVec bVec
-}
zip_replicas : (n : Nat) -> a -> b -> Vect n (a, b)
zip_replicas n valA valB =
  let aVec = replicate n valA
      bVec = replicate n valB
  in Vect.zip aVec bVec

{-
zip_replicas_successor_broken : (n : Nat) -> a -> b -> Vect (n + 1) (a, b)
zip_replicas_successor_broken n valA valB =
  let aVec = replicate (n + 1) valA
      bVec = valB :: replicate n valB
  in Vect.zip aVec bVec
~-}
zip_replicas_successor : (n : Nat) -> a -> b -> Vect (1 + n) (a, b)
zip_replicas_successor n valA valB =
  let aVec = replicate (1 + n) valA
      bVec = valB :: replicate n valB
  in Vect.zip aVec bVec

zip_replicas_successor2 : (n : Nat) -> a -> b -> Vect (n + 1) (a, b)
zip_replicas_successor2 n valA valB =
  let aVec = replicate (n + 1) valA
      bVec = valB :: replicate n valB
  in Vect.zip aVec (rewrite plusCommutative n 1 in bVec)