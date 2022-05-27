// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'menu_items_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MenuItemsStateTearOff {
  const _$MenuItemsStateTearOff();

  MenuItemsLoading loading() {
    return const MenuItemsLoading();
  }

  MenuItemsData data({required List<MenuItemModel> menuItems}) {
    return MenuItemsData(
      menuItems: menuItems,
    );
  }

  MenuItemsError error(Failure failure, Future<void> Function()? onRetry) {
    return MenuItemsError(
      failure,
      onRetry,
    );
  }
}

/// @nodoc
const $MenuItemsState = _$MenuItemsStateTearOff();

/// @nodoc
mixin _$MenuItemsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<MenuItemModel> menuItems) data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MenuItemModel> menuItems)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MenuItemModel> menuItems)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MenuItemsLoading value) loading,
    required TResult Function(MenuItemsData value) data,
    required TResult Function(MenuItemsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MenuItemsLoading value)? loading,
    TResult Function(MenuItemsData value)? data,
    TResult Function(MenuItemsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MenuItemsLoading value)? loading,
    TResult Function(MenuItemsData value)? data,
    TResult Function(MenuItemsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemsStateCopyWith<$Res> {
  factory $MenuItemsStateCopyWith(
          MenuItemsState value, $Res Function(MenuItemsState) then) =
      _$MenuItemsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MenuItemsStateCopyWithImpl<$Res>
    implements $MenuItemsStateCopyWith<$Res> {
  _$MenuItemsStateCopyWithImpl(this._value, this._then);

  final MenuItemsState _value;
  // ignore: unused_field
  final $Res Function(MenuItemsState) _then;
}

/// @nodoc
abstract class $MenuItemsLoadingCopyWith<$Res> {
  factory $MenuItemsLoadingCopyWith(
          MenuItemsLoading value, $Res Function(MenuItemsLoading) then) =
      _$MenuItemsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$MenuItemsLoadingCopyWithImpl<$Res>
    extends _$MenuItemsStateCopyWithImpl<$Res>
    implements $MenuItemsLoadingCopyWith<$Res> {
  _$MenuItemsLoadingCopyWithImpl(
      MenuItemsLoading _value, $Res Function(MenuItemsLoading) _then)
      : super(_value, (v) => _then(v as MenuItemsLoading));

  @override
  MenuItemsLoading get _value => super._value as MenuItemsLoading;
}

/// @nodoc

class _$MenuItemsLoading implements MenuItemsLoading {
  const _$MenuItemsLoading();

  @override
  String toString() {
    return 'MenuItemsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MenuItemsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<MenuItemModel> menuItems) data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MenuItemModel> menuItems)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MenuItemModel> menuItems)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MenuItemsLoading value) loading,
    required TResult Function(MenuItemsData value) data,
    required TResult Function(MenuItemsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MenuItemsLoading value)? loading,
    TResult Function(MenuItemsData value)? data,
    TResult Function(MenuItemsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MenuItemsLoading value)? loading,
    TResult Function(MenuItemsData value)? data,
    TResult Function(MenuItemsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MenuItemsLoading implements MenuItemsState {
  const factory MenuItemsLoading() = _$MenuItemsLoading;
}

/// @nodoc
abstract class $MenuItemsDataCopyWith<$Res> {
  factory $MenuItemsDataCopyWith(
          MenuItemsData value, $Res Function(MenuItemsData) then) =
      _$MenuItemsDataCopyWithImpl<$Res>;
  $Res call({List<MenuItemModel> menuItems});
}

/// @nodoc
class _$MenuItemsDataCopyWithImpl<$Res>
    extends _$MenuItemsStateCopyWithImpl<$Res>
    implements $MenuItemsDataCopyWith<$Res> {
  _$MenuItemsDataCopyWithImpl(
      MenuItemsData _value, $Res Function(MenuItemsData) _then)
      : super(_value, (v) => _then(v as MenuItemsData));

  @override
  MenuItemsData get _value => super._value as MenuItemsData;

  @override
  $Res call({
    Object? menuItems = freezed,
  }) {
    return _then(MenuItemsData(
      menuItems: menuItems == freezed
          ? _value.menuItems
          : menuItems // ignore: cast_nullable_to_non_nullable
              as List<MenuItemModel>,
    ));
  }
}

/// @nodoc

class _$MenuItemsData implements MenuItemsData {
  const _$MenuItemsData({required this.menuItems});

  @override
  final List<MenuItemModel> menuItems;

  @override
  String toString() {
    return 'MenuItemsState.data(menuItems: $menuItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MenuItemsData &&
            const DeepCollectionEquality().equals(other.menuItems, menuItems));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(menuItems));

  @JsonKey(ignore: true)
  @override
  $MenuItemsDataCopyWith<MenuItemsData> get copyWith =>
      _$MenuItemsDataCopyWithImpl<MenuItemsData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<MenuItemModel> menuItems) data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return data(menuItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MenuItemModel> menuItems)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return data?.call(menuItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MenuItemModel> menuItems)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(menuItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MenuItemsLoading value) loading,
    required TResult Function(MenuItemsData value) data,
    required TResult Function(MenuItemsError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MenuItemsLoading value)? loading,
    TResult Function(MenuItemsData value)? data,
    TResult Function(MenuItemsError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MenuItemsLoading value)? loading,
    TResult Function(MenuItemsData value)? data,
    TResult Function(MenuItemsError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class MenuItemsData implements MenuItemsState {
  const factory MenuItemsData({required List<MenuItemModel> menuItems}) =
      _$MenuItemsData;

  List<MenuItemModel> get menuItems;
  @JsonKey(ignore: true)
  $MenuItemsDataCopyWith<MenuItemsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemsErrorCopyWith<$Res> {
  factory $MenuItemsErrorCopyWith(
          MenuItemsError value, $Res Function(MenuItemsError) then) =
      _$MenuItemsErrorCopyWithImpl<$Res>;
  $Res call({Failure failure, Future<void> Function()? onRetry});
}

/// @nodoc
class _$MenuItemsErrorCopyWithImpl<$Res>
    extends _$MenuItemsStateCopyWithImpl<$Res>
    implements $MenuItemsErrorCopyWith<$Res> {
  _$MenuItemsErrorCopyWithImpl(
      MenuItemsError _value, $Res Function(MenuItemsError) _then)
      : super(_value, (v) => _then(v as MenuItemsError));

  @override
  MenuItemsError get _value => super._value as MenuItemsError;

  @override
  $Res call({
    Object? failure = freezed,
    Object? onRetry = freezed,
  }) {
    return _then(MenuItemsError(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
      onRetry == freezed
          ? _value.onRetry
          : onRetry // ignore: cast_nullable_to_non_nullable
              as Future<void> Function()?,
    ));
  }
}

/// @nodoc

class _$MenuItemsError implements MenuItemsError {
  const _$MenuItemsError(this.failure, this.onRetry);

  @override
  final Failure failure;
  @override
  final Future<void> Function()? onRetry;

  @override
  String toString() {
    return 'MenuItemsState.error(failure: $failure, onRetry: $onRetry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MenuItemsError &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            (identical(other.onRetry, onRetry) || other.onRetry == onRetry));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failure), onRetry);

  @JsonKey(ignore: true)
  @override
  $MenuItemsErrorCopyWith<MenuItemsError> get copyWith =>
      _$MenuItemsErrorCopyWithImpl<MenuItemsError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<MenuItemModel> menuItems) data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return error(failure, onRetry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MenuItemModel> menuItems)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return error?.call(failure, onRetry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MenuItemModel> menuItems)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure, onRetry);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MenuItemsLoading value) loading,
    required TResult Function(MenuItemsData value) data,
    required TResult Function(MenuItemsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MenuItemsLoading value)? loading,
    TResult Function(MenuItemsData value)? data,
    TResult Function(MenuItemsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MenuItemsLoading value)? loading,
    TResult Function(MenuItemsData value)? data,
    TResult Function(MenuItemsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MenuItemsError implements MenuItemsState {
  const factory MenuItemsError(
      Failure failure, Future<void> Function()? onRetry) = _$MenuItemsError;

  Failure get failure;
  Future<void> Function()? get onRetry;
  @JsonKey(ignore: true)
  $MenuItemsErrorCopyWith<MenuItemsError> get copyWith =>
      throw _privateConstructorUsedError;
}
