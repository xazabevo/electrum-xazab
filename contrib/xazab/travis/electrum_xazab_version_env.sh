#!/bin/bash

VERSION_STRING=(`grep ELECTRUM_VERSION electrum_xazab/version.py`)
XAZAB_ELECTRUM_VERSION=${VERSION_STRING[2]}
XAZAB_ELECTRUM_VERSION=${XAZAB_ELECTRUM_VERSION#\'}
XAZAB_ELECTRUM_VERSION=${XAZAB_ELECTRUM_VERSION%\'}
export XAZAB_ELECTRUM_VERSION

APK_VERSION_STRING=(`grep APK_VERSION electrum_xazab/version.py`)
XAZAB_ELECTRUM_APK_VERSION=${APK_VERSION_STRING[2]}
XAZAB_ELECTRUM_APK_VERSION=${XAZAB_ELECTRUM_APK_VERSION#\'}
XAZAB_ELECTRUM_APK_VERSION=${XAZAB_ELECTRUM_APK_VERSION%\'}
export XAZAB_ELECTRUM_APK_VERSION

APK_VERSION_CODE_SCRIPT='./contrib/xazab/travis/calc_version_code.py'
export XAZAB_ELECTRUM_VERSION_CODE=`$APK_VERSION_CODE_SCRIPT`

# Check is release
SIMPLIFIED_VERSION_PATTERN="^([^A-Za-z]+).*"
if [[ ${XAZAB_ELECTRUM_VERSION} =~ ${SIMPLIFIED_VERSION_PATTERN} ]]; then
    if [[ ${BASH_REMATCH[1]} == ${XAZAB_ELECTRUM_VERSION} ]]; then
        export IS_RELEASE=y
    fi
fi
