# the same without the inner annotation: the enclosing ": U32" does not
# reach into the ~ argument, and the instance is built before it is read,
# so the ~ argument must name its operators' namespace itself
import Base

def T(~f: U32 -> U32, x: U32) -> U32:
  f(x)

def main() -> IO(Unit):
  IO.print(U32.show((T(~(x => x + 1), 41) : U32)))

#|Error:
#|- message  : the operators' namespace inside the ~ argument (as in (a + b : T))
#|Location:
#| 9 | def main() -> IO(Unit):
#|10>|   IO.print(U32.show((T(~(x => x + 1), 41) : U32)))
#|11 | 
#|exit 1
