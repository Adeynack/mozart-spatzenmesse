\version "2.26.0"

% ===========================================================================
% III. CREDO
% Compile Pauken.ly for the full part, or this file to preview it alone.
% ===========================================================================

\include "../common.ly"   % header and shared layout

credoGlobal = {
  \key c \major
  \time 4/4
  \tempo "Allegro molto" 4 = 152
}

credoCues = \fixed c' {
  \credoGlobal
  <c e g>1 |
  <c f a>1 |
  <b, d g>1 |
  <b, d f g>1 |
  <c e g>1 |
  \bar "|."
}

credoPauken = \fixed c {
  \credoGlobal
  c4\f r g, r         |
  R1                  |
  g,2 g,2             |
  g,4 g, g, g,        |
  c1:32\fermata       |
  \bar "|."
}

\score {
  <<
    \new Staff \with {
      instrumentName = "Cues"
      shortInstrumentName = "Cue"
      \magnifyStaff #5/7
    } { \credoCues }

    \new Staff \with {
      instrumentName = "Pauken"
      shortInstrumentName = "Pk."
      midiInstrument = "timpani"
    } { \clef bass \credoPauken }
  >>
  \header { piece = "III. Credo" }
  \layout {}
  \midi {}
}
