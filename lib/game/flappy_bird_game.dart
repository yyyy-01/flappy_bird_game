import 'dart:async';

import 'package:flame/game.dart';

import '../components/pipe_group.dart';
import '../components/background.dart';
import '../components/bird.dart';
import '../components/ground.dart';
import 'configuration.dart';

class FlappyBirdGame extends FlameGame {
  late Bird bird;
  late Timer interval;

  // Timer interval = Timer(Config.pipeInterval, repeat: true);

  @override
  Future<void> onLoad() async {
    // add(Background());
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
    ]);

    interval = Timer.periodic(const Duration(milliseconds: Config.pipeInterval),
        (Timer timer) {
      add(PipeGroup());
    });
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
