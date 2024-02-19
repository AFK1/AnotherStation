export MY_PATH="$(dirname -- "${BASH_SOURCE[0]}")"
export BIN_DIR=bin
export GAME_NAME="AS"
$MY_PATH/compile_client.bash
$MY_PATH/compile_server.bash