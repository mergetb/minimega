#!/bin/bash

RED="\e[31m"
BLUE="\e[34m"
GREEN="\e[32m"
CYAN="\e[36m"
NORMAL="\e[39m"
BLINK="\e[5m"
RESET="\e[0m"

blue() { 
  echo -e "$BLUE$1$NORMAL" 
}
green() { 
  echo -e "$GREEN$1$NORMAL" 
}
cyan() { 
  echo -e "$CYAN$1$NORMAL" 
}
stage() {
  echo -e "$BLUE$1$BLINK 🔨$RESET"
}

stage "clearing out any existing environments"
rvn destroy

stage "building testing environment"
rvn build

stage "deploying testing environment"
rvn deploy

stage "waiting on nodes"
rvn pingwait a b c d

stage "running base configuration"
rvn configure

stage "checking topology status"
rvn status

stage "configuring switch"
ansible-playbook -i .rvn/ansible-hosts switch.yml

stage "configuring minimega hosts"
ansible-playbook -i .rvn/ansible-hosts setup.yml

green "finished"
