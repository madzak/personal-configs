set ruler

set backspace=indent,eol,start

set ignorecase
set smartcase
set incsearch
set hlsearch

set wildmode=list:longest,full

set number

set autowrite

set updatecount=10

syntax enable 

set autoindent
set smartindent

colorscheme wombat256mod

nmap <slient> <BS> :nohlsearch<CR>

augroup HelpInTabs
    au!
    au BufEnter *.txt call HelpInNewTab()
    
    function! HelpInNewTab ()
        if &buftype == 'help'
            execute "normal \<C-W>T"
        endif
    endfunction
augroup END
