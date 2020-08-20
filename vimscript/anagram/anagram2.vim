"the following 2 functions are based upon ajoshguy's exercism solution with a
"little bit of updating. source:
"https://exercism.io/tracks/vimscript/exercises/anagram/solutions/a6e79e2c103046dbb81d5375a8e5dd36
function! AnagramOf(word1,word2) abort
  let SortedChars = { word -> sort(split(tolower(word),'\zs'))}
  return a:word1 !=? a:word2
                 \&& SortedChars(a:word1) == SortedChars(a:word2)
endfunction

function! FindAnagramsSourced(candidates, subject) abort
  return filter(a:candidates,
               \{ _, candidate -> AnagramOf(a:subject,candidate)} 
              \)
endfunction

"nearly illegible reworks as to practice lambdas & functional-perspective vim
function! FindAnagramsLambdas(candidates, subject) abort
  let F1 = { w -> sort(split(tolower(w), '\zs')) }
  let F2 = { w1, w2 -> w1 !=? w2 && F1(w1) == F1(w2) }
  let F2a = { f, w1, w2 -> w1 !=? w2 && f(w1) == f(w2) }
  let F3 = { _, candidate -> F2a(F1, a:subject, candidate) }
  return filter(a:candidates, F3)
endfunction

function! FindAnagramsOneline(candidates, subject) abort
  return filter(a:candidates, { _, w ->
                                \{ f, v -> w !=? v && f(w) == f(v) }
                                  \(
                                      \{ s -> sort(split(tolower(s), '\zs')) },
                                      \a:subject
                                  \)
                             \}
              \)
endfunction

function! FindAnagramsOnelineMoreReadable(candidates, subject) abort
  return filter(a:candidates,
               \{ _, candidate ->
                  \{ sortStrCharsFn ->
                     \candidate !=? a:subject
                                \&& sortStrCharsFn(candidate)
                                    \== sortStrCharsFn(a:subject)
                                    \}(
                                        \{ s -> sort(split(tolower(s),'\zs')) }
                                     \)
                  \}
              \)
endfunction
