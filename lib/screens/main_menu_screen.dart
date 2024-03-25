import 'package:flutter/material.dart';
import 'package:flutter_flappy_bird_game/game/flappy_bird_game.dart';

import '../game/assets.dart';

class MainMenuScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'mainMenu';

  const MainMenuScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.menu),
            // image: AssetImage('assets/images/menu.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Image.asset(Assets.message),
      ),
    );
  }
}
