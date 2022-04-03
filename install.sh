#!/bin/bash
case "$(uname)" in
    "Darwin")
        ./install-macos.sh $@
        ;;
    "Linux")
        echo "Not Implemented!"
        exit 1
        ;;
    *)
        echo "Unknown OS!"
        exit 2
        ;;
esac
