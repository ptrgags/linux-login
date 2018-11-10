set relativenumber
set number
set tabstop=4
set softtabstop=4
set colorcolumn=80
set backspace=2
set shiftwidth=4
set expandtab
set ruler
set hlsearch
set showmatch
set autoindent
set smartindent
set showcmd
set cursorline
set foldcolumn=1
syntax on

"Uncomment if you have this colorscheme from
"https://github.com/christophermca/meta5 
"colorscheme meta5

if has('mouse')
	set mouse=a
endif

"Set leader
let mapleader = ","

"Leader commands ================================
"Toggle paste mode
set pastetoggle=<leader>z
"change to previous/next tab
noremap <leader>h gT
noremap <leader>l gt
"toggle line numbers (for easier copying/pasting in PuTTY)
noremap <leader>n :set nonumber! norelativenumber!<CR>
"================================================

"Set filetypes
au BufRead,BufNewFile *.rs set filetype=rust

"tabedit for multiple tabs. This accepts glob patterns.
function! Multitabs(...)
    for i in a:000
        for fname in split(glob(i), '\n')
            exe 'tabedit' fname
        endfor
    endfor
endfunction
command! -nargs=* -complete=file Tabs call Multitabs(<f-args>)

"Open a C/C++ file side-by-side with its h file. Just specify
"the .c/.cpp filename.
function! CppSplit(cpp_file)
    " Replace .c/.cpp with .h
    let h_file = fnamemodify(a:cpp_file, ':r') . '.h'
    " Open the .h file
    exe 'tabedit' h_file
    " Split the window and open the .c/.cpp file on the right
    exe 'vsplit' a:cpp_file
endfunction
command! -nargs=1 -complete=file CSplit call CppSplit(<f-args>)
