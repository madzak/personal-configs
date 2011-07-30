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

python << EOF
# Post to Blog
import vim 
import urllib2, urllib
import base64
import markdown2

def post_blog(site, tags = ""):
    blog_email = 'zak@thezajacs.org'
    blog_password = 'qup6uyut'
    api_token = 'bzGbveggqJIDudhuprrrHhaGtEDidlIt'
    site_id = {
        'wesumo': "2908461", # We Sumo
        'worldofzak': "2192977", # The World of Zak
        'madzak': "2880650", # MadZak
        'thezajacs': "3283198", # The Zajacs
    }[site];
    api_url = 'http://posterous.com/api/newpost'

    title = vim.current.buffer[0]
    body = markdown2.markdown('\n'.join(vim.current.buffer[2:]))

    params = urllib.urlencode({ 
	'api_token': api_token,
        'site_id': site_id,
        'title': title,
        'body': body,
        'autopost': '1',
	'source': 'VIM',
	'tags': tags
    })  

    req = urllib2.Request(api_url, params)
    base64string = base64.encodestring('%s:%s' % (blog_email, blog_password))[:-1]
    req.add_header("Authorization", "Basic %s" % base64string)
    handle = urllib2.urlopen(req)
    print handle.read()

    vim.command('set nomodified') 
EOF
