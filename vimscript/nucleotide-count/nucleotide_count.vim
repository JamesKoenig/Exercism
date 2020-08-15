function! NucleotideCounts(strand) abort
  let l:retDict = {
    \ 'A' : 0,
    \ 'C' : 0,
    \ 'T' : 0,
    \ 'G' : 0
    \ }

  for c in split(a:strand,'\zs') "split on everything
    try
      let l:retDict[c] = l:retDict[c]+1
    "catch if an invalid nucleotide was given
    catch /^Vim\%((\a\+)\)\=:E716
      throw "Invalid nucleotide in strand"
    endtry
  endfor
  return l:retDict
endfunction
