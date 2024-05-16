import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';

import '../components/pipe_group.dart';
import '../components/background.dart';
import '../components/bird.dart';
import '../components/ground.dart';
import 'configuration.dart';

class FlappyBirdGame extends FlameGame
    with TapDetector, KeyboardEvents, HasCollisionDetection {
  late Bird bird;
  late TextComponent score;
  bool isHit = false;

  /// If Timer does not work, uncomment this
  // late Timer interval;

  /// If Timer.periodic does not work, uncomment this
  Timer interval = Timer(Config.pipeInterval.toDouble() / 1000, repeat: true);

  @override
  Future<void> onLoad() async {
    TextComponent buildScore() {
      return TextComponent(
        text: 'Score: 0',
        position: Vector2(size.x / 2, size.y / 2 * 0.2),
        anchor: Anchor.center,
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'Game',
          ),
        ),
      );
    }

    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
    ]);

    /// If Timer.periodic does not work, uncomment this
    interval.onTick = () => add(PipeGroup());

    /// If Timer does not work, uncomment this
    // interval = Timer.periodic(const Duration(milliseconds: Config.pipeInterval),
    //     (Timer timer) {
    //   if (!paused) {
    //     add(PipeGroup());
    //   }
    // });
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  @override
  KeyEventResult onKeyEvent(
      KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.space) {
      if (!paused) {
        bird.fly();
      } else {
        bird.reset();
        overlays.clear();
        resumeEngine();
      }
    }
    return super.onKeyEvent(event, keysPressed);
  }

  @override
  void update(double dt) {
    super.update(dt);

    /// If Timer.periodic does not work, uncomment this
    interval.update(dt);

    score.text = 'Score: ${bird.score}';
  }
}
