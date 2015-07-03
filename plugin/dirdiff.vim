" -*- vim -*-
" FILE: "/home/wlee/.vim/plugin/DirDiff.vim" {{{
" LAST MODIFICATION: "Wed, 11 Apr 2012 15:49:03 -0500 (wlee)"
" HEADER MAINTAINED BY: N/A
" VERSION: 1.1.5
" (C) 2001-2015 by William Lee, <wl1012@yahoo.com>
" }}}

" Public Interface:
command! -nargs=* -complete=dir DirDiff call dirdiff#diff (<f-args>)
command! -nargs=0 DirDiffOpen call dirdiff#open ()
command! -nargs=0 DirDiffNext call dirdiff#next ()
command! -nargs=0 DirDiffPrev call dirdiff#prev ()
command! -nargs=0 DirDiffUpdate call dirdiff#update ()
command! -nargs=0 DirDiffQuit call dirdiff#quit ()

" The following comamnds can be used in the Vim diff mode:
"
" \dg - Diff get: maps to :diffget<CR>
" \dp - Diff put: maps to :diffput<CR>
" \dj - Diff next: (think j for down)
" \dk - Diff previous: (think k for up)

if !exists("g:DirDiffEnableMappings")
    let g:DirDiffEnableMappings = 0
endif

if g:DirDiffEnableMappings
    nnoremap <unique> <Leader>dg :diffget<CR>
    nnoremap <unique> <Leader>dp :diffput<CR>
    nnoremap <unique> <Leader>dj :DirDiffNext<CR>
    nnoremap <unique> <Leader>dk :DirDiffPrev<CR>
endif

" Global Maps:

" Default Variables.  You can override these in your global variables
" settings.
"
" For DirDiffExcludes and DirDiffIgnore, separate different patterns with a
" ',' (comma and no space!).
"
" eg. in your .vimrc file: let g:DirDiffExcludes = "CVS,*.class,*.o"
"                          let g:DirDiffIgnore = "Id:"
"                          " ignore white space in diff
"                          let g:DirDiffAddArgs = "-w"
"
" You can set the pattern that diff excludes.  Defaults to the CVS directory
if !exists("g:DirDiffExcludes")
    let g:DirDiffExcludes = ""
endif
" This is the -I argument of the diff, ignore the lines of differences that
" matches the pattern
if !exists("g:DirDiffIgnore")
    let g:DirDiffIgnore = ""
endif
if !exists("g:DirDiffSort")
    let g:DirDiffSort = 1
endif
if !exists("g:DirDiffWindowSize")
    let g:DirDiffWindowSize = 14
endif
if !exists("g:DirDiffInteractive")
    let g:DirDiffInteractive = 0
endif
if !exists("g:DirDiffIgnoreCase")
    let g:DirDiffIgnoreCase = 0
endif
" Additional arguments
if !exists("g:DirDiffAddArgs")
    let g:DirDiffAddArgs = ""
endif
" Support for i18n (dynamically figure out the diff text)
" Defaults to off
if !exists("g:DirDiffDynamicDiffText")
    let g:DirDiffDynamicDiffText = 0
endif

" String used for the English equivalent "Files "
if !exists("g:DirDiffTextFiles")
    let g:DirDiffTextFiles = "Files "
endif

" String used for the English equivalent " and "
if !exists("g:DirDiffTextAnd")
    let g:DirDiffTextAnd = " and "
endif

" String used for the English equivalent " differ")
if !exists("g:DirDiffTextDiffer")
    let g:DirDiffTextDiffer = " differ"
endif

" String used for the English equivalent "Only in ")
if !exists("g:DirDiffTextOnlyIn")
    let g:DirDiffTextOnlyIn = "Only in "
endif

" String used for the English equivalent ": ")
if !exists("g:DirDiffTextOnlyInCenter")
    let g:DirDiffTextOnlyInCenter = ": "
endif
