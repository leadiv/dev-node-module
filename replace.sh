#!/usr/bin/env bash

# Configuration
escape="\033[";
green="${escape}32m";
red="${escape}[31m";
reset="${escape}00m";
INFO="[${green}INFO${reset}]"
ERROR="[${red}ERROR${reset}]"

# Current Directory
CDIR=${PWD}


if [[ -n "${1}" ]]; then
    PACKAGE=${CDIR}/"${1}"/node_modules
    echo "using package ${PACKAGE}"
else
    echo -e "${ERROR} package not specified"
    echo "usage: ./dev-node-module/replace.sh [package] [module] [prefix]"
    exit 1
fi

if [[ -n "${2}" ]]; then
    MODULE="${2}"
    echo "using module ${MODULE}"
else
    echo -e "${ERROR} module not specified"
    echo "usage: ./replace.sh [package] [module] [prefix]"
    exit 1
fi

if [[ -n "${3}" ]]; then
    PREFIX="${3}"
    echo "using module prefix ${PREFIX}"
fi


if [ -d ${PACKAGE}/.${MODULE} ]; then
    echo -e "${INFO} Restoring ${MODULE}"
    rm -rf ${PACKAGE}/${MODULE}
    mv ${PACKAGE}/.${MODULE} ${PACKAGE}/${MODULE}
else
    echo -e "${INFO} Prepping ${PACKAGE} for ${MODULE}"
    mv ${PACKAGE}/${MODULE} ${PACKAGE}/.${MODULE}
    cp -r ${PREFIX}-${MODULE} ${PACKAGE}/${MODULE}
fi
