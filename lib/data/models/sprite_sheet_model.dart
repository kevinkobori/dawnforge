import 'package:equatable/equatable.dart';

/// Data Transfer Object para configuração de sprite sheet
class SpriteSheetModel extends Equatable {
  const SpriteSheetModel({
    required this.imagePath,
    required this.frameWidth,
    required this.frameHeight,
    required this.framesPerRow,
    required this.totalFrames,
    this.animations = const {},
  });

  factory SpriteSheetModel.fromJson(Map<String, dynamic> json) {
    final animationsMap = <String, AnimationConfigModel>{};

    if (json['animations'] != null) {
      final animationsJson = json['animations'] as Map<String, dynamic>;
      animationsJson.forEach((key, value) {
        animationsMap[key] = AnimationConfigModel.fromJson(
          value as Map<String, dynamic>,
        );
      });
    }
    return SpriteSheetModel(
      imagePath: json['imagePath'] as String,
      frameWidth: json['frameWidth'] as int,
      frameHeight: json['frameHeight'] as int,
      framesPerRow: json['framesPerRow'] as int,
      totalFrames: json['totalFrames'] as int,
      animations: animationsMap,
    );
  }

  final String imagePath;
  final int frameWidth;
  final int frameHeight;
  final int framesPerRow;
  final int totalFrames;
  final Map<String, AnimationConfigModel> animations;

  Map<String, dynamic> toJson() {
    final animationsJson = <String, dynamic>{};
    animations.forEach((key, value) {
      animationsJson[key] = value.toJson();
    });

    return {
      'imagePath': imagePath,
      'frameWidth': frameWidth,
      'frameHeight': frameHeight,
      'framesPerRow': framesPerRow,
      'totalFrames': totalFrames,
      'animations': animationsJson,
    };
  }

  @override
  List<Object?> get props => [
    imagePath,
    frameWidth,
    frameHeight,
    framesPerRow,
    totalFrames,
    animations,
  ];
}

/// Configuração de uma animação específica
class AnimationConfigModel extends Equatable {
  const AnimationConfigModel({
    required this.name,
    required this.startFrame,
    required this.endFrame,
    required this.duration,
    this.loop = true,
  });

  factory AnimationConfigModel.fromJson(Map<String, dynamic> json) {
    return AnimationConfigModel(
      name: json['name'] as String,
      startFrame: json['startFrame'] as int,
      endFrame: json['endFrame'] as int,
      duration: (json['duration'] as num).toDouble(),
      loop: json['loop'] as bool? ?? true,
    );
  }

  final String name;
  final int startFrame;
  final int endFrame;
  final double duration; // em segundos
  final bool loop;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'startFrame': startFrame,
      'endFrame': endFrame,
      'duration': duration,
      'loop': loop,
    };
  }

  @override
  List<Object?> get props => [name, startFrame, endFrame, duration, loop];
}
