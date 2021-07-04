extension CommonExts<T> on T? {
  let(Function(T) run) {
    if (this != null) {
      run(this!);
    }
    return this;
  }
}
