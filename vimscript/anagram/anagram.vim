function! MakeLetterDict(string) abort
  let l:ret = {}
  for character in split(a:string,'\zs')
    "originally had this as a trinary (?:) operation but that looked like shit
    if has_key(l:ret,character)
      let l:ret[character] += 1
    else
      let l:ret[character]  = 1
    endif
  endfor
  return l:ret
endfunction

function! FindAnagrams(candidates, subject) abort
  let l:result = []
  let l:lower_subject = tolower(a:subject)
  let l:subjectLetterDict = MakeLetterDict(l:lower_subject)
  for candidate in a:candidates
    let l:lower_candidate = tolower(candidate)
    if l:lower_subject == l:lower_candidate
      continue "words are not anagrams of themselves
    elseif l:subjectLetterDict == MakeLetterDict(l:lower_candidate)
        let l:result += [candidate]
    endif
  endfor
  return l:result
endfunction
