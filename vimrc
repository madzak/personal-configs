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

set expandtab
set tabstop=4
set shiftwidth=4

set t_Co=256
colorscheme wombat256mod

let twitvim_enable_python = 1
let twitvim_browser_cmd = '/usr/bin/chromium-browser'

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
