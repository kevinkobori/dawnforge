/// Base game exception
abstract class GameException implements Exception {
  const GameException(this.message);
  final String message;

  @override
  String toString() => 'GameException: $message';
}

/// Asset loading exception
class AssetLoadingException extends GameException {
  const AssetLoadingException(super.message);

  @override
  String toString() => 'AssetLoadingException: $message';
}

/// Save/Load exception
class SaveGameException extends GameException {
  const SaveGameException(super.message);

  @override
  String toString() => 'SaveGameException: $message';
}
