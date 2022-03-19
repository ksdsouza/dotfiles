#!/bin/bash
PARAMS=""

while (( "$#" )); do
  case "$1" in
    --shell=[a-z]*)
        SHELL_ARG="${1##*=}"
        shift
        ;;
    --shell)
        if [ -n "$2" ] && [ ${2:0:1} != "-" ]; then
            SHELL_ARG=$2
            shift 2
        else
            echo "Error: Argument for $1 is missing" >&2
            exit 1
        fi
        ;;
    --shell*)
        echo "Error: Argument for --shell is missing" >&2
        exit 1
        ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done

# set positional arguments in their proper place
eval set -- "$PARAMS"

echo $SHELL_ARG

case "$SHELL_ARG" in
    zsh)
        ./install-zsh.sh
esac
