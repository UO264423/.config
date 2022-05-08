:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a


call plug#begin()


	Plug 'https://github.com/preservim/nerdtree' "Arbol de ficheros 

	Plug 'https://github.com/kyazdani42/nvim-web-devicons'

	"Protocolo random 
	Plug 'https://github.com/prabirshrestha/vim-lsp'


	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'


	Plug 'https://github.com/ryanoasis/vim-devicons' "Iconos de dev
	Plug 'https://github.com/tc50cal/vim-terminal' "Terminal de comandos
	Plug 'https://github.com/preservim/tagbar' "Barra lateral con atributos, metodos etc
	Plug 'https://github.com/neoclide/coc.nvim' "AutoCompletion
	Plug 'sheerun/vim-polyglot' "Highlighting de muchisimos lenguajes de programacion
	Plug 'jiangmiao/auto-pairs' "Cerrar parentesis
	Plug 'alvan/vim-closetag'  "Cerrar etiquetas
	
	Plug 'christoomey/vim-tmux-navigator' "Moverse entre panele  
	Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } } "Buscador de archivos
	Plug 'https://github.com/junegunn/fzf.vim'
	"Plug 'mhinz/vim-signify' "Añade un + o un menos si borro o añado lineas
	Plug 'https://github.com/Yggdroot/indentLine' "Linea vertical bloque identado
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	

	"Snippets
	Plug 'https://github.com/honza/vim-snippets'


	"Temas 
	"Plug 'kyoz/purify', { 'rtp': 'vim'  }
	Plug 'https://github.com/morhetz/gruvbox'




call plug#end()

set termguicolors  " Activa true colors en la terminal
colorscheme gruvbox  " Activa tema onedark




let mapleader = "\ "

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:coc_global_extensions = ['coc-solargraph']
let g:airline#extensions#tabline#enabled = 1


nmap <F8> :TagbarToggle<CR>
nmap <silent> <F10> <Plug>(coc-definition) 

:set completeopt-=preview " For No Views


nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

nmap <F5> :bnext<CR>
nmap <F3> :bprev<CR>
nmap <F4> :bd<CR>


nnoremap <C-e> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR> 
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-s> :vsp<CR>
nnoremap <C-z> :ea<CR>
nnoremap <C-y> :lat<CR>
nnoremap <Leader>rf <Plug>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>




syntax on 





set splitright

"Coc documentacion
nnoremap <C-d> :call  <SID>show_documentation()<CR>
function! s:show_documentation()
	if CocAction('hasProvider', 'hover')
	    call CocActionAsync('doHover')
	else
	    call feedkeys('K', 'in')
	  endif
endfunction

"Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
"Apply AutoFix to problem on the current line.
nnoremap <Leader>qf  <Plug>(coc-fix-current)
nmap <Leader> gd <Plug>(coc-definition)
nmap <Leader> gy <Plug>(coc-type-definition)
nmap <Leader> gg <Plug>(coc-implementation)
nmap <Leader> gr <Plug>(coc-references)


function! OpenTerminal()
	"move to right most buffer
	execute "normal \<C-l>"
	execute "normal \<C-l>"
	execute "normal \<C-l>"
	execute "normal \<C-l>"

	let bufNum = bufnr("%")
	let buffType = getbufvar(bufNum, "&buftype", "not found")
	
	if buffType == "terminal"
		"close existing terminal
		execute "q"
	else
		"OpenTerminal
		execute "vsp term://zsh"
		
		"turn off numbers
		execute "set nonu"
		execute "set nornu"

		"Toggle insert on enter exit
		silent au BufLeave <buffer> stopinsert!
		silent au BufWinEnter, WinEnter <buffer> startinsert!

		" set maps inside terminal buffer
		execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"

		execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
		execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

		startinsert!
	endif
	
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>

":rg does not search in files
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)



