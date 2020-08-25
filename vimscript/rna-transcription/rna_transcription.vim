function! RNAComplementBase(base) abort
  let l:pairsDict = {
      \"G" : "C",
      \"C" : "G",
      \"T" : "A",
      \"A" : "U"
    \}

  return l:pairsDict[a:base]
endfunction
"
function! ToRna(strand) abort
  try
    return join(
              \map(
                \split(a:strand,'\zs'),
                \{ _, base -> RNAComplementBase(base) }),
           \'')
  catch
    return ''
  endtry
endfunction
