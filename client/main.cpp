
#include "engine/src/engine.hpp"
#include "engine/src/render/window.hpp"
#include "engine/src/utils.hpp"
#include "shared/src/constants.hpp"

Window *game_window;

int main() {
  engine_init(Engine_init_everything);
  game_window = new Window(game_title, 1200, 900);

  while (!game_window->want_quit) {
    game_window->clear((Color){0,0,0,255});
    game_window->next_frame();
  }

  delete game_window;
}