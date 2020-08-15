let s:allergies = [
  \ "eggs",
  \ "peanuts",
  \ "shellfish",
  \ "strawberries",
  \ "tomatoes",
  \ "chocolate",
  \ "pollen",
  \ "cats"     ]

function! s:generate_allergies_reverse_dict() abort
  let l:res = {}
  for index in range(len(s:allergies))
    let l:res[s:allergies[index]] = float2nr(pow(2,index))
  endfor
  return l:res
endfunction

let s:allergies_reverse_dict = s:generate_allergies_reverse_dict()

function! AllergicTo(score, allergy) abort
  if and(s:allergies_reverse_dict[a:allergy],a:score) != 0
    return 1
  else
    return 0
  endif
endfunction

function! List(score) abort
  " This function always goes through the whole allergy list (ie. O(allergies)).
  " If the allergy list were always to be far greater in size than the possible
  " number of allergies a score could have (which it isn't in this case),
  " decomposition of the score by iteratively/recursively rounding the score by
  " log2 (log(score)/log(2) in vimscript since it has no dedicated log2) would
  " allow execution to instead be bound by the score.  But, in this case, I find
  " the simplicity of this method to be better, though I might do it via log2
  " for fun some other time
  let l:result = []
  for index in range(len(s:allergies))
    if and(a:score,float2nr(pow(2,index))) != 0
      call add(l:result,s:allergies[index])
    endif
  endfor
  return l:result
endfunction
