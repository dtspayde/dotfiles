" " Simple keyword completion on all buffers {{{2
" function! TodoKeywordComplete(base)
"     " Search for matchs
"     let res = []
"     for bufnr in range(1,bufnr('$'))
"         let lines=getbufline(bufnr,1,"$")
"         for line in lines
"             if line =~ a:base
"                 " init temporary item
"                 let item={}
"                 let item.word=substitute(line,'.*\('.a:base.'\S*\).*','\1',"")
"                 call add(res,item)
"             endif
"         endfor
"     endfor
"     return res
" endfunction
" 
" " Intelligent completion for projects and Contexts {{{2
" fun! todo#Complete(findstart, base)
"     if a:findstart
"         let line = getline('.')
"         let start = col('.') - 1
"         while start > 0 && line[start - 1] !~ '\s'
"             let start -= 1
"         endwhile
"         return start
"     else
"         if a:base !~ '^+' && a:base !~ '^@'
"             return TodoKeywordComplete(a:base)
"         endif
"         " Opposite sign
"         let opp=a:base=~'+'?'@':'+'
"         " Search for matchs
"         let res = []
"         for bufnr in range(1,bufnr('$'))
"             let lines=getbufline(bufnr,1,"$")
"             for line in lines
"                 if line =~ "[x\s0-9\-]*([a-Z]).* ".a:base
"                     " init temporary item
"                     let item={}
"                     let item.word=substitute(line,'.*\('.a:base.'\S*\).*','\1',"")
"                     let item.buffers=bufname(bufnr)
"                     let item.related=substitute(line,'.*\s\('.opp.'\S\S*\).*','\1',"")
"                     call add(res,item)
"                 endif
"             endfor
"         endfor
"         call sort(res)
"         " Here all results are sorted in res, but we need to merge them
"         let ret=[]
"         if res != []
"             let curitem={}
"             let curitem.word=res[0].word
"             let curitem.related=[]
"             let curitem.buffers=[]
"             for it in res
"                 if curitem.word==it.word
"                     " Merge results
"                     if index(curitem.related,it.related) <0
"                         call add(curitem.related,it.related)
"                     endif
"                     if index(curitem.buffers,it.buffers) <0
"                         call add(curitem.buffers,it.buffers)
"                     endif
"                 else
"                     " Create the definitive item
"                     let resitem={}
"                     let resitem.word=curitem.word
"                     let resitem.info=opp=='+'?"Projects":"Contexts"
"                     let resitem.info.=": ".join(curitem.related, ", ")
"                                 \."\nBuffers: ".join(curitem.buffers, ", ")
"                     call add(ret,resitem)
"                     " Init new item from it
"                     let curitem.word=it.word
"                     let curitem.related=[it.related]
"                     let curitem.buffers=[it.buffers]
"                 endif
"             endfor
"         endif
"         return ret
"     endif
" endfun
" 
" setlocal omnifunc=todo#Complete
" imap <buffer> + +<C-X><C-O>
" imap <buffer> @ @<C-X><C-O>
