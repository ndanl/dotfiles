
set nocompatible
set bs=2
set ts=4
set sw=4
set expandtab
set wrapmargin=0
syntax on
set autowrite
set modeline

if has("netbeans_intg")
	set autochdir
endif

set number

" set exapndtabs
set expandtab

" display
" set columns=80

set background=dark
colorscheme desert

highlight Folded guibg=grey50 guifg=blue
highlight FoldColumn guibg=grey30 guifg=darkblue


set foldcolumn=2
set foldmethod=syntax
syn region myFold start="{" end="}" transparent fold

set ruler
set list
set listchars=tab:>-,trail:-,eol:@

set showcmd
set clipboard=unnamed

" turn on spell-checking everywhere
syn spell toplevel
set spelllang=en_gb

" Plugin options
	"GetLatest
	let g:GetLatestVimScripts_options=""
	
	" TagList
	let Tlist_Close_On_Select			= 1
    let Tlist_Auto_Open = 0
	let Tlist_Display_Prototype			= 1
	let Tlist_File_Fold_Auto_Close		= 1
	let Tlist_GainFocus_On_ToggleOpen	= 1
	let Tlist_Process_File_Allways		= 1
	" possibly just a GUI option
	let Tlist_Show_Menu 				= 1

	" perlsupport options
	let g:Perl_AuthorName = "Gordon Irving"
	let g:Perl_Author = "Gordon Irving"
	let g:Perl_Email  = "goraxe@cpan.org"

	" options for perl.vim
	let perl_fold  =1
	let perl_nofold_packages =0
	let perl_fold_blocks = 1
	let perl_nofold_packages = 1
"	let g:Perl_NoKeyMappings = 1

	" options for minibufexpl
	let g:miniBufExplMapWindowNavVim = 1
	let g:miniBufExplMapWindowNavArrows = 1
	let g:miniBufExplMapCTabSwitchBufs = 1
	let g:miniBufExplModSelTarget = 1

    " options for VimOrganizer
    au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
    au BufEnter *.org            call org#SetOrgFileType()

	" dbext profiles
	" win32
	if has("win32")
	else 
	"linux
		let g:dbext_default_profile_filesdb = ''
	endif

" functions

function! PlainTextFile ()
	set wrapmargin=8 
	set nolist
	set nonumber
endfunction

" maps
nmap gf :vs <cfile><CR>
nmap <silent> <F2> :set invlist<CR>:set invnumber<CR>:set invfoldenable<CR>
nmap <silent> <F3> :set invhls<CR>
nmap <silent> <F7> :TlistToggle<CR>
nmap <silent> <F6> :set invspell<CR>
set pastetoggle=<F8>

nmap <silent> <C-P> :pop<CR>

" Vundle

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'https://github.com/elzr/vim-json'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'


call vundle#end()            " required
filetype plugin indent on    " required

" autocmds

if !exists("autocommands_loaded")
	let autocommands_loaded = 1
" for plain text files
	au BufNewFile,BufRead *.txt call PlainTextFile()
" for perl test files
	au BufNewFile,BufRead *.t setfiletype=perl


	autocmd BufEnter * let &titlestring = "[" . system("whoami") ."](". expand("%:t") . ")"
	if &term == "screen" || &term == "screen-256color"
		set t_ts=k
		set t_fs=\
	endif
	if &term == "screen" || &term == "screen-256color" || &term == "xterm"
		set title
	endif
endif
filetype plugin indent on
