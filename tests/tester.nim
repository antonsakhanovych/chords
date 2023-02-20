import std/unittest
import std/random
from NaturalNotes import NaturalNote
from Notes import Note, Pitch, constrNote, toString, getMagnitude

proc allTest() =
  suite "Check natural notes definition":
    test "C note defined correctly":
      check ord(C) == 0
    test "D note defined correctly":
      check ord(D) == 2
    test "E note defined correctly":
      check ord(E) == 4
    test "F note defined correctly":
      check ord(F) == 5
    test "G note defined correctly":
      check ord(G) == 7
    test "A note defined correctly":
      check ord(A) == 9
    test "B note defined correctly":
      check ord(B) == 11

  suite "Notes manipulation":

    var 
      allNotes: seq[Note] = newSeq[Note]()
    for note in [C, D, E, F, G, A, G]:
      allNotes.add(constrNote(note, Flat))
      allNotes.add(constrNote(note, Usual))
      allNotes.add(constrNote(note, Sharp))
    
    test "constrNote returns instance of type 'Note'":
      let note: Note = allNotes[rand(0..len(allNotes) - 1)]
      check note of Note
      

    

when isMainModule:
  allTest()