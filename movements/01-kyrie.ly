\version "2.26.0"

% ===========================================================================
% I. KYRIE
% Compile Pauken.ly for the full part, or this file to preview it alone.
% ===========================================================================

\include "../common.ly"   % header and shared layout

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
kyrieCues = \relative c' {
  \kyrieGlobal
  R1*5 |
  e'4 ^ "Soprano" g8. b,16 c4 r8 c | % bar 6 - soprano
  d8 e f4 e r8 c | % bar 7
  d8 e f4 e r8 g8 | % bar 8
  g8 f r f f4 g8 f | % bar 9
  e16 d c b c d e fis g4. d8 | % bar 10
  c16 b a gis a b c d e4 ( d8 ) c | % bar 11
  b8. a32 b c8 b b a r4 | % bar 12
  r4 d2 c4 | % bar 13
  b4 r8 d, e g4 a8 | % bar 14
  b4 r r2 | % bar 15
  r4 e2 ( d4 ) | % bar 16
  c4 r8 a b c d4 | % bar 17
  c8 cis4 d8 r8 b4 c8 | % bar 18
  r8 f8 e4 d r | % bar 19
  e4 b8. d16 c4 r8 e | % bar 20
  d8 e f4 e r8 c |
  d e f4 e r8 g |
  g f r f f4 g,8 f' |
  e16 d c b c d e f g2 ~ |
  g16 f e d c b c d e2 ~ |
  e16 d c b a g a b c4 ~ c16 b c d |
  e8. d32 e f8 e e d r4 |
  r4 \clef "treble_8" e,2 ^ "Tenor" ( d4 ) | % bar 28
  c r8 c c4. ( d8 ) |
  c4 e2 ( d4 ) |
  c4 r8 c c4. ( d8) |
  c8 e4 d8 r d4 c8 |
  r8 c c4 b r8 d16 d |
  d8 c c ( b ) c4 r |
  \clef "treble"
  e'4 ^ "Soprano" g8. b,16 c4 r8 c | % bar 35
  d8 ( e f4 ) e r |
  fis4 f e8 c16 d  e (f) g (f) |
  e4 (d) c r
  \bar "|."
}

% LYRICS of the cues. \lyricsto (in the \score below) puts each syllable on
% the next note of the cue voice; rests and grace notes are skipped, and
% notes under a slur or tie belong to the syllable before them.
%   --   hyphen between the syllables of one word
%   __   extender line after the last syllable of a word (melisma)
%   _    a note that gets no new syllable
kyrieCueWords = \lyricmode {
  Ky -- ri -- _ e e --                  % bar 6
  lei -- _ _ son e --                   % bar 7
  lei -- _ _ son, e --                  % bar 8
  lei -- son e -- lei -- son e --       % bar 9
  lei -- _ _ _ _ _ _ _ _ _              % bar 10
  _ _ _ _ _ _ _ _ _ son.                % bar 11
  Ky -- ri -- _ e e -- lei -- son.      % bar 12
  Chri -- _                             % bar 13
  ste e -- lei -- _ _                   % bar 14
  son.                                  % bar 15
  Chri --                               % bar 16
  ste e -- lei -- _ _                   % bar 17
  son. Chri -- ste, Chri -- ste         % bar 18
  e -- lei -- son.                      % bar 19
  Ky -- ri -- _ e e --                  % bar 20
  lei -- _ _ son e --                   % bar 21
  lei -- _ _ son, e --                  % bar 22
  lei -- son e -- lei -- son e --       % bar 23
  lei -- _ _ _ _ _ _ _ _                % bar 24
  _ _ _ _ _ _ _ _                       % bar 25
  _ _ _ _ _ _ _ _ _ son. __ _           % bar 26
  Ky -- ri -- _ e e -- lei -- son.      % bar 27
  Chri --                               % bar 28 - tenor
  ste e -- lei --                       % bar 29
  son Chri --                           % bar 30
  ste e -- lei --                       % bar 31
  son. Chri -- ste Chri -- ste          % bar 32
  e -- lei -- son. Ky -- ri --          % bar 33
  e e -- lei -- son.                    % bar 34
  Ky -- ri -- _ e e --                  % bar 35 - soprano
  lei -- son.                           % bar 36
  Ky -- ri -- e, Ky -- ri -- e __ e --  % bar 37
  lei -- son.                           % bar 38
}

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
  <<
    % Upper line: cues, printed smaller so they read as "not mine"
    \new Staff \with {
      instrumentName = "Cues"
      shortInstrumentName = "Cue"
      \magnifyStaff #5/7
    } \new Voice = "cues" { \kyrieCues }
    \new Lyrics \with {
      \override LyricText.font-size = #-1
    } \lyricsto "cues" { \kyrieCueWords }

    % Lower line: the timpani part
    \new Staff \with {
      instrumentName = "Pauken"
      shortInstrumentName = "Pk."
      midiInstrument = "timpani"
    } { \clef bass \kyriePauken }
  >>
  \header { piece = "I. Kyrie" }
  \layout {}
  \midi {}
}
