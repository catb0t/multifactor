#! /bin/bash

test_sidef () {
  local sidef=$1
  shift
  for f in "$@"
  do
    echo "*** Testing $f..."
    "$sidef" -WkO1 "$f"
    if [[ "$?" != "0" ]]
    then
      echo "*** Test failed!!!"
      return 103
    fi
    echo "*** Test passed!"
  done
}

test_sidef "$@"
