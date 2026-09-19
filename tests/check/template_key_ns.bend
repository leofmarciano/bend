# a ~ argument's operators must be named inside the argument: the template
# is specialized when its ( is read, before an outer ": T" renames the .add
# pushed inside, so the instance would be built from Nat.add while the
# source means Bar.add (here, Empty)

type Empty is Data:

type Unit is Data:
  Unit{}

def Nat.add(a: Type, b: Type) -> Type:
  Unit

def Bar.add(a: Type, b: Type) -> Type:
  Empty

def Pick(~x: Type) -> Type:
  x

def contradiction() -> (Pick(~Unit + Unit) : Bar):
  Unit{}

#|Error:
#|- message  : the operators' namespace inside the ~ argument (as in (a + b : T))
#|Location:
#|19 | 
#|20>| def contradiction() -> (Pick(~Unit + Unit) : Bar):
#|21 |   Unit{}
#|exit 1
