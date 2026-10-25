\version "2.26.0"

% ===========================================================================
% IV. SANCTUS
% Compile Pauken.ly for the full part, or this file to preview it alone.
% ===========================================================================

\include "../common.ly"   % header and shared layout

sanctusGlobal = {
  \key c \major
}

sanctusPauken = \relative c {
  \sanctusGlobal
  \time 3/4 \tempo "Andante"
  c4\f r r | g r r | c r r | g r r | g r r |
  g g c | g g r\fermata \bar "||"
  % Bar 8 - Allegro
  \time 4/4 \tempo "Allegro"
  r2 c4 g | c r r8 c g g |
  c4 r c g | c r r8 g g g | g4 r r2 | g4 r r2 | % Bar 14
  c4 c c r | g8 c g4 c r | R1 | % Bar 17
  c4\f c c r | g8 c g4 c r | g4 g g r8 g | c4 g8 g c4 r \bar "|."
}

sanctusCues = \relative c'' {
  \sanctusGlobal
  r4 e\f ^ "Sop." d | r f e | r a, g | b4. 8 4 | c4. 8 4 |
  f2 e4 | 8. 16 d4 r\fermata \bar "||"
  % Bar 8 - Allegro
  r2 e4 f8 d | c4 \appoggiatura e16 d8 c16 b c8 g r4 |
  r2 r8 e' f d | c8. 16 d4 c8 b r4 | r4 r8 g f'4 e8 r8 | r4 g,8 g f'4 e8 c | % Bar 14
  c8. a16 a8 c8 c4 g | f'8 e d4 c4 r | r8 c8\p c a r c c g | % Bar 17
  r8 c\f c a r c c g | f'8 e d4 c r4 | r4 r8 g b (d) f4 | e8 e d4 c r |
}

sanctusCueWords = \lyricmode {
  San ctus, San ctus, San ctus Do mi nus, Do mi nus De us Sa ba oth.
  % Bar 8 - Allegro
  Ple ni sund cae li et _ ter ra, ple ni sund glo ri a tu a.
  Ho san na in ex cel si, Ho san na in ex cel sis, in ex cel sis.
  Ho sa na, ho sa na, ho sa na, ho sa na in ex cel sis. Ho sa na in ex cel sis.
}


\score {
  <<
    \new Staff \with {
      instrumentName = "Cues"
      shortInstrumentName = "Cue"
      \magnifyStaff #5/7
    } \new Voice = "cues" { \sanctusCues }
    \new Lyrics \with {
      \override LyricText.font-size = #-1
    } \lyricsto "cues" { \sanctusCueWords }
    \new Staff \with {
      instrumentName = "Pauken"
      shortInstrumentName = "Pk."
      midiInstrument = "timpani"
    } { \clef bass \sanctusPauken }
  >>
  \header { piece = "IV. Sanctus" }
  \layout {}
  \midi {}
}
