import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:restaurant_orders/core/extensions/string_extensions.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/no_data_found.dart';
import 'package:restaurant_orders/models/local_table_model.dart';
import 'package:restaurant_orders/pages/local_table_setup/local_table_setup_page.dart';

class LocalTableDropdownSearchScreen extends StatefulWidget {
  final FormControl<String> formControl;
  final void Function(FormControl<String> control)? onChanged;
  const LocalTableDropdownSearchScreen(
      {Key? key, required this.formControl, this.onChanged})
      : super(key: key);

  @override
  State<LocalTableDropdownSearchScreen> createState() =>
      _LocalTableDropdownSearchScreenState();
}

class _LocalTableDropdownSearchScreenState
    extends State<LocalTableDropdownSearchScreen> {
  Box<LocalTableModel>? _box;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _initDb();
      widget.formControl.valueChanges.listen((event) {
        if (widget.formControl.valid) {
          widget.onChanged?.call(widget.formControl);
        }
      });
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _box == null
        ? _buildReactiveDropdownSearch(context, [])
        : ValueListenableBuilder<Box<LocalTableModel>>(
            valueListenable: _box!.listenable(),
            builder: (_, box, __) {
              return _buildReactiveDropdownSearch(context,
                  box.values.where((element) => element.active).toList());
            },
          );
  }

  Widget _buildReactiveDropdownSearch(
      BuildContext context, List<LocalTableModel> items) {
    return ReactiveDropdownSearch<String, String>(
        formControl: widget.formControl,
        dropdownBuilder: (context, value) => AutoSizeText(
              value?.tryPrepend('${StringConstants.kTableNumber}:\n') ??
                  '${StringConstants.kSelectTable} *',
              strutStyle: const StrutStyle(height: 1.5),
              maxLines: 100,
              style: const TextStyle(
                  fontSize: StylesConstants.kCaptionSize,
                  fontWeight: StylesConstants.kSubTitleWeight),
            ),
        showClearButton: true,
        clearButtonProps: const ClearButtonProps(
          icon: SizedBox(),
          isVisible: false,
        ),
        dropdownButtonProps: const DropdownButtonProps(
          icon: Icon(
            Icons.arrow_drop_down_circle_outlined,
          ),
        ),
        dropdownDecoratorProps: const DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: ColorConstants.kWhite,
            // labelText: '${StringConstants.kSelectTable}*',
            labelStyle: TextStyle(
                color: ColorConstants.kBlack,
                fontSize: StylesConstants.kCaptionSize,
                fontWeight: StylesConstants.kTitleWeight),
            contentPadding: EdgeInsets.symmetric(
                horizontal: SpacingConstants.kS8,
                vertical: SpacingConstants.kS0),
            border: OutlineInputBorder(
                gapPadding: SpacingConstants.kS0,
                borderRadius: BorderRadius.horizontal(
                    left: RadiusConstants.kR8, right: RadiusConstants.kR8)),
          ),
        ),
        popupProps: PopupProps.modalBottomSheet(
          modalBottomSheetProps: const ModalBottomSheetProps(
              enableDrag: false, barrierDismissible: false),
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height),
          emptyBuilder: (_, __) => NoDataFound(
            message: MessageConstants.kNoTablesSetup,
            child: ElevatedButton.icon(
                icon: const FaIcon(FontAwesomeIcons.couch),
                label: const Text(StringConstants.kTableNumberSetup),
                onPressed: () {
                  _onTableSetup(context);
                }),
          ),
          title: AppBar(
            elevation: 0,
            title: const Text(StringConstants.kSelectTable),
            actions: [
              IconButton(
                  onPressed: () => _onTableSetup(context),
                  icon: const FaIcon(FontAwesomeIcons.couch))
            ],
          ),
          searchFieldProps: const TextFieldProps(
              decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Search...',
                  border: OutlineInputBorder())),
          showSearchBox: true,
          showSelectedItems: true,
        ),
        items: items.map((e) => e.tableId).toList());
  }

  void _onTableSetup(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const LocalTableSetupPage()),
    );
  }
}
