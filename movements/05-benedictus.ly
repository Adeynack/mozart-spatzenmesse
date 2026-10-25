\version "2.26.0"

% ===========================================================================
% V. BENEDICTUS
% Compile Pauken.ly for the full part, or this file to preview it alone.
% ===========================================================================

\include "../common.ly"   % header and shared layout

benedictusGlobal = {
  \key g \major
}

benedictusPauken = \relative c {
  \benedictusGlobal
  \time 4/4 \tempo "Andante"
  R1 * 31 \bar "||" | \break % bar 32
  \tempo "Allegro"
  g4\f g g r | g g g r | g g g r | % bar 35
  g4 r r2 | g4 r r2 | c4 c c r | % bar 38
  g8 c g4 c r | R1 | c4 c c r | % bar 41
  g8 c g4 c r | g4 g g r8 g | c4 g8 8 c4 r \bar "|." |
}

benedictusCues = \relative c'' {
  \benedictusGlobal
  d4. ^ "Violino I" \tuplet 3/2 {e16 (c a)} g4 (fis8) e | \tuplet 3/2 {d16 g fis} \tuplet 3/2 {g a b} c8 c c b r4 | % bar 3
  d4. ^ "Solo Sop." \tuplet 3/2 {e16 (c a)} g4 fis8 e | d4 c'8 c c b r4 | r4 \tuplet 3/2 {a16 (c b)} \tuplet 3/2 {a16 (g fis)} g8 g r4 | % bar 6
  r4 \tuplet 3/2 {a16 (c b)} \tuplet 3/2 {a (g fis)} g8 g r8 d' | g16 (e) c4 b8 e16 (c) a4 g8 | fis8 c'4 b8 16. 32 a8 r4 | % bar 9
  r4 a8 8 4 8 r8 | r4 a8 8 4 8 r8 | % bar 11
  r8 d8 d16 (c!) b ais16 8. b16 8 e | dis8 e r8 g g cis, r d! | d4 \appoggiatura cis16 b8 \appoggiatura a16 g8 fis4 (e8.) 16 |  % bar 14
  d4 r4 r2 | r2 r8 a'4 a8 | c! (fis,) g r r b4 8 | % bar 17 
  d8 (gis) a r r e e d | r c c b16 b bes4. 8 | a4 r d4. \tuplet 3/2 {e16 (c a)} | % bar 20
  g!4 f8 e d4 c'8 8 | c b r4 r \tuplet 3/2 {a16 (c b)} \tuplet 3/2 {a16 (g fis)} | g8 g r4 r4 \tuplet 3/2 {a16 (c b)} \tuplet 3/2 {a16 (g fis)} | % bar 23
  g8 g r d' g16 (e) c4 b8 | e16 (c) a4 g8 fis c'4 b8 | b16. 32 a8 r4 r4 d8 d | % bar 26
  d4 8 r r4 d8 8 | d4 8 r r d8 c16 (b) a g | dis'8. e16 8 g8 g c, r e | % bar 29
  e8 a, r a d!4 \appoggiatura d16 c8 b16 (a) | g4 (a8.) 16 g4 r8 g | g'4 fis16 (e) d (c) b4 (a8.) 16 | % bar 32
  g4 r r r8 g\f ^ "Tutti" | c8. 16 8 8 8 b8 r b | e8. 16 8 8 8 d r4 | % bar 35
  r4 r8 g,8 fis'4 e8 r | r4 g,8 g fis'4 e8 c | c8. a16 8 c8 4 g | % bar 38
  fis'8 e d4 c r | r8 c8\p c a r c c g | r8 c\f c a r c c g | % bar 41
  fis'8 e d4 c r | r4 r8 g8 b (d) fis4 | e8 8 d4 c r |
}

benedictusCueWords = \lyricmode {
  \repeat unfold 14 \skip 1 % bars 1–2: Violino I, no text
  % bar 3
  Be ne di ctus qui ve nit, qui ve nit, be ne di ctus, % bar6
  be ne di ctus qui ve nit, qui ve nit in no mi ne Do mi ni. % bar 9
  Be ne di ctus, be ne di ctus % bar 11
  qui ve nit in no mi ne, qui ve nit, qui ve nit in no mi ne Do mi % bar 14
  ni. Be ne di ctus, be ne % bar 17
  di ctus qui ve nit in no mi ne Do mi ni. Be ne % bar 20
  di ctus qui ve nit, qui ve nit, be ne di ctus, be ne % bar 23
  di ctus qui ve nit, qui ve nit in no mi ne Do mi ni. Be ne % bar 26
  di ctus, be ne di ctus qui ve nit in no mi ne, qui ve nir, qui  % bar 29
  ve nit in no mi ne Do mi ni, in no mi ne Do mi % bar 32
  ni. Ho san na in ex cel sis. Ho san na in ex cel sis. % bar 35
  Ho san na in ex cel sis. Ho san na in ex cel sis, % bar 38
  in ex cel sis. Ho san na, ho san na, ho san na, ho san na % bar 41
  in ex cel sis. Ho san na in ex cel sis.
}

\score {
  <<
    \new Staff \with {
      instrumentName = "Cues"
      shortInstrumentName = "Cue"
      \magnifyStaff #5/7
    } \new Voice = "cues" { \benedictusCues }
    \new Lyrics \with {
      \override LyricText.font-size = #-1
    } \lyricsto "cues" { \benedictusCueWords }
    \new Staff \with {
      instrumentName = "Pauken"
      shortInstrumentName = "Pk."
      midiInstrument = "timpani"
    } { \clef bass \benedictusPauken }
  >>
  \header { piece = "V. Benedictus" }
  \layout {}
  \midi {}
}
