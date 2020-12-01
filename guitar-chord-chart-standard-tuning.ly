\version "2.21.80"

\include "predefined-guitar-fretboards.ly"

\header {
  title = "Guitar Chord Chart"
  subtitle = "E–A–D–G–B–e Tuning"
  pdftitle = \markup \concat { \fromproperty #'header:title " (" \fromproperty #'header:subtitle ")" }
  subject = "Chart for the most common chords for the guitar (E–A–D–G–B–e tuning)."
  source = "https://lilypond.org/doc/stable/Documentation/notation/predefined-fretboard-diagrams"
  enteredby = "Alexis Jeandeau"
  author = \enteredby
  keywords = #(string-join '(
    "music"
    "guitar"
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
     (cond ((equal? paper-size "A4")
             '((basic-distance . 0)
               (minimum-distance . 0)
               (padding . 2)
               (stretchability . 0)))
           ((equal? paper-size "Letter")
             '((basic-distance . 0)
               (minimum-distance . 0)
               (padding . 1)
               (stretchability . 0)))
           ((or (equal? paper-size "A3") (equal? paper-size "Tabloid"))
             '((basic-distance . 0)
               (minimum-distance . 0)
               (padding . 6)
               (stretchability . 0)))
           (else
             '((basic-distance . 0)
               (minimum-distance . 0)
               (padding . 4)
               (stretchability . 0)))))
  #(define system-system-spacing
     (cond ((equal? paper-size "Tabloid")
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

\layout {
  indent = 0\mm
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
}

chordNames = {
  \override ChordName.font-size = #(let ((paper-size (ly:output-def-lookup $defaultpaper 'paper-size)))
                                    (cond ((or (equal? paper-size "A3") (equal? paper-size "Tabloid"))
                                            4)
                                          (else
                                            1.5)))
  \chordSequence
}

fretBoards = {
  \set Staff.stringTunings = #guitar-tuning
  \override FretBoard.fret-diagram-details.finger-code = #'in-dot
  \override FretBoard.size = #(let ((paper-size (ly:output-def-lookup $defaultpaper 'paper-size)))
                                (cond ((or (equal? paper-size "A3") (equal? paper-size "Tabloid"))
                                        2)
                                      ((equal? paper-size "Letter")
                                        1.2)
                                      (else
                                        1.3)))
  \chordSequence
}

\book {
  <<
    \new ChordNames \chordNames
    \new FretBoards \fretBoards
  >>
}

\book {
  \bookOutputSuffix "fr"

  \header {
    title = "Accords de guitare"
    subtitle = "Accordage Mi–La–Ré–Sol–Si–Mi"
    subject = "Doigtés d’accords communs pour guitare (accordage Mi–La–Ré–Sol–Si–Mi)."
  }

  <<
    \new ChordNames \with { \frenchChords } \chordNames
    \new FretBoards \fretBoards
  >>
}
