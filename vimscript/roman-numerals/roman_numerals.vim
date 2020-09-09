let s:opList = [
  \[ 1000, 'M', 1000 ],
  \[  900, 'C', -100 ],
  \[  500, 'D',  500 ],
  \[  400, 'C', -100 ],
  \[  100, 'C',  100 ],
  \[   90, 'X',  -10 ],
  \[   50, 'L',   50 ],
  \[   40, 'X',  -10 ],
  \[   10, 'X',   10 ],
  \[    9, 'I',   -1 ],
  \[    5, 'V',    5 ],
  \[    4, 'I',   -1 ],
  \[    1, 'I',    1 ],
\]

function! ToRoman(number) abort
  for [grEqNum, numeral, difference] in s:opList
    if a:number >= grEqNum
      return numeral . ToRoman(a:number - difference)
    endif
  endfor
  return ""
endfunction
