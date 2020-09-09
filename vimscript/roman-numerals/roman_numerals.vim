"
" This works, but I really want to refactor it
"

function! ToRoman(number) abort
  " your code goes here
  if a:number >= 1000
    return 'M' . ToRoman(a:number-1000)
  elseif a:number >= 900
    return 'C' . ToRoman(a:number+100)
  elseif a:number >= 500
    return 'D' . ToRoman(a:number-500)
  elseif a:number >= 400
    return 'C' . ToRoman(a:number+100)
  elseif a:number >= 100
    return 'C' . ToRoman(a:number-100)
  elseif a:number >= 90
    return 'X' . ToRoman(a:number+10)
  elseif a:number >= 50
    return 'L' . ToRoman(a:number-50)
  elseif a:number >= 40
    return 'X' . ToRoman(a:number+10)
  elseif a:number >= 10
    return 'X' . ToRoman(a:number-10)
  elseif a:number >= 9
    return 'I' . ToRoman(a:number+1)
  elseif a:number >= 5
    return 'V' . ToRoman(a:number-5)
  elseif a:number >= 4
    return 'I' . ToRoman(a:number+1)
  elseif a:number > 0
    return 'I' . ToRoman(a:number-1)
  else
    return ""
  endif
endfunction
