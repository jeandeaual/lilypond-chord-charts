\version "2.21.80"

\include "predefined-mandolin-fretboards.ly"

\header {
  title = "Mandolin Chord Chart (G–D–A–E Tuning)"
  source = "https://lilypond.org/doc/stable/Documentation/notation/predefined-fretboard-diagrams"
  keywords = #(string-join '(
    "music"
    "mandolin"
    "chords"
  ) ", ")
  tagline = ##f
}

\paper {
  markup-system-spacing.padding = #6
  system-system-spacing.padding = #3
}

chordTypes = \chordmode {
  c1
  c:m
  c:aug
  c:dim7
  c:7
  c:maj7
  c:m7
  c:m7.5-
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
    \set Staff.stringTunings = #mandolin-tuning
    \override FretBoard.fret-diagram-details.finger-code = #'in-dot
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
