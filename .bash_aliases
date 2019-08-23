alias v=mvim
alias k=kubectl
alias lk=/usr/local/opt/kubectl/bin/kubectl
alias tf=/usr/local/opt/terraform/bin/terraform
alias tf12=/usr/local/Cellar/terraform/0.12.2/bin/terraform
alias ans-setup="docker run -it -v `pwd`/hosts:/etc/ansible/hosts --entrypoint /bin/bash -v ~/.config/gcloud:/root/.config/gcloud -v ~/.aws:/root/.aws -v ~/.kube:/root/.kube -v ~/.ssh/id_rsa:/root/.ssh/id_rsa -v ~/.ssh/known_hosts:/root/.ssh/known_hosts -v ~/.gnupg:/root/.gnupg  -v `pwd`:/playbooks us.gcr.io/tapad-registry/ansible/ansible-2.6"
alias gd="cd ~/git"
alias kgp="kubectl get pods | grep"
