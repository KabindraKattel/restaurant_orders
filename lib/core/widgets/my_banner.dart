import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/core/extensions/color_extension.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/carousel_view.dart';
import 'package:restaurant_orders/core/widgets/my_error.dart';
import 'package:restaurant_orders/core/widgets/non_scrollable_refresh_indicator.dart';
import 'package:restaurant_orders/core/widgets/shimmer_widget.dart';
import 'package:restaurant_orders/models/assets_model.dart';
import 'package:restaurant_orders/state_management/assets/asset_provider.dart';

class MyBanner extends StatefulWidget {
  @override
  MyBanner() : super(key: GlobalKey());

  @override
  State<MyBanner> createState() => _MyBannerState();
}

class _MyBannerState extends State<MyBanner> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(assetNotifierProvider);
      return Container(
        color: ColorConstants.kBlack.getForegroundColor(),
        constraints: const BoxConstraints(maxHeight: kToolbarHeight * 1.5),
        padding: const EdgeInsets.all(SpacingConstants.kS8),
        child: state.when(
          error: (failure, onRetry) => MyErrorWidget(
            hideAnimation: true,
            failure: failure,
            onRetry: onRetry,
          ),
          loading: () => _buildBannerTile(null, false),
          data: (List<AssetModel> assetsModel) {
            return NonScrollableRefreshIndicator(
                displacement: kToolbarHeight * 0.25,
                onRefresh: () async => ref.refresh(assetNotifierProvider),
                child: _buildBannerCarousel(assetsModel, false));
          },
        ),
      );
    });
  }

  Widget _buildBannerTile(AssetModel? model, bool expand) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        model == null
            ? ShimmerWidget.rectangular(
                height: StylesConstants.kSubTitleSize,
                width: MediaQuery.of(context).size.width * 0.75,
                margin: const EdgeInsets.symmetric(
                    vertical: StylesConstants.kSubTitleSize / 2),
              )
            : _buildTitleBody(
                (model.coName ?? ""), StylesConstants.kSubTitleSize, expand),
        model == null
            ? ShimmerWidget.rectangular(
                height: StylesConstants.kCaptionSize,
                width: MediaQuery.of(context).size.width * 0.5,
                margin: const EdgeInsets.symmetric(
                    vertical: StylesConstants.kCaptionSize / 2),
              )
            : _buildTitleBody(
                (model.coAddress ?? ""), StylesConstants.kCaptionSize, expand),
        model == null
            ? ShimmerWidget.rectangular(
                height: StylesConstants.kCaptionSize,
                width: MediaQuery.of(context).size.width * 0.25,
                margin: const EdgeInsets.symmetric(
                    vertical: StylesConstants.kCaptionSize / 2),
              )
            : _buildTitleBody(
                (model.coTelMail ?? ""), StylesConstants.kCaptionSize, expand),
      ],
    );
  }

  AutoSizeText _buildTitleBody(String text, double fontSize, bool expand) {
    return AutoSizeText(
      text,
      maxLines: expand ? null : 1,
      strutStyle: const StrutStyle(height: 1.25),
      style: TextStyle(
        letterSpacing: 1,
        color: ColorConstants.kBlack,
        fontWeight: StylesConstants.kCaptionWeight,
        fontSize: fontSize,
      ),
    );
  }

  Widget _buildBannerCarousel(List<AssetModel> model, bool expand) {
    return Center(
      child: CarouselView(
          screens: model.map((e) => _buildBannerTile(e, expand)).toList()),
    );
  }
}
