\version "2.26.0"

% ---------------------------------------------------------------------------
% Lines starting with % are comments. LilyPond ignores them.
%
% This is the MAIN file — compile this one for the full part:
%   lilypond Pauken.ly
% Each movement file can also be compiled on its own to preview just it.
%
% Layout of the project:
%   Pauken.ly                 the full part: list of movements
%   common.ly                 header and shared layout
%   movements/01-kyrie.ly     one file per movement: includes common.ly,
%   movements/02-gloria.ly    then its global, cues, cue lyrics, Pauken,
%                             and the \score that puts them on the staves
%   movements/03-credo.ly
%
% To add a movement: copy a movement file, rename its variables
% (e.g. sanctusGlobal, sanctusCues, sanctusCueWords, sanctusPauken), change the piece name,
% and add an \include line for it below.
% ---------------------------------------------------------------------------

% ---------------------------------------------------------------------------
% MOVEMENTS, in performance order.
% Comment one out (put % in front) to leave it out of the PDF.
% ---------------------------------------------------------------------------
\include "movements/01-kyrie.ly"
\include "movements/02-gloria.ly"
\include "movements/03-credo.ly"
