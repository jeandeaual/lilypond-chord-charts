\version "2.21.80"

\include "predefined-mandolin-fretboards.ly"

\header {
  title = "Mandolin Chord Chart"
  subtitle = "G–D–A–E Tuning"
  pdftitle = \markup \concat { \fromproperty #'header:title " (" \fromproperty #'header:subtitle ")" }
  source = "https://lilypond.org/doc/stable/Documentation/notation/predefined-fretboard-diagrams"
  enteredby = "Alexis Jeandeau"
  author = \enteredby
  keywords = #(string-join '(
    "music"
    "mandolin"
    "chords"
  ) ", ")
  tagline = ##f
}

\paper {
  % See https://github.com/lilypond/lilypond/blob/stable/2.22/scm/paper.scm#L141
  #(define paper-size
     (cond ((and (= (/ paper-width mm) 210)
                 (= (/ paper-height mm) 297))
             "A4")
           ((and (= (/ paper-width mm) 297)
                 (= (/ paper-height mm) 420))
             "A3")
           ((and (= (/ paper-width in) 8.5)
                 (= (/ paper-height in) 11))
             "Letter")
           ((and (= (/ paper-width in) 11)
                 (= (/ paper-height in) 17))
             "Tabloid")
           (else
             "")))
  #(define markup-system-spacing
     (cond ((or (equal? paper-size "A3") (equal? paper-size "Tabloid"))
             '((basic-distance . 0)
               (minimum-distance . 0)
               (padding . 5)
               (stretchability . 0)))
           (else
             '((basic-distance . 0)
               (minimum-distance . 0)
               (padding . 3)
               (stretchability . 0)))))
  #(define system-system-spacing
     (cond ((or (equal? paper-size "Letter") (equal? paper-size "Tabloid"))
             '((basic-distance . 0)
               (minimum-distance . 0)
               (padding . 2)
               (stretchability . 0)))
           (else
             '((basic-distance . 0)
               (minimum-distance . 0)
               (padding . 1.5)
               (stretchability . 0)))))
  left-margin = 18\mm
  bottom-margin = 0\mm
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
    \override ChordName.font-size = #(let ((paper-size (ly:output-def-lookup $defaultpaper 'paper-size)))
                                       (cond ((or (equal? paper-size "A3") (equal? paper-size "Tabloid"))
                                               4)
                                             (else
                                               1.5)))
    \chordSequence
  }

  \new FretBoards {
    \set Staff.stringTunings = #mandolin-tuning
    \override FretBoard.fret-diagram-details.finger-code = #'in-dot
    \override FretBoard.size = #(let ((paper-size (ly:output-def-lookup $defaultpaper 'paper-size)))
                                  (cond ((or (equal? paper-size "A3") (equal? paper-size "Tabloid"))
                                          1.7)
                                        ((equal? paper-size "Letter")
                                          1)
                                        (else
                                          1.1)))
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
