/// Utilitários para trabalhar com sprite sheets
class SpriteSheetUtils {
  /// Calcula a posição de um frame no sprite sheet
  static ({double x, double y}) getFramePosition({
    required int frameIndex,
    required int frameWidth,
    required int frameHeight,
    required int framesPerRow,
  }) {
    final row = frameIndex ~/ framesPerRow;
    final col = frameIndex % framesPerRow;

    return (
      x: col * frameWidth.toDouble(),
      y: row * frameHeight.toDouble(),
    );
  }

  /// Calcula o número total de linhas do sprite sheet
  static int getTotalRows({
    required int totalFrames,
    required int framesPerRow,
  }) {
    return (totalFrames / framesPerRow).ceil();
  }

  /// Valida se os parâmetros do sprite sheet são válidos
  static bool validateSpriteSheetParams({
    required int frameWidth,
    required int frameHeight,
    required int framesPerRow,
    required int totalFrames,
  }) {
    return frameWidth > 0 &&
        frameHeight > 0 &&
        framesPerRow > 0 &&
        totalFrames > 0 &&
        totalFrames >= framesPerRow;
  }

  /// Calcula o tamanho total necessário da imagem
  static ({int width, int height}) calculateImageSize({
    required int frameWidth,
    required int frameHeight,
    required int framesPerRow,
    required int totalFrames,
  }) {
    final totalRows = getTotalRows(
      totalFrames: totalFrames,
      framesPerRow: framesPerRow,
    );

    return (
      width: framesPerRow * frameWidth,
      height: totalRows * frameHeight,
    );
  }

  /// Converte índice de frame para coordenadas (row, col)
  static ({int row, int col}) frameIndexToCoordinates({
    required int frameIndex,
    required int framesPerRow,
  }) {
    return (
      row: frameIndex ~/ framesPerRow,
      col: frameIndex % framesPerRow,
    );
  }

  /// Converte coordenadas (row, col) para índice de frame
  static int coordinatesToFrameIndex({
    required int row,
    required int col,
    required int framesPerRow,
  }) {
    return (row * framesPerRow) + col;
  }
}
