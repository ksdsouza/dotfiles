#!/bin/bash
case "$(uname)" in
    "Darwin")
        ./macos/install-macos.sh $@
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
