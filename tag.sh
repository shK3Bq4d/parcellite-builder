#!/usr/bin/env bash


DIR="$( cd -P "$( dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd )"

echo "$(basename "$(readlink -f "$DIR/..")")/$(basename "$DIR")" | tr '[:upper:]' '[:lower:]'
