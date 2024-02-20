
#include "../engine/src/engine.hpp"
#include "../engine/src/render/window.hpp"
#include "../engine/src/utils.hpp"
#include "../engine/src/render/camera.hpp"
#include "../engine/src/render/viewport.hpp"
#include "../engine/src/world.hpp"
#include "../shared/src/constants.hpp"
#include "./src/constants.hpp"
#include <SDL3/SDL_keycode.h>
#include <SDL3/SDL_scancode.h>
#include <cstdio>

Window *game_window;

int main() {
  engine_init(Engine_init_everything);
  game_window = new Window(game_title, window_width, window_height);
  Viewport *game_viewport = new Viewport(Vector2(window_width*3/4, window_height));
  Camera2d *character_camera = new Camera2d();
  World2d *game_world = new World2d();
  game_world->bg_color = 0x222222;
  character_camera->move_to_world(game_world);
  character_camera->select_viewport(game_viewport);
  game_window->add_new_viewport(game_viewport);

  while (!game_window->key_pressed[SDL_SCANCODE_Q]) {
    engine_thread();
  }

  delete game_window;
  engine_deinit();
}