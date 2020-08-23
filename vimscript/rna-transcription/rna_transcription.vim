function! RNAComplementBase(base) abort
  let l:pairsDict = {
      \"G" : "C",
      \"C" : "G",
      \"T" : "A",
      \"A" : "U"
    \}

  return get(l:pairsDict,a:base,'')
endfunction
"
function! ToRna(strand) abort
  return join(
            \map(
              \split(a:strand,'\zs'),
              \{ _, base -> RNAComplementBase(base) }),
         \'')
endfunction
