import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

import 'no_data_found.dart';

typedef ModelPagedListViewItemBuilder<Model> = Widget Function(
  BuildContext context,
  Model model,
  int index,
);

class ModelPagedListView<Model> extends StatefulWidget {
  final List<Model> items;
  final int pageSize;
  final ModelPagedListViewItemBuilder<Model> itemBuilder;
  final ScrollController? scrollController;
  final Axis scrollDirection;
  final String? noDataFoundMessage;
  final ScrollPhysics? scrollPhysics;
  final bool shrinkWrap;
  final EdgeInsets? padding;
  final WidgetBuilder? noItemsFoundIndicatorBuilder;

  const ModelPagedListView({
    Key? key,
    required this.items,
    required this.pageSize,
    required this.itemBuilder,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    this.scrollPhysics,
    this.noDataFoundMessage,
    this.shrinkWrap = false,
    this.padding,
    this.noItemsFoundIndicatorBuilder,
  }) : super(key: key);

  @override
  State<ModelPagedListView<Model>> createState() =>
      _ModelPagedListViewState<Model>();
}

class _ModelPagedListViewState<Model> extends State<ModelPagedListView<Model>> {
  late final PagingController<int, Model> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void didUpdateWidget(covariant ModelPagedListView<Model> oldWidget) {
    if (widget.items != oldWidget.items) {
      _pagingController.refresh();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems =
          widget.items.skip(pageKey).take(widget.pageSize).toList();
      final isLastPage = newItems.length < widget.pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Model>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Model>(
          itemBuilder: widget.itemBuilder,
          noItemsFoundIndicatorBuilder: widget.noItemsFoundIndicatorBuilder ??
              (parentContext) => Builder(builder: (builderContext) {
                    return FutureBuilder(
                        future: Future.delayed(DurationConstants.kZero),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return SizedBox(
                              height: (parentContext.findRenderObject()
                                      as RenderSliverSingleBoxAdapter?)
                                  ?.constraints
                                  .viewportMainAxisExtent,
                              child: NoDataFound(
                                message: widget.noDataFoundMessage,
                              ),
                            );
                          } else {
                            return Container();
                          }
                        });
                  })),
      scrollController: widget.scrollController,
      scrollDirection: widget.scrollDirection,
      physics:
          const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
    );
  }
}
