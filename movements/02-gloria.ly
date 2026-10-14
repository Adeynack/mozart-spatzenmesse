\version "2.26.0"

% ===========================================================================
% II. GLORIA
% Compile Pauken.ly for the full part, or this file to preview it alone.
% ===========================================================================

\include "../common.ly"   % header, layout, \pkSystem

gloriaGlobal = {
  \key c \major
  \time 3/4
  \tempo "Allegro" 4 = 132
}

gloriaCues = \relative c' {
  \gloriaGlobal
  % Bar 1
  
}

gloriaPauken = \relative c {
  \gloriaGlobal
  % Bar 1
  c4\f r r | g r r | c r r | r g g | c r r |
  % Bar 6
  c4 r r | c r r | g g g | c c c8 c | c4\p r r | 
  % Bar 11
  R2. * 9 |
  % Bar 20
  g4 r r | c r g | R2. * 2 |
  % Bar 24
  g4 r r | R2. * 57 |
  % Bar 82
  g4 r r | g g g | c\p r r | R2. * 8 |
  % Bar 93
  r4 r g\f | c r r | g r r | \repeat unfold 3 { c r r | } g g g |
  % Bar 100
  c r g | c r r | c r r | r g g | c\p r r | R2. * 3
  % Bar 107
  c4 r r | g r r | g r r | g r g | c g g8 g | c4^\markup { \italic "rit." } r r \bar "|."
}

\score {
  \pkSystem \gloriaCues \gloriaPauken
  \header { piece = "II. Gloria" }
  \layout {}
  \midi {}
}
