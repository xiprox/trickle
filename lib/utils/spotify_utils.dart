class SpotifyUtils {
  /// Extracts ID from given Spotify URI string.
  /// (e.g. 'spotify:playlist:5ZJZq5qZKZq5ZJZq5qZKZ')
  static String? idFromUri(String? uri) {
    if (uri == null || uri.trim().isEmpty) return null;
    return uri.split(':')[2];
  }
}
