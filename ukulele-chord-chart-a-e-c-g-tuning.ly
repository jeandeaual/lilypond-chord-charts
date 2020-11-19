\version "2.21.80"

\include "predefined-ukulele-fretboards.ly"

\header {
  title = "Ukulele Chord Chart (A–E–C–G Tuning)"
  source = "https://lilypond.org/doc/stable/Documentation/notation/predefined-fretboard-diagrams"
  keywords = #(string-join '(
    "music"
    "ukulele"
    "chords"
  ) ", ")
  tagline = ##f
}

\paper {
  markup-system-spacing.padding = #5
  system-system-spacing.padding = #8
}

chordTypes = \chordmode {
  c1
  c:m
  c:aug
  c:dim
  c:7
  c:maj7
  c:m7
  c:6
  c:sus2
  c:sus4
  c:9
  \break
}

chordSequence = {
                   \chordTypes
  \transpose c cis \chordTypes
  \transpose c d   \chordTypes
  \transpose c dis \chordTypes
  \transpose c e   \chordTypes
  \transpose c f   \chordTypes
  \transpose c fis \chordTypes
  \transpose c g   \chordTypes
  \transpose c gis \chordTypes
  \transpose c a   \chordTypes
  \transpose c ais \chordTypes
  \transpose c b   \chordTypes
}

<<
  \new ChordNames {
    \chordSequence
  }

  \new FretBoards {
    \set Staff.stringTunings = #ukulele-tuning
    \override FretBoard.fret-diagram-details.finger-code = #'in-dot
    \chordSequence
  }

  \new Staff {
    \override Staff.TimeSignature.transparent = ##t
    \chordSequence
  }
>>

\layout {
  indent = 0\mm
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
}
