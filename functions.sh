kubecontext() {
  full_ctx=$(kubectl config current-context)
  project_name=$(echo "${full_ctx}"|cut -d"_" -f2)
  shortname=$(echo "${project_name}"| cut -d"-" -f2-)
  region=$(echo "${full_ctx}"|cut -d"_" -f3)

  echo "${shortname} ${region}"
}

timeprompt() {
  current_time=$(date +%H:%M)
  echo "${current_time}"
}
