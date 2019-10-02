nonzero_return() {
	RETVAL=$?
	if [ $RETVAL -eq 0 ]; then
      export _LAST_STATUS_PREFIX_="\[\033[0;46m\]"
      export _LAST_STATUS_SYMBOL_="✔"
  else
      export _LAST_STATUS_PREFIX_="\[\033[0;9m\]"
      export _LAST_STATUS_SYMBOL_="✘"
  fi
}

timeprompt() {
  current_time=$(date +%H:%M)
  echo "${current_time}"
}

adderall () {
    ssh-add & \
    ssh-add ~/.ssh/devops & \
    ssh-add ~/.ssh/breakglass
}

