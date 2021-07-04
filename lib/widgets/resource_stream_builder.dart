import 'package:api_call/resource.dart';
import 'package:flutter/material.dart';

import 'resource_builder.dart';

typedef Widget LoadingBuilder<T>(BuildContext context, T? data);
typedef Widget ContentBuilder<T>(BuildContext context, T data);
typedef Widget ErrorBuilder<T>(BuildContext context, ErrorInfo error, T? data);
typedef Widget EmptyBuilder<T>(BuildContext context);

class ResourceStreamBuilder<T> extends StatelessWidget {
  final Stream<Resource<T>> stream;
  final LoadingBuilder<T>? loadingBuilder;
  final ContentBuilder<T> contentBuilder;
  final ErrorBuilder<T>? errorBuilder;
  final EmptyBuilder<T>? emptyBuilder;
  final Function()? onRetry;
  final Resource<T>? initialData;

  ResourceStreamBuilder({
    required this.stream,
    this.loadingBuilder,
    required this.contentBuilder,
    this.errorBuilder,
    this.emptyBuilder,
    this.onRetry,
    Resource<T>? initialData,
  }) : this.initialData = initialData ?? Resource<T>.loading();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Resource<T>>(
      stream: stream.distinct(),
      initialData: initialData,
      builder: (context, snapshot) {
        Resource<T>? res = snapshot.data;
        if (snapshot.hasError) {
          final error = snapshot.error;
          if (error is Exception) {
            res = Resource<T>.error(error.toString());
          } else {
            throw error ?? '!?';
          }
        }
        if (res != null) {
          return ResourceBuilder<T>(
            resource: res,
            contentBuilder: contentBuilder,
            loadingBuilder: loadingBuilder,
            emptyBuilder: emptyBuilder,
            errorBuilder: errorBuilder,
            onRetry: onRetry,
          );
        }
        return Container();
      },
    );
  }
}
