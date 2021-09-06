" General Settings ----------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
set relativenumber            " turn on relative line numbers
set termguicolors
set syntax=on
set mouse=a
set encoding=UTF-8
let mapleader = " " " map leader to Space
map <leader><space> :noh<CR>

" Plugins -------------------------------------------------------------------
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'dense-analysis/ale'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kevinoid/vim-jsonc'
" Plug 'junegunn/seoul256.vim'
Plug 'tomasiser/vim-code-dark'
" Initialize plugin system
call plug#end()


" Color Specific Settings ---------------------------------------------------
" colorscheme jellybeans
colorscheme codedark
let g:airline_theme = 'codedark'

" Nerd Tree -----------------------------------------------------------------
" autocmd VimEnter * NERDTree | wincmd p
" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeMouseMode=2
let NERDTreeShowHidden=0
let NERDTreeIgnore=['__pycache__']


" ALE -----------------------------------------------------------------------
let g:ale_linters = {'python': ['flake8', 'mypy', 'pyright']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['isort', 'black'],
\}
let g:ale_fix_on_save = 1


" Git Gutter ----------------------------------------------------------------
let g:gitgutter_async=0
" clear background on gutter
highlight clear SignColumn


" FZF -----------------------------------------------------------------------
"
nnoremap <leader>p :Files<Cr>
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Telescope ------------------------------------------------
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <leader>fa <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>

" ControlP ------------------------------------------------------------------
" let g:ctrlp_map = '<leader>p'
" let g:ctrlp_cmd = 'CtrlP'
" ignore files in gitignore
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


" CoC -----------------------------------------------------------------------
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gds :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gdv :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gdt :call CocAction('jumpDefinition', 'tabe')<CR>
set cmdheight=2

" coc vim pyright detect project root
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" TreeSitter ----------------------------------------------------------------
set foldmethod=expr
" set foldlevel=99
set foldexpr=nvim_treesitter#foldexpr()

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF
