# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.
from Notes import Note, Step, Pitch, toString, constrNote, shiftNote
from Scale import Scale, Pattern, constrScale, toString, majorScale, minorScale, harmonicMinorScale
from NaturalNotes import NaturalNote
if isMainModule:
  var
    allNaturalNotes: array[7, NaturalNote] = [C, D, E, F, G, A, B]
    allNotes: seq[Note]

  for note in allNaturalNotes:
    allNotes.add(constrNote(note, Flat))
    allNotes.add(constrNote(note, Usual))
    allNotes.add(constrNote(note, Sharp))
  for note in allNotes:
    let
      majScale: Scale = constrScale(note, majorScale)
      minScale: Scale = constrScale(note, minorScale)
      harMinScale: Scale = constrScale(note, harmonicMinorScale)
    echo "Major Scale: ", majScale.toString
    echo "Minor Scale: ", minScale.toString
    echo "Harmonic Minor Scale:", harMinScale.toString
    echo ""