nonzero_return() {
	RETVAL=$?
	if [ $RETVAL -eq 0 ]; then
      export _LAST_STATUS_PREFIX_="%{%fg[green]%}"
      export _LAST_STATUS_SYMBOL_="✔"
  else
      export _LAST_STATUS_PREFIX_="%{%fg[red]%}"
      export _LAST_STATUS_SYMBOL_="✘"
  fi
}

swap_ps1() {
  if [ "${THEME}" = "orig" ]; then
    PROMPT='%(?.%F{green}√.%F{red}✘) %F{yellow}[%*] %F{white}%25<...<%~%<<%f $(git_super_status)
$ '
    RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
  else
    unset "${PROMPT}"
    unset "${RPROMPT}"
    ZSH_THEME="${THEME}"
  fi
}
