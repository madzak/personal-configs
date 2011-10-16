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

set autochdir

set pastetoggle=<F2>

if has("gui_running")
    colorscheme wombat

    set guioptions-=m
    set guioptions-=T
    set columns=120
    set lines=60

    set cursorline
else
    set t_Co=256
    colorscheme wombat256mod
endif

" set up syntax highlighting for my e-mail
au BufRead,BufNewFile .followup,.article,.letter,/tmp/pico*,nn.*,snd.*,/tmp/mutt* :set ft=mail

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

" Space to tab
:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'
