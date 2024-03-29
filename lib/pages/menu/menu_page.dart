import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/loading.dart';
import 'package:restaurant_orders/core/widgets/my_error.dart';
import 'package:restaurant_orders/pages/menu/widgets/menu_bottom_bar.dart';
import 'package:restaurant_orders/pages/menu/widgets/menu_screen.dart';
import 'package:restaurant_orders/state_management/menu/menu_groups/menu_groups_provider.dart';

class MenuPage extends ConsumerWidget {
  final String? menuTab;
  const MenuPage({
    Key? key,
    this.menuTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          StringConstants.kMenu,
        ),
        actions: [
          IconButton(
              onPressed: () async => ref.refresh(menuGroupsNotifierProvider),
              icon: const FaIcon(FontAwesomeIcons.arrowsRotate))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final state = ref.watch(menuGroupsNotifierProvider);
                  return state.when(
                      loading: () => const Loading(),
                      data: (model) => MenuScreen(
                            menuTab: menuTab,
                            menuGroupModel: model,
                          ),
                      error: (failure, onRetry) => MyErrorWidget(
                            failure: failure,
                            onRetry: onRetry,
                          ));
                },
              ),
            ),
            const MenuBottomBar(),
          ],
        ),
      ),
    );
  }
}
