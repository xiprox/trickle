import 'package:veee/veee.dart';

/// Instructs the UI to show a [SnackBar] with given [message].
class ShowSnackBar extends ViewModelOrder {
  final String message;
  ShowSnackBar(this.message);
}
