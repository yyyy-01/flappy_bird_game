import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game/flappy_bird_game.dart';
import 'screens/main_menu_screen.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [MainMenuScreen.id],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenuScreen(game: game),
      },
    ),
  );
}
