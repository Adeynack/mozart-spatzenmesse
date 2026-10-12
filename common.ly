\version "2.26.0"

% ---------------------------------------------------------------------------
% SHARED SETUP, included by every movement file (and so by Pauken.ly too).
% Each movement includes it itself, so a movement file can also be compiled
% on its own (handy in Frescobaldi to preview just that movement).
% Including it several times is harmless: it only (re)defines the same things.
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
