"
call plug#begin('~/.vim/plugged')

Plug 'OmniSharp/omnisharp-vim'

" Mappings, code-actions available flag and statusline integration
Plug 'nickspoons/vim-sharpenup'

" Linting/error highlighting
Plug 'dense-analysis/ale'

" Vim FZF integration, used as OmniSharp selector
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Autocompletion
Plug 'prabirshrestha/asyncomplete.vim'

" Colorscheme
Plug 'gruvbox-community/gruvbox'

" Statusline
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'maximbaz/lightline-ale'

" Snippet support
if g:using_snippets
  Plug 'sirver/ultisnips'
endif

call plug#end()
