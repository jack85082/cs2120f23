#check Empty


inductive Chaos : Type


def from_empty (e : Empty) : Chaos := nomatch e


def From_false {P : Prop} (p : False) : P := False.elim p
--False.elim is for Props what nomatch is for Types


def from_false_true_is_false (p : False) : True = False := False.elim p
--anything follows from a proof of False

/-!
# Curry-Howard Correspondance/Isomorphism
-/
--Empty -> False
--Unit -> True
#check False --Prop
#check True --Proo
#check True.intro --prrof of True

def proof_of_true : True := True.intro

def false_imples_true : False → True := fun f => False.elim f

--Prod -> And
#check Prod
#check And

inductive Birds_chirping : Prop
| yep
| boo

inductive Sky_blue : Prop
| yep

#check And Birds_chirping Sky_blue

theorem both_and  : And Birds_chirping Sky_blue := And.intro Birds_chirping.boo Sky_blue.yep

/-!
# Proof Irrelevance
-/

theorem proofs_equal : Birds_chirping.yep = Birds_chirping.boo := by trivial

--All proofs are equivalent in Prop
--choice of values in prop doesn't influence computations

--Sum -> Or

#check Sum
#check Or

theorem one_or_other : Or Birds_chirping Sky_blue := Or.inl Birds_chirping.yep
theorem one_or_other' : Or Birds_chirping Sky_blue := Or.inr Sky_blue.yep

example : Or Birds_chirping (0=1) := Or.inl Birds_chirping.yep
example : (0=1) ∨ (1=2) := _

theorem or_comm {P Q : Prop} : P ∨ Q → Q ∨ P :=
fun d =>
  match d with
  | Or.inl p => Or.inr p
  | Or.inr q => Or.inl q

  --Not (no)
  def no (α : Type) := α → Empty

  #check Not
  --Not P is defined to be P → False

  example : no Chaos := fun c => nomatch c

  inductive Raining : Prop
  example : ¬ Raining := fun r => nomatch r
