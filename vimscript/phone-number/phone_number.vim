function! ToNANP(number) abort
  let l:candidate = substitute(a:number,'\D','','g')

  if l:candidate =~ '^[2-9]\d\{2\}[2-9]\d\{6\}$'
    return l:candidate
  elseif l:candidate =~ '^1'
    return ToNANP(substitute(l:candidate,'^1','','g'))
  else
    return ''
  endif
endfunction

