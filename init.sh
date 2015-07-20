#!/bin/sh

source auth.sh
source api.sh

help() {
  echo
  echo '  Usage: init.sh [options]'
  echo
  echo '  Options:'
  echo
  echo '    -h, --help             output usage information'
  echo '    -u, --user  <string>   sets the custom user name'
  echo '    -p, --pass  <string>   sets the custom password'
  echo '    -r, --repo  <string>   sets the name of repository'
  echo '    -f, --func  <string>   calls specified function'
  echo '    -l, --label <string>   sets the label name'
  echo '    -c, --color <string>   sets the labels color'
  echo
}

while [ $# -gt 0 ]; do
  option="$1"

  case $option in
  -u|--user)
    USER="$2"; shift;;

  -p|--pass)
    PASS="$2"; shift;;

  -r|--repo)
    REPO="$2"; shift;;

  -f|--func)
    FUNC="$2"; shift;;

  -l|--label)
    LABEL="$2"; shift;;

  -c|--color)
    COLOR="$2"; shift;;

  -h|--help)
    help
    exit;;
  esac

  shift
done

if [ -z $FUNC ]; then
  help
  exit 1
fi

# check the debug mode
test -n "$DEBUG" && set -x

# executing function from API
$FUNC $LABEL $COLOR
