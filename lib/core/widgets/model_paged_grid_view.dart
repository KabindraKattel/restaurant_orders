import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:restaurant_orders/core/resources/resources.dart';

import 'no_data_found.dart';

typedef ModelPagedGridViewItemBuilder<Model> = Widget Function(
  BuildContext context,
  Model model,
  int index,
);

typedef ModelPagedGridViewSlidableItemBuilder<Model> = Slidable? Function(
  BuildContext context,
  Model model,
  int index,
  Widget child,
);

class ModelPagedGridView<Model> extends StatefulWidget {
  final List<Model> items;
  final int pageSize;
  final int Function(BoxConstraints constraints)? crossAxisCountBuilder;
  final int? crossAxisCount;
  final Widget? floatingActionButton;
  final double? childAspectRatio;
  final String? noDataFoundMessage;
  final double? mainAxisExtent;
  final ModelPagedGridViewItemBuilder<Model> itemBuilder;
  final ModelPagedGridViewSlidableItemBuilder<Model>? slidableItemBuilder;
  final ScrollController? scrollController;
  final Axis scrollDirection;
  final ScrollPhysics? scrollPhysics;
  final bool shrinkWrap;
  final EdgeInsets? padding;
  final WidgetBuilder? noItemsFoundIndicatorBuilder;

  const ModelPagedGridView({
    Key? key,
    required this.items,
    required this.pageSize,
    required this.itemBuilder,
    this.slidableItemBuilder,
    this.floatingActionButton,
    this.noDataFoundMessage,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    this.scrollPhysics,
    this.shrinkWrap = false,
    this.padding,
    this.childAspectRatio,
    this.noItemsFoundIndicatorBuilder,
    this.crossAxisCountBuilder,
    this.crossAxisCount,
    this.mainAxisExtent,
  })  : assert((crossAxisCount != null || crossAxisCountBuilder != null),
            'Either crossAxisCount or crossAxisCountBuilder should be provided but received none.'),
        super(key: key);

  @override
  State<ModelPagedGridView<Model>> createState() =>
      _ModelPagedGridViewState<Model>();
}

class _ModelPagedGridViewState<Model> extends State<ModelPagedGridView<Model>> {
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
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ModelPagedGridView<Model> oldWidget) {
    // if (!listEquals(widget.items, oldWidget.items)) {
    if ((widget.items != oldWidget.items)) {
      _pagingController.refresh();
    }
    super.didUpdateWidget(oldWidget);
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
    return _buildPagedGridView();
  }

  Widget _buildPagedGridView() {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Flexible(
            child: SlidableAutoCloseBehavior(
              child: PagedGridView<int, Model>(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
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
                                  future:
                                      Future.delayed(DurationConstants.kZero),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return Container(
                                        height: (parentContext
                                                    .findRenderObject()
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: StylesConstants.kGridViewMainAxisSpacing,
                  crossAxisSpacing: StylesConstants.kGridViewCrossAxisSpacing,
                  childAspectRatio: widget.childAspectRatio ??
                      StylesConstants.kGridViewAspectRatio,
                  crossAxisCount: widget.crossAxisCount ??
                      widget.crossAxisCountBuilder!(constraints),
                  mainAxisExtent: widget.mainAxisExtent,
                ),
                shrinkWrap: widget.shrinkWrap,
                scrollController: widget.scrollController,
                scrollDirection: widget.scrollDirection,
                physics: widget.scrollPhysics,
                padding: widget.padding,
              ),
            ),
          ),
          if (widget.floatingActionButton != null)
            Padding(
              padding: const EdgeInsets.only(bottom: SpacingConstants.kS8),
              child: Container(
                color: ColorConstants.kTransparent,
                alignment: Alignment.bottomRight,
                child: widget.floatingActionButton!,
              ),
            )
        ],
      );
    });
  }
}
