def nat_identity: Nat → Nat
| nat => nat

def id_string : String → String
| s => s

def id_string2 (s : String) : String := s

#eval id_string2 "Hello"