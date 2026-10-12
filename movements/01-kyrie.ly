\version "2.26.0"

% ===========================================================================
% I. KYRIE
% Compile Pauken.ly for the full part, or this file to preview it alone.
% ===========================================================================

\include "../common.ly"   % header, layout, \pkSystem

% GLOBAL: things shared by both staves of this movement (key, metre, tempo).
% A "variable" is defined as  name = { ... }  and used later as  \name
kyrieGlobal = {
  \key c \major
  \time 4/4
  \tempo "Andante" 4 = 72
}

% CUES: choir / orchestra reduction, so you can follow the structure.
%
% Quick syntax reminder:
%   c d e f g a b   note names (English/Dutch style; b = B natural)
%   cis / es        C sharp / E flat   (is = sharp, es = flat)
%   4  2  1  8      duration: quarter, half, whole, eighth (stays until changed)
%   4.              dotted quarter
%   '  ,            octave up / octave down, relative to the \fixed reference
%   <c e g>1        a chord (all notes in < >, duration after the >)
%   r4  R1          rest / full-bar rest
%   ^"text"         text above the note,  _"text" below
%   |               bar check (optional, but warns you if a bar is wrong)
%
% \fixed c' { ... } means: a plain "c" is middle C (c'), "c'" is an octave up,
% "b," is the B just below middle C.
kyrieCues = <<
  \relative c' {
    \kyrieGlobal
    R1*5 |
    \sung { e'4 ^ "Soprano" g8. b,16 c4 r8 c } \lyricmode { Ky ri - e e } | % bar 6 - soprano
    \sung { d8 e f4 e r8 c } \lyricmode { lei - - son e } | % bar 7 - soprano
    \sung { d8 e f4 e r8 g8 } \lyricmode { lei - - son, e } % bar 8 - soprano
    \sung { g8 f r f f4 g8 f } \lyricmode { lei son e lei son e } | % bar 9 - soprano
    \sung { e16 d c b c d e fis g4. d8 } \lyricmode { lei - - - - - - - - - } | % bar 10 - soprano
    \sung { c16 b a gis a b c d e4 ( d8 ) c } \lyricmode { - - - - - - - - - - son. } | % bar 11 - soprano
    \sung { b8. a32 b c8 b b a r4 } \lyricmode { Ky ri - e e lei son. } | % bar 12 - soprano
    \sung { r4 d2 c4 } \lyricmode { Chri - } | % bar 13 - soprano
    \sung { b4 r8 d, e g4 a8 } \lyricmode { ste e lei - - } | % bar 14 - soprano
    \sung { b4 r r2 } \lyricmode { son. } | % bar 15 - soprano
    \sung { r4 e2 ( d4 ) } \lyricmode { Chri - } | % bar 16 - soprano
    \sung { c4 r8 a b c d4 } \lyricmode { ste e lei - - } | % bar 17 - soprano
    \sung { c8 cis4 d8 r8 b4 c8 } \lyricmode { son. Chri ste, Chri ste } | % bar 18 - soprano
    \sung { r8 f8 e4 d r } \lyricmode { e lei son. } | % bar 19 - soprano
    % bar 20    
    \sung {
        e4 b8. d16 c4 r8 e |
        d8 e f4 e r8 c |
        d e f4 e r8 g |
        g f r f f4 g,8 f' |
        e16 d c b c d e f g2 ~ |
        g16 f e d c b c d e2 ~ |
        e16 d c b a g a b c4 ~ c16 b c d |
        e8. d32 e f8 e e d r4 |
    } \lyricmode {
      Ky ri - e e lei - - son e lei - - son, e lei son e lei son e lei - - - - - - - - - - - - - - - - - - - - - - - - - son -.
      Ky ri - e e lei son
    }
    % bar 28
    \sung {
      r4 \clef "treble_8" e,2 ^ "Tenor" ( d4 ) |
      c r8 c c4. ( d8 ) |
      c4 e2 ( d4 ) |
      c4 r8 c c4. ( d8) |
      c8 e4 d8 r d4 c8 |
      r8 c c4 b r8 d16 d |
      d8 c c ( b ) c4 r |
    } \lyricmode {
      Chri - ste e lei - son Chri - ste e lei - son. Chri ste  Chri ste e lei son.
      Ky ri e e lei - son.
    }
    % bar 35
    \sung {
      \clef "treble"
      e'4 ^ "Soprano" g8. b,16 c4 r8 c |
      d8 ( e f4 ) e r |
      fis4 f e8 c16 d  e (f) g (f) |
      e4 (d) c r
    } \lyricmode {
      Ky ri - e e lei - - son.
      Ky ri e, Ky ri e _ e - lei - son.
    }
    
    \bar "|."
  }
>>

% PAUKEN: your part, written at sounding pitch in bass clef.
% \fixed c { ... } means a plain "c" is the C below middle C (C3),
% so "g," is the low G (G2) – i.e. the classic C–G Mozart tuning.
%
%   \f \p \mf ...    dynamics, written right after the note
%   \< \> \!         crescendo / decrescendo / end of hairpin
%   c1:32            tremolo (roll) — the :32 draws the strokes through the stem
%   \fermata         fermata, written after the note
kyriePauken = \relative c {
  \kyrieGlobal
  c4\f g4 c r | % bar 1
  r2 c4 r4 | % bar 2
  r2 c4 r4 | % bar 3
  R1 | % bar 4
  r2 r8 g8 g g | % bar 5
  c4 g c r | % bar 6
  r2 c4 r | % bar 7
  r2 c4 r | % bar 8 
  R1 * 4 | % bar 9-12
  g4 r r2 | % bar 13
  R1 * 5 | % bar 14...
  g8 g c4 g g8 g | % bar 19  
  c4 g c r | % bar 20
  r2 c4 r4 | % bar 21
  r2 c4 r4 | % bar 22
  R1 | % bar 23
  c4 r r2 | % bar 24
  c4 r r2 | % bar 25
  c4 r r2 | % bar 26
  c4 r g g8 g | % bar 27
  c4 r r2 |
  r4 r8 c c c c g |
  c4 r r2 | % bar 30
  r4 r8 c c c c g |
  c4 r r2 |
  R1 | % bar 33
  g8 c g4 c8 c16 c c8 c |
  c4 g c r |
  r2 r8 c16 c c8 c | % bar 36
  c4 g c r8 c16 c |
  g4 g c r
}

\score {
  \pkSystem \kyrieCues \kyriePauken
  \header { piece = "I. Kyrie" }
  \layout {}
  \midi {}
}
