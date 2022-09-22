import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

import 'no_data_found.dart';

typedef ModelPagedListViewItemBuilder<Model> = Widget Function(
  BuildContext context,
  Model model,
  int index,
);

typedef ModelPagedListViewSlidableItemBuilder<Model> = Slidable? Function(
  BuildContext context,
  Model model,
  int index,
  Widget child,
);

class ModelPagedListView<Model> extends StatefulWidget {
  final List<Model> items;
  final int pageSize;
  final Widget? floatingActionButton;
  final ModelPagedListViewItemBuilder<Model> itemBuilder;
  final ModelPagedListViewSlidableItemBuilder<Model>? slidableItemBuilder;
  final ScrollController? scrollController;
  final Axis scrollDirection;
  final String? noDataFoundMessage;
  final ScrollPhysics? scrollPhysics;
  final bool shrinkWrap;
  final bool reverse;
  final EdgeInsets? padding;
  final WidgetBuilder? noItemsFoundIndicatorBuilder;

  const ModelPagedListView({
    Key? key,
    required this.items,
    required this.pageSize,
    required this.itemBuilder,
    this.slidableItemBuilder,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    this.scrollPhysics,
    this.noDataFoundMessage,
    this.shrinkWrap = false,
    this.reverse = false,
    this.padding,
    this.noItemsFoundIndicatorBuilder,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  State<ModelPagedListView<Model>> createState() =>
      _ModelPagedListViewState<Model>();
}

class _ModelPagedListViewState<Model> extends State<ModelPagedListView<Model>> {
  final PagingController<int, Model> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ModelPagedListView<Model> oldWidget) {
    if (!listEquals(widget.items, oldWidget.items)) {
      _pagingController.refresh();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
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
  Widget build(BuildContext context) {
    return _buildPagedListView();
  }

  Widget _buildPagedListView() {
    return Column(
      children: [
        Flexible(
          child: SlidableAutoCloseBehavior(
            child: PagedListView<int, Model>(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              reverse: widget.reverse,
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Model>(
                  itemBuilder: (context, item, index) {
                    var nonSlidableChild =
                        widget.itemBuilder(context, item, index);
                    final child = widget.slidableItemBuilder == null
                        ? nonSlidableChild
                        : widget.slidableItemBuilder!(
                                context, item, index, nonSlidableChild) ??
                            nonSlidableChild;
                    return child;
                  },
                  noItemsFoundIndicatorBuilder: widget
                          .noItemsFoundIndicatorBuilder ??
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
              physics: widget.scrollPhysics ??
                  const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
              shrinkWrap: widget.shrinkWrap,
              padding: widget.padding,
            ),
          ),
        ),
        if (widget.floatingActionButton != null)
          Container(
              color: ColorConstants.kTransparent,
              alignment: Alignment.bottomRight,
              child: widget.floatingActionButton!)
      ],
    );
  }
}
