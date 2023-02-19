from Notes import Note, Step, shiftNote, toString


type
  Scale* = ref object of RootObj
    tonic: Note
    notes: seq[Note]
  Pattern* = seq[Step]

let
  majorScale*: Pattern = @[Whole, Whole, Half, Whole, Whole, Whole, Half]
  minorScale*: Pattern = @[Whole, Half, Whole, Whole, Half, Whole, Whole]
  harmonicMinorScale*: Pattern = @[Whole, Half, Whole, Whole, Half, WholeHalf, Half]

proc constrScale*(note: Note, pattern: Pattern): Scale =
  var
    prevNote: Note = note
  new result
  result.tonic = note
  result.notes.add(note)
  for step in pattern:
    let toAdd = prevNote.shiftNote(step)
    result.notes.add(toAdd)
    prevNote = toAdd

proc toString*(self: Scale): string =
  for note in self.notes:
    result = result & note.toString & " "