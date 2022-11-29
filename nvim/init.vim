set number
set mouse=a

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'akinsho/toggleterm.nvim'
call plug#end()

" Show hidden files and folders in NERDTree  
let NERDTreeShowHidden = 1

" Toogle NERDTree
noremap <F6> :NERDTreeRefreshRoot<CR> :NERDTreeToggle<CR>

" Set hotkey for term
noremap <F7> :ToggleTerm<CR>
