\version "2.26.0"

% ===========================================================================
% II. GLORIA
% Compile Pauken.ly for the full part, or this file to preview it alone.
% ===========================================================================

\include "../common.ly"   % header and shared layout

gloriaGlobal = {
  \key c \major
  \time 3/4
  \tempo "Allegro" 4 = 132
}

gloriaCues = \relative c'' {
  \gloriaGlobal
  % Bar 1 - Soprano Tutti
  c2 ^ "Sop." c4 | f2 b,4 | c r r | d (e) f | e8. d16 c4 r |
  % Bar 6
  a2 a4 | g4. (c8) e (g) | g2 (f4) | e r r
  % Bar 10
  e4 ^ "Solo Sop." c e | d r
  d,8 ^ "Solo Alto" d | g4. (b8) a g | \appoggiatura g8 fis2
  \clef "bass" a,8 ^ "Solo Bass" a | a4 (b) c | \appoggiatura c8 b4
  \clef "treble_8" r8 ^ "Solo Tenor" b c d | e8. (d16 c4) b | a r r |
  % Bar 18
  \clef "treble" c'4. ^ "Tutti - Sop." 8 4 | fis4. 8 4 | g4 d r | e2 d4 | c c b | 8 8 a2 | g4 r r
  % Bar 25
  R2. | r4 d ^ "Solo Sop." g8 8 | e4 d r | c4. (e8) d (c) |
  \clef "treble_8" d2 ^ "Solo Tenor" 4 | gis,4. (f'8) e d | c8. 16
  \clef "treble" e4 ^ "Solo Alto" 8 8 | dis4 e r | r e e | des8. 16
  \clef "bass" e,4 ^ "Solo Bass" e | dis4
  \clef "treble" c''4 ^ "Solo Sop." b8 a | g4 b e8 ais, | b4 dis e | \appoggiatura d16 c8 b16 a g4 (fis) | e4
  % Bar 39, Beat 2
  r4 ^ "Tutti - Sop." b'\f | c2. | b4 r b | dis2. | e4 r r | e fis g | ais, b r | r b b | ais b r |
  r4 a a | gis a r | r g g | g2 f4 ~ | f e2 | d4 r
  % Bar 53, Beat 3
  a'4 | bes2. | a4 r a | bes2. | 4 r r | aes4 4 4 | 4 g r
  % Bar 60
  r4 c4. 8 | c4 r r | r d4. 8 | 4 r r | r c4. 8 | cis4. 8 d4 ~ | d8 g, g4 (fis) | g4 r
  % Bar 67, Beat 3
  % TODO…
}

% LYRICS of the cues (see the Kyrie for how they work).
gloriaCueWords = \lyricmode {
  % Bar 1
  Et in ter -- ra pax, pax __ ho -- mi -- ni -- bus
  % Bar 6
  bo -- nae vo -- lun -- ta -- tis.
  % Bar 10
  Lau -- da -- mus te.
  Be -- ne -- di -- ci -- mus te.
  Ad -- o -- ra -- mus te.
  Glo -- ri -- fi -- ca -- mus te.
  % Bar 18
  Gra -- ti -- as a -- gi -- mus ti -- bi pro -- pter ma -- gnam glo -- ri -- am tu -- am.
  % Bar 25
  Do -- mi -- ne De -- us, Rex __ cae…
  De -- us Pa -- ter o -- mni -- pot…
  Do -- mi -- ne Fi -- li u -- ni -- ge -- ni…
  Je -- su Chri…
  Do -- mi -- ne De -- us, A -- gnus De -- i, Fi -- li -- us __ _ Pa -- tris.
  % Bar 39, Beat 2
  Qui tol -- lis pec -- ca -- ta, pec -- ca -- ta mun -- di mi -- se -- re -- re,
  mi -- se -- re -- re, mi -- se -- re -- re no -- bis.
  % Bar 53, Beat 3
  Qui tol -- lis pec -- ca -- ta, pec -- ca -- ta mun -- di
  % Bar 60
  sus -- ci -- pe, sus -- ci -- pe de -- pre -- ca -- ti -- o -- nem no -- stram.
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
  <<
    \new Staff \with {
      instrumentName = "Cues"
      shortInstrumentName = "Cue"
      \magnifyStaff #5/7
    } \new Voice = "cues" { \gloriaCues }
    \new Lyrics \with {
      \override LyricText.font-size = #-1
    } \lyricsto "cues" { \gloriaCueWords }

    \new Staff \with {
      instrumentName = "Pauken"
      shortInstrumentName = "Pk."
      midiInstrument = "timpani"
    } { \clef bass \gloriaPauken }
  >>
  \header { piece = "II. Gloria" }
  \layout {}
  \midi {}
}
