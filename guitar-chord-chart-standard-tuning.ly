\version "2.21.80"

\include "predefined-guitar-fretboards.ly"

\header {
  title = "Guitar Chord Chart (E–A–D–G–B–e Tuning)"
  source = "https://lilypond.org/doc/stable/Documentation/notation/predefined-fretboard-diagrams"
  keywords = #(string-join '(
    "music"
    "guitar"
    "chords"
  ) ", ")
  tagline = ##f
}

\paper {
  markup-system-spacing.padding = #4
  left-margin = 15\mm
}

chordTypes = \chordmode {
  c1
  c:m
  c:aug
  c:dim
  c:dim7
  c:7
  c:maj7
  c:m7
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
    \set Staff.stringTunings = #guitar-tuning
    \override FretBoard.fret-diagram-details.finger-code = #'in-dot
    \override FretBoard.size = #'1.2
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
