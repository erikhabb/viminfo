#!/bin/sh

PLUGIN=$1
ZIPFILE="${PLUGIN}.zip"

# add all the basic files
if [ -f "${ZIPFILE}" ] ; then
  rm -f "${ZIPFILE}"
fi
zip -9r "${ZIPFILE}" `find . -name "*${PLUGIN}*"`

# add any additional files
shift
while [ "$1" ] ; do
  zip -u "${ZIPFILE}" "$1"
  shift
done
