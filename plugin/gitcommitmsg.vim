"""Commit Msg Saving
let s:tmpfile=expand('~').'/.cache_git_commit_message'
let s:default_snippet_file = expand('~')."/.vim/amazonsnippets/commitmsg"
function! SaveCurrentMsgToCommit()
    execute "normal! gg"
    "search for # and accept match at current position
    let s:match = search('#', 'c')
    if s:match !=1
        let s:match = s:match - 1
        let s:cpstr='silent normal! :0,'.s:match
        let s:cpstr .= 'w! '.s:tmpfile."\<cr>"
        execute s:cpstr
    elseif s:match=1
        echom 'Desc is not saved because it has no description'
    endif
endfunction

function! LoadMsg(filename)
    "Delete the old comments
    execute "normal! ggV/#\<cr>kddO"
    execute "silent normal!gg"
    execute ":r ".a:filename
    execute "silent normal!ggdd"
endfunction

function! LoadDefaultMsg()
    if filereadable(s:default_snippet_file)
        call LoadMsg(s:default_snippet_file)
    endif

endfunction

function! AddMsgToCommit()
    let s:file_to_load = s:default_snippet_file
    if filereadable(s:tmpfile)
        let s:file_to_load=s:tmpfile
    endif
    call LoadMsg(s:file_to_load)
endfunction

augroup GitCommitEditMsg
    autocmd!
    autocmd BufRead COMMIT_EDITMSG :call AddMsgToCommit()
    autocmd BufWritepost COMMIT_EDITMSG :call SaveCurrentMsgToCommit()
    autocmd BufRead COMMIT_EDITMSG nnoremap <buffer> <C-l> :call LoadDefaultMsg()<cr>
augroup END
