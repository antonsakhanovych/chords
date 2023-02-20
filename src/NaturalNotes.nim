type
  NaturalNote* = enum
    C = 0, D = 2, E = 4, F = 5, G = 7, A = 9, B = 11


proc nextNote*(note: NaturalNote): NaturalNote = 
  case note:
    of C: return D
    of D: return E
    of E: return F
    of F: return G
    of G: return A
    of A: return B
    of B: return C
