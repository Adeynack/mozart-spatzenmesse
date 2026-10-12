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
% LYRICS IN THE CUES, written measure by measure, right after the notes:
%
%   \sung { e'4 g'8. b16 c'4 r8 c' } \lyricmode { Ky -- ri -- e }
%
% Each syllable goes on the next note (rests and tied-to notes are skipped).
% "--" joins the syllables of one word, "__" draws an extender line, and
% "_" leaves a note without a syllable. \pkSystem prints all the syllables
% on one lyrics line under the cue staff.
% ---------------------------------------------------------------------------
sung = #(define-music-function (notes lyrics) (ly:music? ly:music?)
  (let ((syllables (extract-named-music lyrics '(LyricEvent SkipEvent)))
        (tied-from-previous #f))
    (for-each
      (lambda (note)
        (let ((tied (pair? (extract-named-music note 'TieEvent))))
          (cond
            ((memq (ly:music-property note 'name) '(RestEvent)) #f)
            (tied-from-previous #f)
            ((pair? syllables)
             (ly:music-set-property! note 'pk-syllable (car syllables))
             (set! syllables (cdr syllables))))
          (if (not (eq? (ly:music-property note 'name) 'RestEvent))
              (set! tied-from-previous tied))))
      (extract-named-music notes '(NoteEvent EventChord RestEvent)))
    (if (pair? syllables)
        (ly:input-warning (*location*) "\\sung: more syllables than notes"))
    notes))

% Builds the lyrics line for \pkSystem from cue music containing \sung:
% every syllable keeps the length of its note, everything else becomes \skip.
#(define (pk-has-syllables? m)
   (pair? (extract-music m (lambda (x) (ly:music? (ly:music-property x 'pk-syllable))))))

#(define (pk-cue-lyrics m)
   (let* ((len (ly:moment-main (ly:music-length m)))
          (dur (lambda () (ly:make-duration 0 0 len)))
          (skip (lambda ()
                  (if (zero? len)
                      (make-sequential-music '())
                      (make-music 'SkipMusic 'duration (dur)))))
          (syllable (ly:music-property m 'pk-syllable)))
     (cond
       ((ly:music? syllable)
        (let ((s (ly:music-deep-copy syllable)))
          (ly:music-set-property! s 'duration (dur))
          s))
       ((not (pk-has-syllables? m)) (skip))
       ((music-is-of-type? m 'sequential-music)
        (make-sequential-music (map pk-cue-lyrics (ly:music-property m 'elements))))
       ((music-is-of-type? m 'simultaneous-music)
        (make-simultaneous-music
          (list (pk-cue-lyrics (find pk-has-syllables? (ly:music-property m 'elements)))
                (skip))))
       ((ly:music? (ly:music-property m 'element))
        (pk-cue-lyrics (ly:music-property m 'element)))
       (else (skip)))))

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

      % Lyrics of the cues (from \sung), hidden where there are none
      \new Lyrics \with {
        \override LyricText.font-size = #-1
      } { $(pk-cue-lyrics cues) }

      % Lower line: the timpani part
      \new Staff \with {
        instrumentName = "Pauken"
        shortInstrumentName = "Pk."
        midiInstrument = "timpani"
      } { \clef bass $pauken }
    >>
  #})
