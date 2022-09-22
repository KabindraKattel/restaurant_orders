// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'update_order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UpdateOrderStateTearOff {
  const _$UpdateOrderStateTearOff();

  UpdateOrderItemsSelection select(String? menuTab) {
    return UpdateOrderItemsSelection(
      menuTab,
    );
  }

  UpdateOrderItemsConfirm confirm() {
    return const UpdateOrderItemsConfirm();
  }
}

/// @nodoc
const $UpdateOrderState = _$UpdateOrderStateTearOff();

/// @nodoc
mixin _$UpdateOrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? menuTab) select,
    required TResult Function() confirm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? menuTab)? select,
    TResult Function()? confirm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? menuTab)? select,
    TResult Function()? confirm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateOrderItemsSelection value) select,
    required TResult Function(UpdateOrderItemsConfirm value) confirm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UpdateOrderItemsSelection value)? select,
    TResult Function(UpdateOrderItemsConfirm value)? confirm,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateOrderItemsSelection value)? select,
    TResult Function(UpdateOrderItemsConfirm value)? confirm,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateOrderStateCopyWith<$Res> {
  factory $UpdateOrderStateCopyWith(
          UpdateOrderState value, $Res Function(UpdateOrderState) then) =
      _$UpdateOrderStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UpdateOrderStateCopyWithImpl<$Res>
    implements $UpdateOrderStateCopyWith<$Res> {
  _$UpdateOrderStateCopyWithImpl(this._value, this._then);

  final UpdateOrderState _value;
  // ignore: unused_field
  final $Res Function(UpdateOrderState) _then;
}

/// @nodoc
abstract class $UpdateOrderItemsSelectionCopyWith<$Res> {
  factory $UpdateOrderItemsSelectionCopyWith(UpdateOrderItemsSelection value,
          $Res Function(UpdateOrderItemsSelection) then) =
      _$UpdateOrderItemsSelectionCopyWithImpl<$Res>;
  $Res call({String? menuTab});
}

/// @nodoc
class _$UpdateOrderItemsSelectionCopyWithImpl<$Res>
    extends _$UpdateOrderStateCopyWithImpl<$Res>
    implements $UpdateOrderItemsSelectionCopyWith<$Res> {
  _$UpdateOrderItemsSelectionCopyWithImpl(UpdateOrderItemsSelection _value,
      $Res Function(UpdateOrderItemsSelection) _then)
      : super(_value, (v) => _then(v as UpdateOrderItemsSelection));

  @override
  UpdateOrderItemsSelection get _value =>
      super._value as UpdateOrderItemsSelection;

  @override
  $Res call({
    Object? menuTab = freezed,
  }) {
    return _then(UpdateOrderItemsSelection(
      menuTab == freezed
          ? _value.menuTab
          : menuTab // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateOrderItemsSelection implements UpdateOrderItemsSelection {
  const _$UpdateOrderItemsSelection(this.menuTab);

  @override
  final String? menuTab;

  @override
  String toString() {
    return 'UpdateOrderState.select(menuTab: $menuTab)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateOrderItemsSelection &&
            const DeepCollectionEquality().equals(other.menuTab, menuTab));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(menuTab));

  @JsonKey(ignore: true)
  @override
  $UpdateOrderItemsSelectionCopyWith<UpdateOrderItemsSelection> get copyWith =>
      _$UpdateOrderItemsSelectionCopyWithImpl<UpdateOrderItemsSelection>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? menuTab) select,
    required TResult Function() confirm,
  }) {
    return select(menuTab);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? menuTab)? select,
    TResult Function()? confirm,
  }) {
    return select?.call(menuTab);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? menuTab)? select,
    TResult Function()? confirm,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(menuTab);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateOrderItemsSelection value) select,
    required TResult Function(UpdateOrderItemsConfirm value) confirm,
  }) {
    return select(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UpdateOrderItemsSelection value)? select,
    TResult Function(UpdateOrderItemsConfirm value)? confirm,
  }) {
    return select?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateOrderItemsSelection value)? select,
    TResult Function(UpdateOrderItemsConfirm value)? confirm,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(this);
    }
    return orElse();
  }
}

abstract class UpdateOrderItemsSelection implements UpdateOrderState {
  const factory UpdateOrderItemsSelection(String? menuTab) =
      _$UpdateOrderItemsSelection;

  String? get menuTab;
  @JsonKey(ignore: true)
  $UpdateOrderItemsSelectionCopyWith<UpdateOrderItemsSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateOrderItemsConfirmCopyWith<$Res> {
  factory $UpdateOrderItemsConfirmCopyWith(UpdateOrderItemsConfirm value,
          $Res Function(UpdateOrderItemsConfirm) then) =
      _$UpdateOrderItemsConfirmCopyWithImpl<$Res>;
}

/// @nodoc
class _$UpdateOrderItemsConfirmCopyWithImpl<$Res>
    extends _$UpdateOrderStateCopyWithImpl<$Res>
    implements $UpdateOrderItemsConfirmCopyWith<$Res> {
  _$UpdateOrderItemsConfirmCopyWithImpl(UpdateOrderItemsConfirm _value,
      $Res Function(UpdateOrderItemsConfirm) _then)
      : super(_value, (v) => _then(v as UpdateOrderItemsConfirm));

  @override
  UpdateOrderItemsConfirm get _value => super._value as UpdateOrderItemsConfirm;
}

/// @nodoc

class _$UpdateOrderItemsConfirm implements UpdateOrderItemsConfirm {
  const _$UpdateOrderItemsConfirm();

  @override
  String toString() {
    return 'UpdateOrderState.confirm()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UpdateOrderItemsConfirm);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? menuTab) select,
    required TResult Function() confirm,
  }) {
    return confirm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? menuTab)? select,
    TResult Function()? confirm,
  }) {
    return confirm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? menuTab)? select,
    TResult Function()? confirm,
    required TResult orElse(),
  }) {
    if (confirm != null) {
      return confirm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateOrderItemsSelection value) select,
    required TResult Function(UpdateOrderItemsConfirm value) confirm,
  }) {
    return confirm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UpdateOrderItemsSelection value)? select,
    TResult Function(UpdateOrderItemsConfirm value)? confirm,
  }) {
    return confirm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateOrderItemsSelection value)? select,
    TResult Function(UpdateOrderItemsConfirm value)? confirm,
    required TResult orElse(),
  }) {
    if (confirm != null) {
      return confirm(this);
    }
    return orElse();
  }
}

abstract class UpdateOrderItemsConfirm implements UpdateOrderState {
  const factory UpdateOrderItemsConfirm() = _$UpdateOrderItemsConfirm;
}
