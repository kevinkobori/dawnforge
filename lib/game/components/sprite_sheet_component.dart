import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';

/// Componente ECS para sprite sheets
class SpriteSheetComponent extends Component {
  SpriteSheetComponent({
    required this.imagePath,
    required this.frameWidth,
    required this.frameHeight,
    required this.framesPerRow,
    required this.totalFrames,
    this.animations = const {},
  });

  final String imagePath;
  final int frameWidth;
  final int frameHeight;
  final int framesPerRow;
  final int totalFrames;
  final Map<String, AnimationConfig> animations;

  late Sprite _spriteSheet;
  String? _currentAnimation;
  int _currentFrame = 0;
  double _animationTime = 0;

  @override
  Future<void> onLoad() async {
    _spriteSheet = await Sprite.load(imagePath);
  }

  /// Inicia uma animação
  void playAnimation(String animationName) {
    if (animations.containsKey(animationName)) {
      _currentAnimation = animationName;
      _currentFrame = animations[animationName]!.startFrame;
      _animationTime = 0.0;
    } else {
      debugPrint('Animation $animationName not found');
    }
  }

  /// Para a animação atual
  void stopAnimation() {
    _currentAnimation = null;
    _animationTime = 0.0;
  }

  /// Atualiza a animação
  @override
  void update(double dt) {
    super.update(dt);

    if (_currentAnimation != null) {
      final animation = animations[_currentAnimation]!;
      _animationTime += dt;

      final frameDuration =
          animation.duration / (animation.endFrame - animation.startFrame + 1);

      if (_animationTime >= frameDuration) {
        _animationTime = 0.0;
        _currentFrame++;

        if (_currentFrame > animation.endFrame) {
          if (animation.loop) {
            _currentFrame = animation.startFrame;
          } else {
            _currentFrame = animation.endFrame;
            _currentAnimation = null;
          }
        }
      }
    }
  }

  /// Obtém o sprite do frame atual
  Sprite getCurrentFrameSprite() {
    final row = _currentFrame ~/ framesPerRow;
    final col = _currentFrame % framesPerRow;

    final x = col * frameWidth.toDouble();
    final y = row * frameHeight.toDouble();

    return Sprite(
      _spriteSheet.image,
      srcPosition: Vector2(x, y),
      srcSize: Vector2(frameWidth.toDouble(), frameHeight.toDouble()),
    );
  }

  /// Getters para estado atual
  String? get currentAnimation => _currentAnimation;
  int get currentFrame => _currentFrame;
  bool get isAnimating => _currentAnimation != null;
}

/// Configuração de animação para componentes
class AnimationConfig {
  const AnimationConfig({
    required this.name,
    required this.startFrame,
    required this.endFrame,
    required this.duration,
    this.loop = true,
  });

  final String name;
  final int startFrame;
  final int endFrame;
  final double duration;
  final bool loop;
}
