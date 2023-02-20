import std/strutils
from NaturalNotes import NaturalNote, nextNote

type
  Note* = ref object of RootObj
    note: NaturalNote
    pitch: Pitch

  Step* = enum
    H = 1, W = 2, WH = 3

  Pitch* = enum
    DoubleFlat = -2, Flat = -1, Usual = 0, Sharp = 1, DoubleSharp = 2

proc constrNote*(note: NaturalNote, pitch: Pitch): Note =
  result = Note(note: note, pitch: pitch)

proc getNote*(self: Note): NaturalNote =
  result = self.note

proc getPitch*(self: Note): Pitch =
  result = self.pitch

proc toString*(self: Note): string =
  result = $self.note & (if ord(self.pitch) > 0: repeat("#", ord(self.pitch)) else: repeat("b", abs(ord(self.pitch))))

proc normalizePitch(num: int): int =
  result = if num < -3: num + 12 elif num > 3: num - 12 else: num

proc getMagnitude*(self: Note): int =
  result = ord(self.note) + ord(self.pitch)

proc shiftNote*(self: Note, step: Step): Note =
  new result
  result.note = self.note.nextNote
  let 
    targetMagnitude = self.getMagnitude + ord(step)
    pitch = targetMagnitude - ord(result.note)
  result.pitch = Pitch normalizePitch pitch

