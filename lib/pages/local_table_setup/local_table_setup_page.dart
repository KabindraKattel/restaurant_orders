import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restaurant_orders/core/extensions/color_extension.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/confirmation_alert_dialog.dart';
import 'package:restaurant_orders/core/widgets/no_data_found.dart';
import 'package:restaurant_orders/models/local_table_model.dart';
import 'package:restaurant_orders/pages/local_table_setup/widgets/local_table_setup_screen.dart';

class LocalTableSetupPage extends StatefulWidget {
  const LocalTableSetupPage({Key? key}) : super(key: key);

  @override
  State<LocalTableSetupPage> createState() => _LocalTableSetupPageState();
}

class _LocalTableSetupPageState extends State<LocalTableSetupPage> {
  final ValueNotifier<Set<String>> deleteables = ValueNotifier(<String>{});
  Box<LocalTableModel>? _box;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _initDb();
    });
  }

  Future<void> _initDb() async {
    _box = await Hive.openBox<LocalTableModel>(
        CacheManager.kLocalTablesSetupCache);
    setState(() {});
  }

  @override
  void dispose() async {
    // await _box?.close();
    deleteables.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.kTableNumberSetup),
        actions: [
          ValueListenableBuilder<Set<String>>(
              valueListenable: deleteables,
              builder: (context, deletables, _) {
                return IconButton(
                    onPressed: () => _onDelete(context, deletables.toList()),
                    icon: Badge(
                        badgeColor: ColorConstants.kErrorRed,
                        badgeContent: ConstrainedBox(
                          constraints: const BoxConstraints(
                              maxWidth: SpacingConstants.kS24,
                              maxHeight: SpacingConstants.kS24),
                          child: AutoSizeText(
                            deletables.isEmpty
                                ? 'All'
                                : (deleteables.value.length > 99)
                                    ? '99+'
                                    : deleteables.value.length.toString(),
                            style: TextStyle(
                                color: ColorConstants.kErrorRed
                                    .getForegroundColor(),
                                fontWeight: StylesConstants.kTitleWeight,
                                fontSize: StylesConstants.kCaptionSize),
                          ),
                        ),
                        child: const FaIcon(FontAwesomeIcons.trash)));
              })
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: _box == null
          ? const NoDataFound(
              message: MessageConstants.kNoTablesSetup,
            )
          : ValueListenableBuilder<Box<LocalTableModel>>(
              valueListenable: _box!.listenable(),
              builder: (context, box, _) {
                final model = box.values.toList().cast<LocalTableModel>();
                return LocalTableSetupScreen(
                  model: model,
                  onCreate: (item) {
                    _box!.put(item.tableId, item);
                  },
                  onTileChanged: () {
                    deleteables.value = {};
                  },
                  onTileChecked: (item, checked) {
                    if (checked) {
                      deleteables.value = Set.from(deleteables.value)
                        ..add(item.tableId);
                    } else {
                      deleteables.value = Set.from(deleteables.value)
                        ..remove(item.tableId);
                    }
                  },
                );
              },
            ),
    );
  }

  void _onDelete(BuildContext context, [List<String> itemKeys = const []]) {
    showDialog(
        barrierColor: ColorConstants.kErrorRed.withOpacity(0.5),
        context: context,
        builder: (context) {
          return Center(
            child: ConfirmationAlertDialog(
                content: Text(
                    'This action removes ${itemKeys.isEmpty ? 'all' : 'selected'} ${StringConstants.kTableNumber.toUpperCase()} from the list.\n\n Do you want to continue ?'),
                onContinue: () async {
                  if (itemKeys.isEmpty) {
                    _onDeleteAll(context);
                  } else {
                    _onDeleteMultiple(context, itemKeys);
                  }
                  return true;
                }),
          );
        });
  }

  void _onDeleteMultiple(BuildContext context, List<String> itemKeys) async {
    await _box?.deleteAll(itemKeys);
    deleteables.value = {};
  }

  void _onDeleteAll(BuildContext context) async {
    await _box?.clear();
    deleteables.value = {};
  }
}
