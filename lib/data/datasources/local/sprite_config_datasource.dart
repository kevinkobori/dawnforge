import 'dart:convert';

import 'package:dawnforge/data/models/sprite_sheet_model.dart';
import 'package:flutter/services.dart';

/// DataSource para carregar configurações de sprite sheets
abstract class SpriteConfigDataSource {
  Future<SpriteSheetModel> loadSpriteSheetConfig(String configPath);
  Future<List<SpriteSheetModel>> loadAllSpriteConfigs();
}

/// Implementação local do DataSource
class LocalSpriteConfigDataSource implements SpriteConfigDataSource {
  @override
  Future<SpriteSheetModel> loadSpriteSheetConfig(String configPath) async {
    try {
      final jsonString = await rootBundle.loadString(configPath);
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      return SpriteSheetModel.fromJson(jsonMap);
    } catch (e) {
      throw Exception(
        'Failed to load sprite sheet config from $configPath: $e',
      );
    }
  }

  @override
  Future<List<SpriteSheetModel>> loadAllSpriteConfigs() async {
    const configPaths = [
      'assets/data/sprites/player_animations.json',
      'assets/data/sprites/enemies_config.json',
      'assets/data/sprites/effects_config.json',
    ];

    final configs = <SpriteSheetModel>[];

    for (final path in configPaths) {
      try {
        final config = await loadSpriteSheetConfig(path);
        configs.add(config);
      } catch (e) {
        // Log error but continue loading other configs
        print('Warning: Could not load sprite config from $path: $e');
      }
    }

    return configs;
  }
}
