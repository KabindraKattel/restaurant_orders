import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/input_field.dart';
import 'package:restaurant_orders/core/widgets/loading.dart';
import 'package:restaurant_orders/core/widgets/my_error.dart';
import 'package:restaurant_orders/core/widgets/no_data_found.dart';
import 'package:restaurant_orders/pages/menu/widgets/menu_bottom_bar.dart';
import 'package:restaurant_orders/pages/menu/widgets/menu_items_screen.dart';
import 'package:restaurant_orders/state_management/menu/menu_items/menu_items_provider.dart';

class SearchableMenuPage extends ConsumerStatefulWidget {
  final FormControl<String> _control =
      FormControl(validators: [Validators.required]);
  SearchableMenuPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchableMenuPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends ConsumerState<SearchableMenuPage> {
  Future<void> _initSearch(WidgetRef ref) {
    return ref
        .read(menuItemsByIdNotifierProvider.notifier)(widget._control.value!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            StringConstants.kMenu,
          ),
        ),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(SpacingConstants.kS8),
              child: Column(
                children: [
                  _buildSearchBar(ref),
                  Expanded(
                    child: Center(
                      child: Consumer(builder: (_, ref, __) {
                        final state = ref.watch(menuItemsByIdNotifierProvider);
                        return state.when(
                            initial: () => const NoDataFound(
                                  message:
                                      MessageConstants.kNoSearchTermEntered,
                                ),
                            loading: () => const Loading(),
                            data: (data) {
                              return RefreshIndicator(
                                onRefresh: () async => _initSearch(ref),
                                child: MenuItemsScreen(
                                  model: data,
                                  // orderModel: orderModel,
                                ),
                              );
                            },
                            error: (failure, onRetry) => MyErrorWidget(
                                  failure: failure,
                                  onRetry: onRetry,
                                ));
                      }),
                    ),
                  ),
                  const MenuBottomBar(),
                ],
              )),
        ));
  }

  Widget _buildSearchBar(WidgetRef ref) {
    return Row(
      children: [
        Expanded(
            child: InputField(
                labelText: StringConstants.kItemNumber,
                hintText: 'Example: 101',
                formControl: widget._control)),
        IconButton(
            onPressed: () {
              if (widget._control.valid) {
                widget._control.unfocus();
                _initSearch(ref);
              } else {
                widget._control.markAsTouched();
              }
            },
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass))
      ],
    );
  }
}
