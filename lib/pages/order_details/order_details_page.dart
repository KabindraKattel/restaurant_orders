import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/loading.dart';
import 'package:restaurant_orders/core/widgets/my_error.dart';
import 'package:restaurant_orders/core/widgets/no_data_found.dart';
import 'package:restaurant_orders/pages/local_table_setup/widgets/local_table_input_screen.dart';
import 'package:restaurant_orders/pages/order_details/widgets/order_details_screen.dart';
import 'package:restaurant_orders/state_management/order_details/provider.dart';

class OrderDetailsPage extends ConsumerStatefulWidget {
  final String? tableNum;
  final FormControl<String> _tableControl;
  final bool enableSearch;
  OrderDetailsPage({Key? key, this.tableNum, this.enableSearch = true})
      : _tableControl = FormControl<String>(
            value: tableNum, validators: [Validators.required]),
        super(key: key);

  @override
  ConsumerState<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends ConsumerState<OrderDetailsPage> {
  final TextStyle _style = const TextStyle(
    color: ColorConstants.kBlack,
    fontSize: StylesConstants.kCaptionSize,
    fontWeight: StylesConstants.kHeadingWeight,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.tableNum != null && !widget.enableSearch) {
        ref.read(orderDetailsNotifierProvider.notifier)(widget.tableNum!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            StringConstants.kOrderDetails,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(SpacingConstants.kS8),
            child: widget.tableNum == null && !widget.enableSearch
                ? const NoDataFound(
                    message: MessageConstants.kNoTablesSetup,
                  )
                : Column(
                    children: [
                      widget.enableSearch
                          ? _buildSearchBar(ref)
                          : _buildTableInfo(),
                      const SizedBox(
                        height: SpacingConstants.kS8,
                      ),
                      Expanded(
                        child: Center(
                          child: Consumer(builder: (_, ref, __) {
                            final state =
                                ref.watch(orderDetailsNotifierProvider);
                            return state.when(
                                initial: () => const NoDataFound(
                                      message:
                                          MessageConstants.kNoSearchTermEntered,
                                    ),
                                loading: () => const Loading(),
                                data: (data) => RefreshIndicator(
                                      onRefresh: () async => ref.read(
                                              orderDetailsNotifierProvider
                                                  .notifier)(
                                          widget._tableControl.value!),
                                      child: OrderDetailsScreen(
                                        model: data,
                                      ),
                                    ),
                                error: (failure, onRetry) => MyErrorWidget(
                                      failure: failure,
                                      onRetry: onRetry,
                                    ));
                          }),
                        ),
                      )
                    ],
                  )));
  }

  InputDecorator _buildTableInfo() {
    return InputDecorator(
      decoration: InputDecoration(
          isDense: true,
          suffixIcon:
              widget._tableControl.valid ? null : const Icon(Icons.error),
          border: const OutlineInputBorder(
            gapPadding: SpacingConstants.kS0,
            borderRadius: BorderRadius.all(RadiusConstants.kR8),
          ),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: SpacingConstants.kS8,
              vertical: SpacingConstants.kS4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            StringConstants.kTableNumber,
            textAlign: TextAlign.center,
            style: _style,
          ),
          Text(
            widget.tableNum!,
            textAlign: TextAlign.start,
            strutStyle: const StrutStyle(height: 1.5),
            style: _style.copyWith(
                fontWeight: StylesConstants.kSubTitleWeight,
                fontSize: StylesConstants.kSubTitleSize),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(WidgetRef ref) {
    return Row(
      children: [
        Expanded(
            child: LocalTableInputScreen(formControl: widget._tableControl)),
        IconButton(
            onPressed: () {
              if (widget._tableControl.valid) {
                widget._tableControl.unfocus();
                ref.read(orderDetailsNotifierProvider.notifier)(
                    widget._tableControl.value!);
              } else {
                widget._tableControl.markAsTouched();
              }
            },
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass))
      ],
    );
  }
}
