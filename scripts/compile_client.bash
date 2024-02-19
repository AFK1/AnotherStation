#!/bin/bash

ALL_O_FILES=""

COMPILER="clang++"
LIBS="-lSDL3 -lSDL3_ttf -lSDL3_image -lSDL3_net -lSDL3_mixer"

. $MY_PATH/compile_utils.bash

get_files "engine/src"
get_files "client/src"
get_files "shared/src"
$COMPILER $LIBS ${ALL_O_FILES} -O3 -I. "client/main.cpp" -o${BIN_DIR}/${GAME_NAME}_client