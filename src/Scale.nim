from Notes import Note, Step, shiftNote, toString


type
  Scale* = ref object of RootObj
    tonic: Note
    notes: seq[Note]
    
  Pattern* = seq[Step]

const
  majorScale*: Pattern = @[W, W, H, W, W, W, H]
  minorScale*: Pattern = @[W, H, W, W, H, W, W]
  harmonicMinorScale*: Pattern = @[W, H, W, W, H, WH, H]

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

proc getNotes*(self: Scale): seq[Note] =
  return self.notes

