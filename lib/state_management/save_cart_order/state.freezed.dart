// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SaveCartOrderStateTearOff {
  const _$SaveCartOrderStateTearOff();

  SaveCartOrderInitial initial() {
    return const SaveCartOrderInitial();
  }

  SaveCartOrderLoading loading() {
    return const SaveCartOrderLoading();
  }

  SaveCartOrderSuccess success(String? tableNum) {
    return SaveCartOrderSuccess(
      tableNum,
    );
  }

  SaveCartOrderError error(Failure failure, Future<void> Function()? onRetry) {
    return SaveCartOrderError(
      failure,
      onRetry,
    );
  }
}

/// @nodoc
const $SaveCartOrderState = _$SaveCartOrderStateTearOff();

/// @nodoc
mixin _$SaveCartOrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? tableNum) success,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? tableNum)? success,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? tableNum)? success,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveCartOrderInitial value) initial,
    required TResult Function(SaveCartOrderLoading value) loading,
    required TResult Function(SaveCartOrderSuccess value) success,
    required TResult Function(SaveCartOrderError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SaveCartOrderInitial value)? initial,
    TResult Function(SaveCartOrderLoading value)? loading,
    TResult Function(SaveCartOrderSuccess value)? success,
    TResult Function(SaveCartOrderError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveCartOrderInitial value)? initial,
    TResult Function(SaveCartOrderLoading value)? loading,
    TResult Function(SaveCartOrderSuccess value)? success,
    TResult Function(SaveCartOrderError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveCartOrderStateCopyWith<$Res> {
  factory $SaveCartOrderStateCopyWith(
          SaveCartOrderState value, $Res Function(SaveCartOrderState) then) =
      _$SaveCartOrderStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SaveCartOrderStateCopyWithImpl<$Res>
    implements $SaveCartOrderStateCopyWith<$Res> {
  _$SaveCartOrderStateCopyWithImpl(this._value, this._then);

  final SaveCartOrderState _value;
  // ignore: unused_field
  final $Res Function(SaveCartOrderState) _then;
}

/// @nodoc
abstract class $SaveCartOrderInitialCopyWith<$Res> {
  factory $SaveCartOrderInitialCopyWith(SaveCartOrderInitial value,
          $Res Function(SaveCartOrderInitial) then) =
      _$SaveCartOrderInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$SaveCartOrderInitialCopyWithImpl<$Res>
    extends _$SaveCartOrderStateCopyWithImpl<$Res>
    implements $SaveCartOrderInitialCopyWith<$Res> {
  _$SaveCartOrderInitialCopyWithImpl(
      SaveCartOrderInitial _value, $Res Function(SaveCartOrderInitial) _then)
      : super(_value, (v) => _then(v as SaveCartOrderInitial));

  @override
  SaveCartOrderInitial get _value => super._value as SaveCartOrderInitial;
}

/// @nodoc

class _$SaveCartOrderInitial implements SaveCartOrderInitial {
  const _$SaveCartOrderInitial();

  @override
  String toString() {
    return 'SaveCartOrderState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SaveCartOrderInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? tableNum) success,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? tableNum)? success,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? tableNum)? success,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveCartOrderInitial value) initial,
    required TResult Function(SaveCartOrderLoading value) loading,
    required TResult Function(SaveCartOrderSuccess value) success,
    required TResult Function(SaveCartOrderError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SaveCartOrderInitial value)? initial,
    TResult Function(SaveCartOrderLoading value)? loading,
    TResult Function(SaveCartOrderSuccess value)? success,
    TResult Function(SaveCartOrderError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveCartOrderInitial value)? initial,
    TResult Function(SaveCartOrderLoading value)? loading,
    TResult Function(SaveCartOrderSuccess value)? success,
    TResult Function(SaveCartOrderError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SaveCartOrderInitial implements SaveCartOrderState {
  const factory SaveCartOrderInitial() = _$SaveCartOrderInitial;
}

/// @nodoc
abstract class $SaveCartOrderLoadingCopyWith<$Res> {
  factory $SaveCartOrderLoadingCopyWith(SaveCartOrderLoading value,
          $Res Function(SaveCartOrderLoading) then) =
      _$SaveCartOrderLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$SaveCartOrderLoadingCopyWithImpl<$Res>
    extends _$SaveCartOrderStateCopyWithImpl<$Res>
    implements $SaveCartOrderLoadingCopyWith<$Res> {
  _$SaveCartOrderLoadingCopyWithImpl(
      SaveCartOrderLoading _value, $Res Function(SaveCartOrderLoading) _then)
      : super(_value, (v) => _then(v as SaveCartOrderLoading));

  @override
  SaveCartOrderLoading get _value => super._value as SaveCartOrderLoading;
}

/// @nodoc

class _$SaveCartOrderLoading implements SaveCartOrderLoading {
  const _$SaveCartOrderLoading();

  @override
  String toString() {
    return 'SaveCartOrderState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SaveCartOrderLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? tableNum) success,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? tableNum)? success,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? tableNum)? success,
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
    required TResult Function(SaveCartOrderInitial value) initial,
    required TResult Function(SaveCartOrderLoading value) loading,
    required TResult Function(SaveCartOrderSuccess value) success,
    required TResult Function(SaveCartOrderError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SaveCartOrderInitial value)? initial,
    TResult Function(SaveCartOrderLoading value)? loading,
    TResult Function(SaveCartOrderSuccess value)? success,
    TResult Function(SaveCartOrderError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveCartOrderInitial value)? initial,
    TResult Function(SaveCartOrderLoading value)? loading,
    TResult Function(SaveCartOrderSuccess value)? success,
    TResult Function(SaveCartOrderError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SaveCartOrderLoading implements SaveCartOrderState {
  const factory SaveCartOrderLoading() = _$SaveCartOrderLoading;
}

/// @nodoc
abstract class $SaveCartOrderSuccessCopyWith<$Res> {
  factory $SaveCartOrderSuccessCopyWith(SaveCartOrderSuccess value,
          $Res Function(SaveCartOrderSuccess) then) =
      _$SaveCartOrderSuccessCopyWithImpl<$Res>;
  $Res call({String? tableNum});
}

/// @nodoc
class _$SaveCartOrderSuccessCopyWithImpl<$Res>
    extends _$SaveCartOrderStateCopyWithImpl<$Res>
    implements $SaveCartOrderSuccessCopyWith<$Res> {
  _$SaveCartOrderSuccessCopyWithImpl(
      SaveCartOrderSuccess _value, $Res Function(SaveCartOrderSuccess) _then)
      : super(_value, (v) => _then(v as SaveCartOrderSuccess));

  @override
  SaveCartOrderSuccess get _value => super._value as SaveCartOrderSuccess;

  @override
  $Res call({
    Object? tableNum = freezed,
  }) {
    return _then(SaveCartOrderSuccess(
      tableNum == freezed
          ? _value.tableNum
          : tableNum // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SaveCartOrderSuccess implements SaveCartOrderSuccess {
  const _$SaveCartOrderSuccess(this.tableNum);

  @override
  final String? tableNum;

  @override
  String toString() {
    return 'SaveCartOrderState.success(tableNum: $tableNum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SaveCartOrderSuccess &&
            const DeepCollectionEquality().equals(other.tableNum, tableNum));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(tableNum));

  @JsonKey(ignore: true)
  @override
  $SaveCartOrderSuccessCopyWith<SaveCartOrderSuccess> get copyWith =>
      _$SaveCartOrderSuccessCopyWithImpl<SaveCartOrderSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? tableNum) success,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return success(tableNum);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? tableNum)? success,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return success?.call(tableNum);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? tableNum)? success,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(tableNum);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveCartOrderInitial value) initial,
    required TResult Function(SaveCartOrderLoading value) loading,
    required TResult Function(SaveCartOrderSuccess value) success,
    required TResult Function(SaveCartOrderError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SaveCartOrderInitial value)? initial,
    TResult Function(SaveCartOrderLoading value)? loading,
    TResult Function(SaveCartOrderSuccess value)? success,
    TResult Function(SaveCartOrderError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveCartOrderInitial value)? initial,
    TResult Function(SaveCartOrderLoading value)? loading,
    TResult Function(SaveCartOrderSuccess value)? success,
    TResult Function(SaveCartOrderError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SaveCartOrderSuccess implements SaveCartOrderState {
  const factory SaveCartOrderSuccess(String? tableNum) = _$SaveCartOrderSuccess;

  String? get tableNum;
  @JsonKey(ignore: true)
  $SaveCartOrderSuccessCopyWith<SaveCartOrderSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveCartOrderErrorCopyWith<$Res> {
  factory $SaveCartOrderErrorCopyWith(
          SaveCartOrderError value, $Res Function(SaveCartOrderError) then) =
      _$SaveCartOrderErrorCopyWithImpl<$Res>;
  $Res call({Failure failure, Future<void> Function()? onRetry});
}

/// @nodoc
class _$SaveCartOrderErrorCopyWithImpl<$Res>
    extends _$SaveCartOrderStateCopyWithImpl<$Res>
    implements $SaveCartOrderErrorCopyWith<$Res> {
  _$SaveCartOrderErrorCopyWithImpl(
      SaveCartOrderError _value, $Res Function(SaveCartOrderError) _then)
      : super(_value, (v) => _then(v as SaveCartOrderError));

  @override
  SaveCartOrderError get _value => super._value as SaveCartOrderError;

  @override
  $Res call({
    Object? failure = freezed,
    Object? onRetry = freezed,
  }) {
    return _then(SaveCartOrderError(
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

class _$SaveCartOrderError implements SaveCartOrderError {
  const _$SaveCartOrderError(this.failure, this.onRetry);

  @override
  final Failure failure;
  @override
  final Future<void> Function()? onRetry;

  @override
  String toString() {
    return 'SaveCartOrderState.error(failure: $failure, onRetry: $onRetry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SaveCartOrderError &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            (identical(other.onRetry, onRetry) || other.onRetry == onRetry));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failure), onRetry);

  @JsonKey(ignore: true)
  @override
  $SaveCartOrderErrorCopyWith<SaveCartOrderError> get copyWith =>
      _$SaveCartOrderErrorCopyWithImpl<SaveCartOrderError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? tableNum) success,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return error(failure, onRetry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? tableNum)? success,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return error?.call(failure, onRetry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? tableNum)? success,
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
    required TResult Function(SaveCartOrderInitial value) initial,
    required TResult Function(SaveCartOrderLoading value) loading,
    required TResult Function(SaveCartOrderSuccess value) success,
    required TResult Function(SaveCartOrderError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SaveCartOrderInitial value)? initial,
    TResult Function(SaveCartOrderLoading value)? loading,
    TResult Function(SaveCartOrderSuccess value)? success,
    TResult Function(SaveCartOrderError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveCartOrderInitial value)? initial,
    TResult Function(SaveCartOrderLoading value)? loading,
    TResult Function(SaveCartOrderSuccess value)? success,
    TResult Function(SaveCartOrderError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SaveCartOrderError implements SaveCartOrderState {
  const factory SaveCartOrderError(
      Failure failure, Future<void> Function()? onRetry) = _$SaveCartOrderError;

  Failure get failure;
  Future<void> Function()? get onRetry;
  @JsonKey(ignore: true)
  $SaveCartOrderErrorCopyWith<SaveCartOrderError> get copyWith =>
      throw _privateConstructorUsedError;
}
