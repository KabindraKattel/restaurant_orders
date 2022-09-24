import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:restaurant_orders/core/extensions/color_extension.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/confirmation_alert_dialog.dart';
import 'package:restaurant_orders/core/widgets/model_paged_list_view.dart';
import 'package:restaurant_orders/core/widgets/radio_button_group_field.dart';
import 'package:restaurant_orders/models/local_table_model.dart';

class LocalTableSetupScreen extends StatelessWidget {
  final List<LocalTableModel> model;
  final void Function(LocalTableModel item)? onCreate;
  final void Function(LocalTableModel item, bool checked)? onTileChecked;
  final void Function()? onTileChanged;
  const LocalTableSetupScreen({
    Key? key,
    required this.model,
    this.onCreate,
    this.onTileChecked,
    this.onTileChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModelPagedListView<LocalTableModel>(
        padding: const EdgeInsets.all(SpacingConstants.kS8),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(
              right: SpacingConstants.kS4,
              left: SpacingConstants.kS4,
              bottom: SpacingConstants.kS4),
          child: FloatingActionButton.small(
            onPressed: () {
              _onCreate(context);
            },
            child: const FaIcon(FontAwesomeIcons.plus),
          ),
        ),
        items: model,
        pageSize: 20,
        noDataFoundMessage: MessageConstants.kNoTablesSetup,
        itemBuilder: (context, item, index) {
          final control = FormControl<bool>(value: false);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: SpacingConstants.kS4),
            child: Card(
              key: ObjectKey(item),
              elevation: SpacingConstants.kS4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SpacingConstants.kS8)),
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                trailing: ReactiveCheckbox(
                  formControl: control,
                  onChanged: (control) {
                    onTileChecked?.call(item, control.value ?? false);
                  },
                ),
                title: Text(
                  '${StringConstants.kTableNumber.toUpperCase()}: ${item.tableId}',
                  style: const TextStyle(
                    fontSize: StylesConstants.kSubTitleSize,
                    fontWeight: StylesConstants.kSubTitleWeight,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                minLeadingWidth: SpacingConstants.kS8,
                leading: Container(
                  width: SpacingConstants.kS12,
                  color: item.active
                      ? ColorConstants.kSuccess
                      : ColorConstants.kErrorRed,
                ),
              ),
            ),
          );
        },
        slidableItemBuilder: (context, item, index, child) {
          return Slidable(
            endActionPane: ActionPane(
              dragDismissible: true,
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  spacing: SpacingConstants.kS8,
                  backgroundColor: ColorConstants.kEdit,
                  foregroundColor: ColorConstants.kEdit.getForegroundColor(),
                  autoClose: true,
                  onPressed: (context) {
                    _onUpdate(context, item);
                  },
                  icon: Icons.swap_vert,
                ),
                SlidableAction(
                  spacing: SpacingConstants.kS8,
                  backgroundColor: ColorConstants.kErrorRed,
                  foregroundColor:
                      ColorConstants.kErrorRed.getForegroundColor(),
                  autoClose: true,
                  onPressed: (context) {
                    _onDelete(context, item);
                  },
                  icon: FontAwesomeIcons.trash,
                ),
              ],
            ),
            child: child,
          );
        });
  }

  void _onCreate(BuildContext context) async {
    final returnVal = await showDialog<bool>(
        context: context,
        builder: (context) {
          final tableNumControl =
              FormControl<String>(validators: [Validators.required]);
          final activeControl =
              FormControl(value: true, validators: [Validators.required]);

          return Center(
            child: SingleChildScrollView(
              child: ConfirmationAlertDialog(
                  isDanger: false,
                  title: StringConstants.kTableNumberSetup.toUpperCase(),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ReactiveTextField<String>(
                        toolbarOptions: const ToolbarOptions(
                          copy: true,
                          paste: true,
                          cut: true,
                          selectAll: true,
                        ),
                        decoration: const InputDecoration(
                            isDense: true,
                            labelText: '${StringConstants.kTableNumber} *',
                            border: OutlineInputBorder(),
                            contentPadding:
                                EdgeInsets.all(SpacingConstants.kS16),
                            errorStyle: TextStyle(
                              color: ColorConstants.kErrorRed,
                            )),
                        formControl: tableNumControl,
                        keyboardType: TextInputType.url,
                      ),
                      const SizedBox(height: SpacingConstants.kS16),
                      RadioButtonGroupField<bool, bool>(
                          formControl: activeControl,
                          children: const {true: true, false: false},
                          selectedItemColorBuilder: (selected) => selected
                              ? ColorConstants.kSuccess
                              : ColorConstants.kErrorRed,
                          radioItemBuilder: (selected, color) {
                            return Padding(
                              padding:
                                  const EdgeInsets.all(SpacingConstants.kS8),
                              child: Text(
                                selected
                                    ? StringConstants.kShow
                                    : StringConstants.kHide,
                                style: TextStyle(color: color),
                              ),
                            );
                          }),
                    ],
                  ),
                  onContinue: () async {
                    if (tableNumControl.valid && activeControl.valid) {
                      var localTableModel = LocalTableModel(
                          tableNumControl.value!, activeControl.value ?? false);
                      onCreate?.call(localTableModel);
                      return true;
                    } else {
                      tableNumControl.markAsTouched();
                      activeControl.markAsTouched();
                      return false;
                    }
                  }),
            ),
          );
        });
    if (returnVal == true) {
      onTileChanged?.call();
    }
  }

  void _onDelete(BuildContext context, LocalTableModel model) async {
    final returnVal = await showDialog<bool>(
        barrierColor: ColorConstants.kErrorRed.withOpacity(0.5),
        context: context,
        builder: (context) {
          return Center(
            child: ConfirmationAlertDialog(
                content: Text(
                    'This action removes ${StringConstants.kTableNumber.toUpperCase()}: ${model.tableId} from the list.\n\n Do you want to continue ?'),
                onContinue: () async {
                  await model.delete();
                  return true;
                }),
          );
        });
    if (returnVal == true) {
      onTileChanged?.call();
    }
  }

  Future<dynamic> _onUpdate(BuildContext context, LocalTableModel model) async {
    final returnVal = await showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: ConfirmationAlertDialog(
                isDanger: false,
                content: const Text(
                    'This action changes status.\n\n Do you want to continue ?'),
                onContinue: () async {
                  await (model..active = !model.active).save();
                  return true;
                }),
          );
        });
  }
}
