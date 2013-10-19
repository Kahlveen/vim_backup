set nocompatible
filetype off
set mouse=a
set background=dark
syntax on
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set history=50
set hlsearch
set incsearch
set number
set ruler
set shiftwidth=4
set tabstop=4
filetype plugin on

"To autocomplete, type first few letters then press CTRL-N or CTRL-P to toggle
"options

""""""""""""""""""""""""""""""""""""""""""""""""
" The following are settings to enable automatic popup menu for autocomplete. 
" Works for cpp classes, class variables and methods.
""""""""""""""""""""""""""""""""""""""""""""""""
"" omnicppcomplete options
""map  :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.vim/commontags /usr/include /usr/local/include ~/moz/obj-ff-dbg/dist/include
"set tags+=~/.vim/commontags

"" --- OmniCppComplete ---
"" -- required --
"set nocp " non vi compatible mode
"filetype plugin on " enable plugins

" -- optional --
" auto close options when exiting insert mode or moving away
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,menuone

" -- configs --
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
let OmniCpp_LocalSearchDecl = 1 " don't require special style of function opening braces

" -- ctags --
" map F3 to generate ctags for current folder:
map  <F3> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" add current directory's generated tags file to available tags
set tags+=./tags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Setting the colors of the popup menu
"Pmenu refers to the non-selected items, PmenuSel = select item
"ctermfg = color of the words, ctermbg = color of backgrd
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight Pmenu ctermfg=yellow ctermbg=black gui=bold
highlight PmenuSel ctermfg=yellow ctermbg=red gui=bold


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"General Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"<leader> represents \ -->
"Maps opening a new file to \o
nmap <leader>o :e 

"Maps remove highlighting search word to \n
nmap <leader>n :noh<cr>

"map <F2> to save file
noremap <F2> :w!<cr>

"Go to previous and next buffer respectively using CTRL left and right arrows
:noremap <C-left> :bp<cr>
:noremap <C-right> :bn<cr>

let Tlist_Ctags_Cmd="/usr/bin/ctags"

"Generates the tags for all the .cpp and .h files in the current directory
map <F4> :TlistAddFiles ./*.cpp ./*.h<CR>

"Toggles the list of functions/variables within the script. If ctags is run,
"can also list the above for all tagged scripts
map <F5> :TlistToggle<cr>

"This defines a visible marker to be placed on some line. <F8> places the
"marker. To remove the marker, go to that line and press <F9>.
:sign define information text=>> linehl=Warning texthl=Error icon=/path/to/information.xpm
:map <F6> :exe ":sign place 123 line=" . line('.') ." name=information file=" . expand('%:p')<CR>
:map <F7> :sign unplace<CR>

"Set indent mode for the various prog lang
"python
au BufRead,BufNewFile *.py,*.pyw,*.html set autoindent 

"if script is C++ file or java file
au BufRead,BufNewFile *.c,*.cpp,*.java,*.h set cindent

"Code folding
"za toggles the opening and closing of a fold. 
"zr opens all folds, zm closes all folds
au BufRead,BufNewFile *.py,*.pyw set foldmethod=indent "Fold code according to indent. 
au BufRead,BufNewFile *.c,*.cpp,*.java set foldmethod=syntax "Fold code according to braces.  










