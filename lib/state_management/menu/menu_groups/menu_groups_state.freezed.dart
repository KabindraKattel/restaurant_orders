// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'menu_groups_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MenuGroupsStateTearOff {
  const _$MenuGroupsStateTearOff();

  MenuGroupsLoading loading() {
    return const MenuGroupsLoading();
  }

  MenuGroupsData data({required List<MenuGroupModel> menuGroups}) {
    return MenuGroupsData(
      menuGroups: menuGroups,
    );
  }

  MenuGroupsError error(Failure failure, Future<void> Function()? onRetry) {
    return MenuGroupsError(
      failure,
      onRetry,
    );
  }
}

/// @nodoc
const $MenuGroupsState = _$MenuGroupsStateTearOff();

/// @nodoc
mixin _$MenuGroupsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<MenuGroupModel> menuGroups) data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MenuGroupModel> menuGroups)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MenuGroupModel> menuGroups)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MenuGroupsLoading value) loading,
    required TResult Function(MenuGroupsData value) data,
    required TResult Function(MenuGroupsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MenuGroupsLoading value)? loading,
    TResult Function(MenuGroupsData value)? data,
    TResult Function(MenuGroupsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MenuGroupsLoading value)? loading,
    TResult Function(MenuGroupsData value)? data,
    TResult Function(MenuGroupsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuGroupsStateCopyWith<$Res> {
  factory $MenuGroupsStateCopyWith(
          MenuGroupsState value, $Res Function(MenuGroupsState) then) =
      _$MenuGroupsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MenuGroupsStateCopyWithImpl<$Res>
    implements $MenuGroupsStateCopyWith<$Res> {
  _$MenuGroupsStateCopyWithImpl(this._value, this._then);

  final MenuGroupsState _value;
  // ignore: unused_field
  final $Res Function(MenuGroupsState) _then;
}

/// @nodoc
abstract class $MenuGroupsLoadingCopyWith<$Res> {
  factory $MenuGroupsLoadingCopyWith(
          MenuGroupsLoading value, $Res Function(MenuGroupsLoading) then) =
      _$MenuGroupsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$MenuGroupsLoadingCopyWithImpl<$Res>
    extends _$MenuGroupsStateCopyWithImpl<$Res>
    implements $MenuGroupsLoadingCopyWith<$Res> {
  _$MenuGroupsLoadingCopyWithImpl(
      MenuGroupsLoading _value, $Res Function(MenuGroupsLoading) _then)
      : super(_value, (v) => _then(v as MenuGroupsLoading));

  @override
  MenuGroupsLoading get _value => super._value as MenuGroupsLoading;
}

/// @nodoc

class _$MenuGroupsLoading implements MenuGroupsLoading {
  const _$MenuGroupsLoading();

  @override
  String toString() {
    return 'MenuGroupsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MenuGroupsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<MenuGroupModel> menuGroups) data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MenuGroupModel> menuGroups)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MenuGroupModel> menuGroups)? data,
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
    required TResult Function(MenuGroupsLoading value) loading,
    required TResult Function(MenuGroupsData value) data,
    required TResult Function(MenuGroupsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MenuGroupsLoading value)? loading,
    TResult Function(MenuGroupsData value)? data,
    TResult Function(MenuGroupsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MenuGroupsLoading value)? loading,
    TResult Function(MenuGroupsData value)? data,
    TResult Function(MenuGroupsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MenuGroupsLoading implements MenuGroupsState {
  const factory MenuGroupsLoading() = _$MenuGroupsLoading;
}

/// @nodoc
abstract class $MenuGroupsDataCopyWith<$Res> {
  factory $MenuGroupsDataCopyWith(
          MenuGroupsData value, $Res Function(MenuGroupsData) then) =
      _$MenuGroupsDataCopyWithImpl<$Res>;
  $Res call({List<MenuGroupModel> menuGroups});
}

/// @nodoc
class _$MenuGroupsDataCopyWithImpl<$Res>
    extends _$MenuGroupsStateCopyWithImpl<$Res>
    implements $MenuGroupsDataCopyWith<$Res> {
  _$MenuGroupsDataCopyWithImpl(
      MenuGroupsData _value, $Res Function(MenuGroupsData) _then)
      : super(_value, (v) => _then(v as MenuGroupsData));

  @override
  MenuGroupsData get _value => super._value as MenuGroupsData;

  @override
  $Res call({
    Object? menuGroups = freezed,
  }) {
    return _then(MenuGroupsData(
      menuGroups: menuGroups == freezed
          ? _value.menuGroups
          : menuGroups // ignore: cast_nullable_to_non_nullable
              as List<MenuGroupModel>,
    ));
  }
}

/// @nodoc

class _$MenuGroupsData implements MenuGroupsData {
  const _$MenuGroupsData({required this.menuGroups});

  @override
  final List<MenuGroupModel> menuGroups;

  @override
  String toString() {
    return 'MenuGroupsState.data(menuGroups: $menuGroups)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MenuGroupsData &&
            const DeepCollectionEquality()
                .equals(other.menuGroups, menuGroups));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(menuGroups));

  @JsonKey(ignore: true)
  @override
  $MenuGroupsDataCopyWith<MenuGroupsData> get copyWith =>
      _$MenuGroupsDataCopyWithImpl<MenuGroupsData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<MenuGroupModel> menuGroups) data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return data(menuGroups);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MenuGroupModel> menuGroups)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return data?.call(menuGroups);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MenuGroupModel> menuGroups)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(menuGroups);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MenuGroupsLoading value) loading,
    required TResult Function(MenuGroupsData value) data,
    required TResult Function(MenuGroupsError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MenuGroupsLoading value)? loading,
    TResult Function(MenuGroupsData value)? data,
    TResult Function(MenuGroupsError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MenuGroupsLoading value)? loading,
    TResult Function(MenuGroupsData value)? data,
    TResult Function(MenuGroupsError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class MenuGroupsData implements MenuGroupsState {
  const factory MenuGroupsData({required List<MenuGroupModel> menuGroups}) =
      _$MenuGroupsData;

  List<MenuGroupModel> get menuGroups;
  @JsonKey(ignore: true)
  $MenuGroupsDataCopyWith<MenuGroupsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuGroupsErrorCopyWith<$Res> {
  factory $MenuGroupsErrorCopyWith(
          MenuGroupsError value, $Res Function(MenuGroupsError) then) =
      _$MenuGroupsErrorCopyWithImpl<$Res>;
  $Res call({Failure failure, Future<void> Function()? onRetry});
}

/// @nodoc
class _$MenuGroupsErrorCopyWithImpl<$Res>
    extends _$MenuGroupsStateCopyWithImpl<$Res>
    implements $MenuGroupsErrorCopyWith<$Res> {
  _$MenuGroupsErrorCopyWithImpl(
      MenuGroupsError _value, $Res Function(MenuGroupsError) _then)
      : super(_value, (v) => _then(v as MenuGroupsError));

  @override
  MenuGroupsError get _value => super._value as MenuGroupsError;

  @override
  $Res call({
    Object? failure = freezed,
    Object? onRetry = freezed,
  }) {
    return _then(MenuGroupsError(
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

class _$MenuGroupsError implements MenuGroupsError {
  const _$MenuGroupsError(this.failure, this.onRetry);

  @override
  final Failure failure;
  @override
  final Future<void> Function()? onRetry;

  @override
  String toString() {
    return 'MenuGroupsState.error(failure: $failure, onRetry: $onRetry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MenuGroupsError &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            (identical(other.onRetry, onRetry) || other.onRetry == onRetry));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failure), onRetry);

  @JsonKey(ignore: true)
  @override
  $MenuGroupsErrorCopyWith<MenuGroupsError> get copyWith =>
      _$MenuGroupsErrorCopyWithImpl<MenuGroupsError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<MenuGroupModel> menuGroups) data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return error(failure, onRetry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MenuGroupModel> menuGroups)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return error?.call(failure, onRetry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<MenuGroupModel> menuGroups)? data,
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
    required TResult Function(MenuGroupsLoading value) loading,
    required TResult Function(MenuGroupsData value) data,
    required TResult Function(MenuGroupsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MenuGroupsLoading value)? loading,
    TResult Function(MenuGroupsData value)? data,
    TResult Function(MenuGroupsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MenuGroupsLoading value)? loading,
    TResult Function(MenuGroupsData value)? data,
    TResult Function(MenuGroupsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MenuGroupsError implements MenuGroupsState {
  const factory MenuGroupsError(
      Failure failure, Future<void> Function()? onRetry) = _$MenuGroupsError;

  Failure get failure;
  Future<void> Function()? get onRetry;
  @JsonKey(ignore: true)
  $MenuGroupsErrorCopyWith<MenuGroupsError> get copyWith =>
      throw _privateConstructorUsedError;
}
