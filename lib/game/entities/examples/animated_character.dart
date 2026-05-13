import 'package:dawnforge/data/models/sprite_sheet_model.dart';
import 'package:dawnforge/game/components/sprite_sheet_component.dart';
import 'package:flame/components.dart';

/// Exemplo de entidade que usa sprite sheets
class AnimatedCharacter extends PositionComponent with HasGameReference {
  AnimatedCharacter({
    required super.position,
    required this.spriteSheetConfig,
  });

  final SpriteSheetModel spriteSheetConfig;
  late SpriteSheetComponent _spriteSheetComponent;
  late SpriteComponent _spriteComponent;

  @override
  Future<void> onLoad() async {
    // Criar o componente de sprite sheet
    _spriteSheetComponent = SpriteSheetComponent(
      imagePath: spriteSheetConfig.imagePath,
      frameWidth: spriteSheetConfig.frameWidth,
      frameHeight: spriteSheetConfig.frameHeight,
      framesPerRow: spriteSheetConfig.framesPerRow,
      totalFrames: spriteSheetConfig.totalFrames,
      animations: _convertAnimations(spriteSheetConfig.animations),
    );

    // Criar o componente visual
    _spriteComponent = SpriteComponent(
      size: Vector2(
        spriteSheetConfig.frameWidth.toDouble(),
        spriteSheetConfig.frameHeight.toDouble(),
      ),
    );

    // Adicionar componentes
    await add(_spriteSheetComponent);
    await add(_spriteComponent);

    // Iniciar animação padrão
    playAnimation('idle');
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Atualizar sprite visual com frame atual
    if (_spriteSheetComponent.isLoaded) {
      _spriteComponent.sprite = _spriteSheetComponent.getCurrentFrameSprite();
    }
  }

  /// Reproduz uma animação
  void playAnimation(String animationName) {
    _spriteSheetComponent.playAnimation(animationName);
  }

  /// Para a animação atual
  void stopAnimation() {
    _spriteSheetComponent.stopAnimation();
  }

  /// Converte models para configs de componente
  Map<String, AnimationConfig> _convertAnimations(
    Map<String, AnimationConfigModel> modelAnimations,
  ) {
    final configs = <String, AnimationConfig>{};

    modelAnimations.forEach((key, model) {
      configs[key] = AnimationConfig(
        name: model.name,
        startFrame: model.startFrame,
        endFrame: model.endFrame,
        duration: model.duration,
        loop: model.loop,
      );
    });

    return configs;
  }

  /// Getters para informações de animação
  String? get currentAnimation => _spriteSheetComponent.currentAnimation;
  bool get isAnimating => _spriteSheetComponent.isAnimating;
}
