import 'package:api_call/resource.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supp/sup.dart';
import 'package:trickle/widgets/common_progress_indicator.dart';

typedef Widget LoadingBuilder<T>(BuildContext context, T? data);
typedef Widget ContentBuilder<T>(BuildContext context, T data);
typedef Widget ErrorBuilder<T>(BuildContext context, ErrorInfo error, T? data);
typedef Widget EmptyBuilder<T>(BuildContext context);

class ResourceBuilder<T> extends StatelessWidget {
  final Resource<T> resource;
  final LoadingBuilder<T>? loadingBuilder;
  final ContentBuilder<T> contentBuilder;
  final ErrorBuilder<T>? errorBuilder;
  final EmptyBuilder<T>? emptyBuilder;
  final Function()? onRetry;

  ResourceBuilder({
    required this.resource,
    this.loadingBuilder,
    required this.contentBuilder,
    this.errorBuilder,
    this.emptyBuilder,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (resource.isError()) {
      return _buildError(context, resource.error!, resource.data);
    } else if (resource.isLoading()) {
      return _buildLoading(context, resource.data);
    } else if (resource.isEmpty()) {
      return _buildEmpty(context);
    } else if (resource.data != null) {
      return _buildContent(context, resource.data!);
    } else {
      return Container();
    }
  }

  Widget _buildLoading(BuildContext context, T? data) {
    final override = loadingBuilder?.call(context, data);
    return override ??
        Center(
          key: ValueKey('resource_stream_builder_loading'),
          child: CommonProgressIndicator(),
        );
  }

  Widget _buildError(BuildContext context, ErrorInfo error, T? data) {
    final override = errorBuilder?.call(context, error, data);
    return override ??
        Center(
          key: ValueKey('resource_stream_builder_error'),
          child: QuickSup.error(
            title: 'Oops',
            subtitle: error.message,
            retryText: 'Retry',
            onRetry: onRetry ??
                () {}, // TODO: Remove empty callback when Sup upgrades to null safety
          ),
        );
  }

  Widget _buildEmpty(BuildContext context) {
    final override = emptyBuilder?.call(context);
    return override ??
        Center(
          key: ValueKey('resource_stream_builder_empty'),
          child: QuickSup.empty(
            title: 'Empty',
            subtitle: 'Looks like there\'s nothing here',
          ),
        );
  }

  Widget _buildContent(BuildContext context, T data) {
    final content = contentBuilder(context, data);
    if (kReleaseMode) {
      return content;
    } else {
      int counter = 0;
      return GestureDetector(
        onTap: () {
          if (++counter >= 5) {
            print((data as dynamic).toJson());
            counter = 0;
          }
        },
        behavior: HitTestBehavior.translucent,
        child: content,
      );
    }
  }
}
