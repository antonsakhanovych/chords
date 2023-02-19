import std/strutils
from NaturalNotes import NaturalNote, nextNote

type
  Note* = ref object of RootObj
    note: NaturalNote
    pitch: Pitch

  Step* = enum
    Half = 1, Whole = 2, WholeHalf = 3

  Pitch* = enum
    TripleFlat = -3, DoubleFlat = -2, Flat = -1, Usual = 0, Sharp = 1, DoubleSharp = 2, TripleSharp = 3

proc normalizePitch(num: int): int =
  if num >= 9 and num <= 15:
    result = num - 12
  elif num <= -9 and num >= -15:
    result = num + 12
  else:
    result = num

proc getMagnitude(self: Note): int =
  result = ord(self.note) + ord(self.pitch)

proc constrNote*(note: NaturalNote, pitch: Pitch): Note =
  result = Note(note: note, pitch: pitch)

proc toString*(self: Note): string =
  result = $self.note & (if ord(self.pitch) > 0: repeat("#", ord(self.pitch)) else: repeat("b", abs(ord(self.pitch))))

proc shiftNote*(note: Note, step: Step): Note =
  new result
  result.note = note.note.nextNote
  let 
    targetMagnitude = note.getMagnitude + ord(step)
    pitch = targetMagnitude - ord(result.note)
  result.pitch = Pitch normalizePitch pitch

