import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/core/pages/will_pop_page.dart';

class FlexibleDecoratedTitledPage extends ConsumerStatefulWidget {
  final double? elevation;
  final String? title;
  final Widget? background;
  final Widget? fixedBanner;
  final List<Widget>? actions;
  final Color? fixedBannerColor;
  final Widget child;
  final GlobalKey? fixedBannerKey;

  const FlexibleDecoratedTitledPage(
      {Key? key,
      this.elevation,
      this.actions,
      this.background,
      this.fixedBanner,
      this.fixedBannerKey,
      this.fixedBannerColor,
      this.title,
      required this.child})
      : super(key: key);

  @override
  ConsumerState<FlexibleDecoratedTitledPage> createState() =>
      _FlexibleDecoratedTitledPageState();
}

class _FlexibleDecoratedTitledPageState
    extends ConsumerState<FlexibleDecoratedTitledPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopPage(
      child: Scaffold(body: buildNestedScrollView()),
    );
  }

  Widget buildNestedScrollView() {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          if (widget.background != null || widget.title != null) ...[
            //parent notifies its content overlap to be checked
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: _buildSliverAppBar(innerBoxIsScrolled),
            ),
          ],
        ];
      },
      body: Builder(
        builder: (context) {
          return CustomScrollView(
            slivers: <Widget>[
              if (widget.background != null || widget.title != null) ...[
                //child listening any content overlap.
                SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context)),
              ],
              if (widget.fixedBanner != null) ...[
                _buildBanner(),
              ],
              SliverLayoutBuilder(
                builder: (context, constraints) => SliverFixedExtentList(
                  itemExtent: constraints.remainingPaintExtent,
                  delegate: SliverChildListDelegate(
                    [widget.child],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBanner() {
    return SliverToBoxAdapter(
      child: Material(
          key: widget.fixedBannerKey,
          shape: RoundedRectangleBorder(
              side:
                  BorderSide(color: Theme.of(context).primaryColor, width: 1)),
          elevation: widget.elevation ?? 5,
          color: widget.fixedBannerColor,
          child: widget.fixedBanner),
    );
  }

  SliverAppBar _buildSliverAppBar(bool innerBoxIsScrolled) {
    return SliverAppBar(
      pinned: true,
      centerTitle: true,
      actions: widget.actions,
      forceElevated: innerBoxIsScrolled,
      backgroundColor: widget.background == null
          ? null
          : Theme.of(context).primaryColor.withOpacity(0.7),
      elevation: widget.elevation ?? 15,
      expandedHeight: widget.background == null
          ? 0
          : MediaQuery.of(context).size.height * 0.35,
      // : 100,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground],
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AutoSizeText(
            widget.title ?? "",
            textKey: UniqueKey(),
            style: const TextStyle(
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 8.0,
                  color: Color.fromARGB(125, 0, 0, 255),
                ),
              ],
            ),
          ),
        ),
        background:
            Material(color: Colors.transparent, child: widget.background),
      ),
    );
  }
}
