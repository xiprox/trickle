import 'package:url_launcher/url_launcher.dart' as ul;

abstract class UrlLauncher {
  Future<bool> launch(String url);
}

class UrlLauncherImpl extends UrlLauncher {
  @override
  Future<bool> launch(String url) {
    return ul.launch(url);
  }
}
