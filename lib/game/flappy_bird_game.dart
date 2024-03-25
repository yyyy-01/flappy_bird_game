import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';

import '../components/pipe_group.dart';
import '../components/background.dart';
import '../components/bird.dart';
import '../components/ground.dart';
import 'configuration.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  // TODO: Next step Scoring
  // https://youtu.be/zcs8qRBRz7w?t=1616
  late Timer interval;
  bool isHit = false;

  // Timer interval = Timer(Config.pipeInterval, repeat: true);

  @override
  Future<void> onLoad() async {
    // add(Background());
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
    ]);

    interval = Timer.periodic(const Duration(milliseconds: Config.pipeInterval),
        (Timer timer) {
      if (!paused) {
        add(PipeGroup());
      }
    });
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  // @override
  // void update(double dt) {
  //   super.update(dt);
  // }
}
