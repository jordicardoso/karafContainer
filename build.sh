#!/bin/sh

usage() {
  cat <<HERE
Usage:
  build.sh --template <name> 
  build.sh --help
  templates: ${TEMPLATES} 
  camel version: 2.25.1
  karaf versions java11: 4.2.8
HERE
  exit 1
}

TEMPLATES=`find ./templates -mindepth 1 -maxdepth 1 -printf '%f '`

key="$1"
  case $key in
    --template)
    TEMPLATE_NAME="$2"
    shift
    ;;
    --help)
    usage
    ;;
    *)
    # unknown option
    usage
    ;;
  esac

echo "Building ${TEMPLATE_NAME} container"
cd ./templates/${TEMPLATE_NAME}
docker-compose up -d
