"after about 2 hours of deriving formulas while cooking food for tonight I
" got to polynomials that represent each of these functions.
" I realize the point of the assignment is more to use research to speed up
" coding practices, but I found my approach to be more incandescent since I
" love mathematics
"
" it was a little annnoying that float2nr had to be called on each res so I
" contemplated using a custom integral-iterative pow function, but that felt
" extremely wasteful.  this is fine
"
function! DifferenceOfSquares(number) abort
  return float2nr({ n -> (3*pow(n,4)+2*pow(n,3)-3*pow(n,2)-2*n)/12 }(a:number))
endfunction

function! SquareOfSum(number) abort
  return float2nr({ n -> (pow(n,4)+2*pow(n,3)+pow(n,2))/4 }(a:number))
endfunction

function! SumOfSquares(number) abort
  return float2nr({ n -> (2*pow(n,3)+3*pow(n,2)+n)/6 }(a:number))
endfunction
