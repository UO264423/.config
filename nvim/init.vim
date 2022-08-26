:set number
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a


call plug#begin() 

	
	"Plug 'https://github.com/tpope/vim-fugitive' "Poder mover archivos 

	Plug 'https://github.com/preservim/nerdtree' "Arbol de ficheros 

	Plug 'https://github.com/kyazdani42/nvim-web-devicons'

	"Protocolo random 
	Plug 'https://github.com/prabirshrestha/vim-lsp'

	Plug 'lervag/vimtex'

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	Plug 'https://github.com/KabbAmine/vCoolor.vim'

	Plug 'NLKNguyen/papercolor-theme'

	Plug 'https://github.com/justinmk/vim-sneak'


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
	Plug 'https://github.com/preservim/nerdcommenter'

	"Snippets
	Plug 'https://github.com/honza/vim-snippets'
	Plug 'https://github.com/SirVer/ultisnips'


	"c-n c-n next/ c-x skip /c-p previus
	Plug 'https://github.com/terryma/vim-multiple-cursors'

	"Surround /cs changes surround/ds deletes surround/ysiw yes surround
	"inside whith
	Plug 'https://github.com/tpope/vim-surround'
	"Temas 
	"Plug 'kyoz/purify', { 'rtp': 'vim'  }
	Plug 'https://github.com/morhetz/gruvbox'
	Plug 'https://github.com/colepeters/spacemacs-theme.vim'
	Plug 'chriskempson/base16-vim'

	Plug 'Mofiqul/vscode.nvim'


call plug#end()

set termguicolors  " Activa true colors en la terminal
"colorscheme gruvbox  " Activa grubvox
"Spacemacs theme
set background=dark
"colorscheme spacemacs-theme
"colorscheme PaperColor
"colorscheme gruvbox
"colorscheme base16-default-dark
colorscheme vscode

let mapleader = "\ "

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:coc_global_extensions = ['coc-solargraph']
let g:airline#extensions#tabline#enabled = 1


" relative path
:nmap cp :let @+ = expand("%")<CR>



nmap <F8> :TagbarToggle<CR>
nmap <silent> <F10> <Plug>(coc-definition) 

:set completeopt-=preview " For No Views


nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

nnoremap <Leader>W :w<CR>
nnoremap <Leader>Q :q<CR>

nmap <silent>< :<<CR>
nmap <silent>> :><CR>

nmap <F5> :bnext<CR>
nmap <F3> :bprev<CR>
nmap <F4> :bd<CR>


nnoremap <C-e> :NERDTreeFocus<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-s> :vsp<CR>
nnoremap <C-z> :ea<CR>
nnoremap <C-y> :lat<CR>
nnoremap <Leader>rf <Plug>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
"Replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>"



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

autocmd CursorHold * silent call CocActionAsync('highlight')


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







"---------------------------------------------



" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","
