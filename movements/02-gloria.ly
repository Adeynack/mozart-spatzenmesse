\version "2.26.0"

% ===========================================================================
% II. GLORIA
% Compile Pauken.ly for the full part, or this file to preview it alone.
% ===========================================================================

\include "../common.ly"   % header, layout, \pkSystem

gloriaGlobal = {
  \key c \major
  \time 4/4
  \tempo "Allegro" 4 = 132
}

gloriaCues = \fixed c' {
  \gloriaGlobal
  <c e g>1 |
  <c f a>1 |
  <b, d g>1 |
  <b, d f g>1 |
  <c e g>1 |
  \bar "|."
}

gloriaPauken = \fixed c {
  \gloriaGlobal
  c4\f r g, r         |
  R1                  |
  g,2 g,2             |
  g,4 g, g, g,        |
  c1:32\fermata       |
  \bar "|."
}

\score {
  \pkSystem \gloriaCues \gloriaPauken
  \header { piece = "II. Gloria" }
  \layout {}
  \midi {}
}
