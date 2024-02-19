_get_files() {
  if [ -z "$(ls -A $1)" ]; then
    return 0
  fi
  for entry in $1/*
  do
    if [[ -f "$entry" ]]
    then
      if [[ $entry == *.cpp ]]
      then
        ALL_O_FILES="${ALL_O_FILES} $BIN_DIR/$entry.o"
        if [[ -f "$BIN_DIR/$entry.o" ]]
        then
          CF=$(stat -c %y "$entry")
          OF=$(stat -c %y "$BIN_DIR/$entry.o")
          if [[ $CF > $OF ]]
          then
            $COMPILER $LIBS $entry -O3 -I. -c -o$BIN_DIR/$entry.o
          fi
        else
          $COMPILER $LIBS $entry -O3 -I. -c -o$BIN_DIR/$entry.o
        fi
      fi
    else
      mkdir -p $BIN_DIR/$entry
      _get_files "$entry"
    fi
  done
}
get_files() {
  mkdir -p $BIN_DIR
  _get_files $1
}