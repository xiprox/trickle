const kFlowMinPlaylistCount = 2;

const kStandardCornerRadius = 14.0;

const kPlayerRefreshRate = Duration(seconds: 5);

const kPlaylistGridColumnWidth = 232.0;

const kDesiredSlotWidth = 208.0;
const kSlotAspectRatio = 0.85;

const spotifyClientId = '2a0af4a5b4a04999be41431a47e663b1';
const redirectUrlScheme = 'trickleapp';
const redirectUrl = '$redirectUrlScheme://redirect';
final spotifyScopes = [
  'user-read-playback-state',
  'user-modify-playback-state',
  'user-read-currently-playing',
  'app-remote-control',
  'streaming',
  'playlist-modify-public',
  'playlist-modify-private',
  'playlist-read-private',
  'playlist-read-collaborative',
  'user-library-modify',
  'user-library-read',
].join(' ');
