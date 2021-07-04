import 'package:api_call/resource.dart';

class Query<T> {
  static Stream<Resource<T>> stream<T>(Stream<T> operation()) async* {
    yield Resource<T>.loading();
    try {
      await for (final item in operation()) {
        if (item == null || (item is List && item.isEmpty)) {
          yield Resource<T>.empty();
        } else {
          yield Resource<T>.success(item);
        }
      }
    } catch (error) {
      yield Resource<T>.error(error.toString());
    }
  }

  static Future<Resource<T>> future<T>(Future<T> operation()) async {
    try {
      final result = await operation();
      if (result == null || (result is List && result.isEmpty)) {
        return Resource<T>.empty();
      } else {
        return Resource<T>.success(result);
      }
    } catch (error) {
      return Resource<T>.error(error.toString());
    }
  }
}
