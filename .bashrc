export PATH=$PATH:/usr/local/opt/go/libexec/bin:/usr/local/sbin

# More to come here

complete -C /usr/local/bin/vault vault

complete -C /usr/local/bin/tf12 tf12

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

if [ -f ~/.bash_profile ]; then
  source ~/.bash_profile
fi
export PATH="/Users/ryan.shatford/.serverless/bin:/usr/local/opt/ncurses/bin:/Users/ryan.shatford/.serverless/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:/usr/local/laps:/opt/X11/bin:/Library/Apple/usr/bin:/usr/local/opt/ncurses/bin:/usr/local/opt/go/libexec/bin:/usr/local/sbin:/Users/ryan.shatford/.serverless/bin:/Users/ryan.shatford/bin:/Users/ryan.shatford/go/bin:/Users/ryan.shatford/.vim_runtime/my_plugins/vim-terraform-completion/bin:/Users/ryan.shatford/git/vault-scripts:/usr/local/opt/go/libexec/bin:/usr/local/sbin:/usr/local/opt/go/libexec/bin:/Users/ryan.shatford/bin:/Users/ryan.shatford/go/bin:/Users/ryan.shatford/.vim_runtime/my_plugins/vim-terraform-completion/bin:~/git/vault-scripts:/Users/ryan.shatford/.krew/bin"
