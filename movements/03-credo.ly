\version "2.26.0"

% ===========================================================================
% III. CREDO
% Compile Pauken.ly for the full part, or this file to preview it alone.
% ===========================================================================

\include "../common.ly"   % header and shared layout

credoGlobal = {
  \key c \major
  \time 4/4
  \tempo "Allegro"
}

credoCues = \relative c'' {
  \credoGlobal
  R1 | R1 | c4\f ^ "Sop." c8 c a4 a | g4 c8 c f f f4 | e8 c c4 b r |
  r8 e4 8 d d16 d d8. d16 | c8 4 8 b b a8. 16 | g4
  % Bar 8, Beat 2 - Solo Soprano
  d'8 ^ "Solo Sop." e fis,4 g | c8. 16 b4 e8 d16 (e) d8 (c) | b4
  % Bar 10, Beat 2 - Solo Tenor
  \clef "treble_8" b,8 ^ "Solo Tenor" b b (e4) d8 | c8 a f'4. e16 d c8 b16 a | b4. b8 a4 r |
  % Bar 13
  \clef "treble" a'4 ^ "Tutti (Sop.)" 8 8 4 8 8 | d8 8 8. 16 c4 8 8 | bes4 8 8 a a g4 | f4
  % Bar 16, Beat 2 - Solo Soprano
  c'4. ^ "Solo Sop." bes16 a g8 bes | a f r4 r2 | r8 c'4 b8 bes8. 16 a4 | g4. 8 f4
  % Bar 19, Beat 4
  r8 f'8 | f4 c8 8 8. 16 8 8 | f8 8 4 e8 c c4 | b4 r8 g' f4 e8 e | d4 c8 8 8 d4 e8 ~ | e8 f r f e4 (d) | c4
  % Bar 25, Beat 2
  r4 r8 bes8 8 8 | 8. 16 4 r2 | r8 bes8 8 16 16 8 a8 8 8 | a8 8 8. 16 8 8 bes8 8 |
  bes4 (a8.) 16 bes4 d8\f d | des4 c4 8. 16 b?8 b | bes4 a? r8 a8 8. 16 |
  bes8 8 ges8 8 c4 (b?) | a4 2 g?4 | fis4. 8 e4 r4 |
  % Bar 35 - Allegro
  r8 c'8\f 8 8 a4 4 | g8 16 16 c4 f8 8 4 | e8 c8 4 b d8 g, |
  e'4 c8 e d g, d'4 | c4 r8 c b8 16 16 a4 | g4 r
  % Bar 40, Beat 3
  r8 c8 b8. 16 | e8 8 8 8 dis4 r8 b | b8 16 16 8 e8 8 dis r4 | c2 b4 r |
  r4 a\p gis (g? ~ | g4 fis8.) 16 e4 e'8 8 | f?4 8 8 e8 8 d4 |
  c4 r a r | f'4 r8 f e e d4 | c4 r
  % Bar 49, Beat 3 - Solo Soprano
  f,8 ^ "Solo Sop." a c4 ~ | c8 bes16 a g8 bes a8. g16 f4 | r8 c'4 e,8 f g a (b?) | c4 e8 d ces4 8 8 |
  d8 a16 a f8 a d,4 d' ~ | d8 cis16 d e8 d c4 8 8 | d8 cis
  % Bar 55, Beat 2 - Solo Bass
  \clef "bass" d,8 ^ "Solo Bass" gis, a4 bes8 (cis,) | d8 (e) f g? a2 | d4
  % Bar 57, Beat 2 - Tutti (Sop)
  \clef "treble" r8 a'8\f ^ "Tutti (Sop.)" a4 d | d4 gis, r8 b b e | e8. a,16 4 r8 a8 8 8 |
  des8. 16 8 8 e8. b16 4 | r8 d?8 8. 16 c4 r8 c | 8 8 4 bes r | 
  r8 bes4 8 a b c d | e8 c8 c4 b r | r8 e4 8 d4 4 |
  c8. 16 8 8 b16 a g8 r4 |
  % Bar 67 (subito p)
  b2\p c | fis, g4 r | 
  % Bar 69 (subito f)
  r8 c8 4 a8 8 8 8 |
  g8. 16 c4 f f | e8 c c4 b r8 g'8 | f?4 r8 e8 d4 r8 c ~ |
  c8 d4 e f8 r f | e4 d f8 4 8 | e8 e d4 c d | e b c r |
}

credoCueWords = \lyricmode {
  Pa trem o mni pot en tem, fa cto rem cae li et ter rae,
  vi si bi li um o mni um, et in vi si bi li um.
  % Bar 8, Beat 2 - Solo Soprano
  Et in u num Do mi num Je sum Chri stum.
  % Bar 10, Beat 2 - Solo Tenor
  Et ex Pa tre | na tum an te - o mni a | sae cu la. |
  % Bar 13
  De um de De o lu men de lu mi ne, De um ve rum de De o ve ro.
  % Bar 16, Beat 2 - Solo Soprano
  Ge - ni tum, non fa ctum, per quem o mni a fa cta sunt.
  % Bar 19, Beat 4
  Qui | pro pter nos ho mi nes, et | pro pter no stram sa lu | tem de scen dit, de | scen dit, de scen - - dit de cae | lis.
  % Bar 25, Beat 2
  Et in car na tus es de Spi ri tu San cto ex Ma ri a vir gi ne: Et ho mo
  fa ctus est. Cru ci fi xtus et i am pro no bis: sub Pon ti o Pi la to pas sus, et se pul tus est.
  % Bar 35 - Allegro
  Et re sur re xit ter ti a di e, se cun dum Scri ptu ras. Et a scen dit in cae lum: se det ad dex te ram Pa tris.
  % Bar 40, Beat 3
  Et i te
  rum ven tu rus est cum | glo ri a, ju di ca re | vi vos |
  et mor | tu os: cu jus | re gni non e rit fi |
  nis, non, | non, non e rit fi | nis.
  % Bar 49, Beat 3
  Et in Spi ri tum San ctum, Do mo num, et vi vi fi can tem. Qui cum Pa tre et Fi li o si mul ad - o - ra tur, et con glo ri fi…
  % Bar 55, Beat 2 - Solo Bass
  Qui lo cu tus est per Pro phe tas.
  % Bar 57, Beat 2 - Tutti (Sop)
  Et u nam san ctam, san ctam ca tho li cam et a po
  sto li cam Ec cle si am. Con fi te or u num ba pti sma
  in re mis si o nem pec ca to rum. Et ex spe cto |
  re sur re cti o - nem |
  % Bar 67 (subito p)
  mor tu o rum.
  % Bar 69 (subito f)
  Et vi tam ven tu ri
  sae cu li. A men, a men, a men, a men, a men, a |
  - - men, a | men, a men, a men, | a men, a men, a | men, a men.
}

credoPauken = \relative c {
  \credoGlobal
  c4\f r c r | c r r2 | c4 r c r | c r r g8 g | c4 c g r | c r g r | r2 g4 r | g\p r r2 |
  R1 * 4 |
  % Bar 14
  R1 | r2 r4 c8 c | c4 r4 c4 c8 8 | 4\p r r2 |
  R1 * 3 |
  % Bar 20
  c4 r c r | r g8 g c4 c | g r r2 |
  R1 | r8 c g g c4 g8 g \bar "||"
  % Bar 25
  \tempo "Andante"
  c4 r4 r2 | R1 * 9 \bar "||"
  % Bar 35 - Allegro
  \tempo "Allegro"
  c4\f r c r | c r r g8 g | c4 c g r |
  c4 r g r | r2 g4 r | R1
  % Bar 41
  R1 * 5 | g4 r8 g8 c4 g8 8 |
  c4 r c r | r4 r8 g8 c4 g8 8 | c4 r4
  % Bar 49, Beat 3
  r2 | R1 * 7 |
  % Bar 57
  R1 * 5 |
  r2 r4 g8 8 |
  c4 r4 r2 | c4 c g r | c r g r |
  r2 g4 r |
  % Bar 67
  R1 | r2 r8 g g g | c4 r c r |
  c4 r r g8 8 | c4 c g r | R1
  r2 r8 c g g | c4 g r8 c g g | c4 g8 8 c4 g | c\rit g c r \bar "|."
}

\score {
  <<
    \new Staff \with {
      instrumentName = "Cues"
      shortInstrumentName = "Cue"
      \magnifyStaff #5/7
    } \new Voice = "cues" { \credoCues }
    \new Lyrics \with {
      \override LyricText.font-size = #-1
    } \lyricsto "cues" { \credoCueWords }
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
