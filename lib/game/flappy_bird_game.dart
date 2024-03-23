import 'package:flame/game.dart';

import '../components/background.dart';
import '../components/ground.dart';

class FlappyBirdGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    // add(Background());
    addAll([
      Background(),
      Ground(),
    ]);
  }
}
