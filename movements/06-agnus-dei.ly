\version "2.26.0"

% ===========================================================================
% VI. AGNUS DEI
% Compile Pauken.ly for the full part, or this file to preview it alone.
% ===========================================================================

\include "../common.ly"   % header and shared layout

agnusDeiGlobal = {
  \key c \major
  \time 3/4
  \tempo "Adagio"
}

agnusDeiPauken = \relative c {
  \agnusDeiGlobal
  c4\f r r | c c r | c c r | r4 r8 g g g | % bar 5
  g4 r r | g g g | c r r | r r r8 g8 | c8 c c4 r | R2. | % bar 11
  R2. * 4 | % bar 15
  g4\f r r | c r r | g r r | g r r | R2. | g4 r r | % bar 21
  R2. * 5 | r4 g c | g g r | % bar 28
  R2. * 4 % bar 32
  c4 r r | g r r | c r r | c r r | r g g | c r r | % bar 38
  R2. * 5 | c4 c c | % 44
  c2 c4 | g4 r4 r4\fermata \bar "||" | % bar 46
  \time 4/4 \tempo "Allegro"
  c4 r4 r2 | r4 r8 c c c c g | c4 r4 r2 | % bar 49
  c4 r8 c8 c c c g | c4 c g8 g r4 | g4 g4 g2 | g4 g4 g2 | g4 g4 g2 | % bar 54
  g4 r g r | g r c g | c r4 r2 | c4 g c r | % bar 58
  r4 r8 g8 c4 g8 g | c4 r4 r2 | R1 | R1 | % bar 62
  R1 | g4 4 2 | 4 4 2 | g4 r g r | % bar 66
  c4 g c r | r2 r8 c c r | c4 g c r | c4 g8 g c4 g | c g c r \bar "|." |
}

agnusDeiCues = \relative c'' {
  \agnusDeiGlobal
  c2\f ^ "Sop." e4 | \appoggiatura e16 d8 c16 b c4 c8 (e) | \appoggiatura e16 d8 c16 b c4 r8 c8 | c4 b r | % bar 5
  f'4 d b | g2 (f4) | e4 r8 c'4 (cis8) | cis8 d r d e f | \appoggiatura f16 e8 d16 c! c4 r | R2. | % bar 11
  d2 ^ "Solo Sop." c16 (b a g) | f16 (g a b) c4 r | b2 c16 (b a g) | f16 (g a b) a4 r | % bar 15
  g2.\f ^ "Tutti (Sop.)" | c2. | b2. | e4 r8 a, (b) c | d8. e16 g,4 a4 | g4 r r | % bar 21
  R2. | g2\p g4 | g8 (a) a4 r8 a8 | a8 (b) b4 r8 b8 | b8 (c) c4 r | g4\f f' e | e d r | % bar 28
  g,2\p ^ "Solo Alto" f16 (e d c) | b (c d e) g4\p ^ "Solo Sop." g | e'2 f16 (e d c) | b (c d e) d4 r | % bar 32
  c2.\f ^ "Tutti (Sop.)" | f2. | e2. | a,4 r8 d8 (e) f | e8. e16 c4 (b) | c4 r r | % bar 38
  R2. | \clef "bass" g,2\p ^ "Bass" g4 | fis4 4 r8 8 | f!4 4 r8 8 | e4 e r | c4\f c' a | % 44
  fis2. | g4 r4 r4\fermata | % bar 46
  \clef "treble_8" r4 e'2 ^ "Tenor" (d4) | c4 8 8 8 8 8 (d) | c4 e2 (d4) | % bar 49
  c4 8 8 8 8 8 (d) | c8 4 8 8 b r4 | r2 b4 c | d8 b r4 c4 d | e8 c r4 b c | % bar 54
  d8 b r4 e8 c r4 | d8 b r4 r2 | R1 | g4 g e4. g8 | % bar 58
  c4. (d8) c4 b | c4 r g\p a | r4 c2 g4 | r2 a2 ~ |  % bar 62
  a2 g | r2 b4\f c | d8 b r4 c d | e8 c r4 d8 b r4 | % bar 66
  c4 b8. (d16) c4. 8 | c4. (d8) c4 r | c4 d c8 e r c16 c | c8 c b4 c b | c d e r |
}

agnusDeiCueWords = \lyricmode {
  A gnus De - - i, qui tol - - lis pec ca ta, % bar 5
  pec ca ta mun di, pec ca ta, pec ca ta mun - - di: % bar 11
  mi se re re, mi se re re, % bar 15
  mi se re re, mi se re re no - bis. % bar 21
  A gnus De i, qui tol lis pec ca ta, pec ca ta mun di: % bar 28
  mi se re mi se re re no bis, % bar 32
  mi se re re, mi se re re no bis. % bar 38
  A genus De i, qui tol lis pec ca ta, pec ca ta % 44
  mun di: % bar 46
  do na, do na no bis pa cem, do % bar 49
  na, do na no bis pa cem, do na pa cem, do na no bis, no bis pa cam, do na % bar 54
  pa cem, do na pa cem, do na no bis % bar 58
  pa cem pa cem, do na pa cem, pa % bar 62
  cem, do na no bis, no bis pa cem, pa cem, % bar 66
  do na no bis pa cem, do na no bi, do na no bi pa cem, pa cem, pa cem.
}

\score {
  <<
    \new Staff \with {
      instrumentName = "Cues"
      shortInstrumentName = "Cue"
      \magnifyStaff #5/7
    } \new Voice = "cues" { \agnusDeiCues }
    \new Lyrics \with {
      \override LyricText.font-size = #-1
    } \lyricsto "cues" { \agnusDeiCueWords }
    \new Staff \with {
      instrumentName = "Pauken"
      shortInstrumentName = "Pk."
      midiInstrument = "timpani"
    } { \clef bass \agnusDeiPauken }
  >>
  \header { piece = "VI. Agnus Dei" }
  \layout {}
  \midi {}
}
