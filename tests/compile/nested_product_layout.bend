import Base

type BoxK<-a: Data> is Data:
  BoxK{f0: a, f1: a, f2: a, f3: a, f4: a, f5: a, f6: a, f7: a}

def mk0() -> U32:
  1

def mk1() -> BoxK<U32>:
  BoxK{mk0(), mk0(), mk0(), mk0(), mk0(), mk0(), mk0(), mk0()}

def mk2() -> BoxK<BoxK<U32>>:
  BoxK{mk1(), mk1(), mk1(), mk1(), mk1(), mk1(), mk1(), mk1()}

def mk3() -> BoxK<BoxK<BoxK<U32>>>:
  BoxK{mk2(), mk2(), mk2(), mk2(), mk2(), mk2(), mk2(), mk2()}

def mk4() -> BoxK<BoxK<BoxK<BoxK<U32>>>>:
  BoxK{mk3(), mk3(), mk3(), mk3(), mk3(), mk3(), mk3(), mk3()}

def mk5() -> BoxK<BoxK<BoxK<BoxK<BoxK<U32>>>>>:
  BoxK{mk4(), mk4(), mk4(), mk4(), mk4(), mk4(), mk4(), mk4()}

def mk6() -> BoxK<BoxK<BoxK<BoxK<BoxK<BoxK<U32>>>>>>:
  BoxK{mk5(), mk5(), mk5(), mk5(), mk5(), mk5(), mk5(), mk5()}

def mk7() -> BoxK<BoxK<BoxK<BoxK<BoxK<BoxK<BoxK<U32>>>>>>>:
  BoxK{mk6(), mk6(), mk6(), mk6(), mk6(), mk6(), mk6(), mk6()}

def leaf(p: BoxK<BoxK<BoxK<BoxK<BoxK<BoxK<U32>>>>>>) -> U32:
  match p:
    case BoxK{f0, f1, f2, f3, f4, f5, f6, f7}:
      match f7:
        case BoxK{g0, g1, g2, g3, g4, g5, g6, g7}:
          match g0:
            case BoxK{h0, h1, h2, h3, h4, h5, h6, h7}:
              match h7:
                case BoxK{i0, i1, i2, i3, i4, i5, i6, i7}:
                  match i0:
                    case BoxK{j0, j1, j2, j3, j4, j5, j6, j7}:
                      match j7:
                        case BoxK{k0, k1, k2, k3, k4, k5, k6, k7}:
                          k0

def sum(p: BoxK<BoxK<BoxK<BoxK<BoxK<BoxK<BoxK<U32>>>>>>>) -> U32:
  match p:
    case BoxK{f0, f1, f2, f3, f4, f5, f6, f7}:
      (leaf(f0) + leaf(f7) : U32)

def main() -> U32:
  sum(mk7())

#|2
