#!/bin/sh

usage() {
  cat <<HERE
Usage:
  build.sh --template <name> 
  build.sh --help
  templates: ${TEMPLATES} 
  camel versions: 2.20.0-4, 2.21.0-5, 2.22.0-5, 2.23.0-4, 2.24.0-3, 2.25.0-1, 3.0.0-1, 3.1.0, 3.2.0, 3.3.0
  karaf versions java8:  4.1.7
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
