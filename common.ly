\version "2.26.0"

% ---------------------------------------------------------------------------
% SHARED SETUP, included by every movement file (and so by Pauken.ly too).
% Each movement includes it itself, so a movement file can also be compiled
% on its own (handy in Frescobaldi to preview just that movement).
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
  \context {
    \Staff
    % Hide a staff on any line where it only has rests (not on the first line)
    \RemoveEmptyStaves
  }
}
