\version "2.26.0"

% ---------------------------------------------------------------------------
% Lines starting with % are comments. LilyPond ignores them.
%
% Layout of this file:
%   1. Header and layout settings shared by the whole piece
%   2. \pkSystem: the two-staff setup (cues + Pauken), defined once
%   3. One section per movement: its global, cues, Pauken, then its \score
%
% To add a movement: copy a movement section, rename its variables
% (e.g. sanctusGlobal, sanctusCues, sanctusPauken) and change the piece name.
% ---------------------------------------------------------------------------

\header {
  title = "Messe"
  composer = "W. A. Mozart"
  instrument = "Pauken (in C – G)"
  tagline = ##f   % removes the "Music engraved by LilyPond" footer
}

% Layout settings here (outside any \score) apply to every movement.
\layout {
  \context {
    \Score
    % Number every measure (including bar 1), not just the start of each line
    barNumberVisibility = #all-bar-numbers-visible
    \override BarNumber.break-visibility = ##(#t #t #t)
  }
}

% ---------------------------------------------------------------------------
% THE TWO-STAFF SYSTEM, defined once and reused by every movement.
% Usage:  \pkSystem \someCues \somePauken
% (This is a small "music function": it takes two pieces of music and
%  returns them placed on the cue staff and the Pauken staff.)
% ---------------------------------------------------------------------------
pkSystem = #(define-music-function (cues pauken) (ly:music? ly:music?)
  #{
    <<
      % Upper line: cues, printed smaller so they read as "not mine"
      \new Staff \with {
        instrumentName = "Cues"
        shortInstrumentName = "Cue"
        \magnifyStaff #5/7
      } $cues

      % Lower line: the timpani part
      \new Staff \with {
        instrumentName = "Pauken"
        shortInstrumentName = "Pk."
        midiInstrument = "timpani"
      } { \clef bass $pauken }
    >>
  #})

% ===========================================================================
% I. KYRIE
% ===========================================================================

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
kyrieCues = \fixed c' {
  \kyrieGlobal
  <c e g>1 |
  <c f a>1 |
  <b, d g>1 |
  <b, d f g>1 |
  <c e g>1 |
  \bar "|."
}

% PAUKEN: your part, written at sounding pitch in bass clef.
% \fixed c { ... } means a plain "c" is the C below middle C (C3),
% so "g," is the low G (G2) – i.e. the classic C–G Mozart tuning.
%
%   \f \p \mf ...    dynamics, written right after the note
%   \< \> \!         crescendo / decrescendo / end of hairpin
%   c1:32            tremolo (roll) — the :32 draws the strokes through the stem
%   \fermata         fermata, written after the note
kyriePauken = \fixed c {
  \kyrieGlobal
  c4\f r g, r         |                % bar 1 – I
  R1                  |                % bar 2 – IV (no F on the drums: tacet)
  g,2 g,2             |                % bar 3 – V
  g,4 g, g, g,        |                % bar 4 – V7
  c1:32\fermata       |                % bar 5 – I, roll to the end
  \bar "|."
}

\score {
  \pkSystem \kyrieCues \kyriePauken
  \header { piece = "I. Kyrie" }
  \layout {}
  \midi {}
}

% ===========================================================================
% II. GLORIA
% ===========================================================================

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

% ===========================================================================
% III. CREDO
% ===========================================================================

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
  \pkSystem \credoCues \credoPauken
  \header { piece = "III. Credo" }
  \layout {}
  \midi {}
}
