// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'asset_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AssetStateTearOff {
  const _$AssetStateTearOff();

  AssetLoading loading() {
    return const AssetLoading();
  }

  AssetSuccess data(List<AssetModel> model) {
    return AssetSuccess(
      model,
    );
  }

  AssetError error(Failure failure, Future<void> Function()? onRetry) {
    return AssetError(
      failure,
      onRetry,
    );
  }
}

/// @nodoc
const $AssetState = _$AssetStateTearOff();

/// @nodoc
mixin _$AssetState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<AssetModel> model) data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<AssetModel> model)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<AssetModel> model)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssetLoading value) loading,
    required TResult Function(AssetSuccess value) data,
    required TResult Function(AssetError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AssetLoading value)? loading,
    TResult Function(AssetSuccess value)? data,
    TResult Function(AssetError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssetLoading value)? loading,
    TResult Function(AssetSuccess value)? data,
    TResult Function(AssetError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetStateCopyWith<$Res> {
  factory $AssetStateCopyWith(
          AssetState value, $Res Function(AssetState) then) =
      _$AssetStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AssetStateCopyWithImpl<$Res> implements $AssetStateCopyWith<$Res> {
  _$AssetStateCopyWithImpl(this._value, this._then);

  final AssetState _value;
  // ignore: unused_field
  final $Res Function(AssetState) _then;
}

/// @nodoc
abstract class $AssetLoadingCopyWith<$Res> {
  factory $AssetLoadingCopyWith(
          AssetLoading value, $Res Function(AssetLoading) then) =
      _$AssetLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$AssetLoadingCopyWithImpl<$Res> extends _$AssetStateCopyWithImpl<$Res>
    implements $AssetLoadingCopyWith<$Res> {
  _$AssetLoadingCopyWithImpl(
      AssetLoading _value, $Res Function(AssetLoading) _then)
      : super(_value, (v) => _then(v as AssetLoading));

  @override
  AssetLoading get _value => super._value as AssetLoading;
}

/// @nodoc

class _$AssetLoading implements AssetLoading {
  const _$AssetLoading();

  @override
  String toString() {
    return 'AssetState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AssetLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<AssetModel> model) data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<AssetModel> model)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<AssetModel> model)? data,
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
    required TResult Function(AssetLoading value) loading,
    required TResult Function(AssetSuccess value) data,
    required TResult Function(AssetError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AssetLoading value)? loading,
    TResult Function(AssetSuccess value)? data,
    TResult Function(AssetError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssetLoading value)? loading,
    TResult Function(AssetSuccess value)? data,
    TResult Function(AssetError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AssetLoading implements AssetState {
  const factory AssetLoading() = _$AssetLoading;
}

/// @nodoc
abstract class $AssetSuccessCopyWith<$Res> {
  factory $AssetSuccessCopyWith(
          AssetSuccess value, $Res Function(AssetSuccess) then) =
      _$AssetSuccessCopyWithImpl<$Res>;
  $Res call({List<AssetModel> model});
}

/// @nodoc
class _$AssetSuccessCopyWithImpl<$Res> extends _$AssetStateCopyWithImpl<$Res>
    implements $AssetSuccessCopyWith<$Res> {
  _$AssetSuccessCopyWithImpl(
      AssetSuccess _value, $Res Function(AssetSuccess) _then)
      : super(_value, (v) => _then(v as AssetSuccess));

  @override
  AssetSuccess get _value => super._value as AssetSuccess;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(AssetSuccess(
      model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as List<AssetModel>,
    ));
  }
}

/// @nodoc

class _$AssetSuccess implements AssetSuccess {
  const _$AssetSuccess(this.model);

  @override
  final List<AssetModel> model;

  @override
  String toString() {
    return 'AssetState.data(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssetSuccess &&
            const DeepCollectionEquality().equals(other.model, model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(model));

  @JsonKey(ignore: true)
  @override
  $AssetSuccessCopyWith<AssetSuccess> get copyWith =>
      _$AssetSuccessCopyWithImpl<AssetSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<AssetModel> model) data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return data(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<AssetModel> model)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return data?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<AssetModel> model)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssetLoading value) loading,
    required TResult Function(AssetSuccess value) data,
    required TResult Function(AssetError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AssetLoading value)? loading,
    TResult Function(AssetSuccess value)? data,
    TResult Function(AssetError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssetLoading value)? loading,
    TResult Function(AssetSuccess value)? data,
    TResult Function(AssetError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class AssetSuccess implements AssetState {
  const factory AssetSuccess(List<AssetModel> model) = _$AssetSuccess;

  List<AssetModel> get model;
  @JsonKey(ignore: true)
  $AssetSuccessCopyWith<AssetSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetErrorCopyWith<$Res> {
  factory $AssetErrorCopyWith(
          AssetError value, $Res Function(AssetError) then) =
      _$AssetErrorCopyWithImpl<$Res>;
  $Res call({Failure failure, Future<void> Function()? onRetry});
}

/// @nodoc
class _$AssetErrorCopyWithImpl<$Res> extends _$AssetStateCopyWithImpl<$Res>
    implements $AssetErrorCopyWith<$Res> {
  _$AssetErrorCopyWithImpl(AssetError _value, $Res Function(AssetError) _then)
      : super(_value, (v) => _then(v as AssetError));

  @override
  AssetError get _value => super._value as AssetError;

  @override
  $Res call({
    Object? failure = freezed,
    Object? onRetry = freezed,
  }) {
    return _then(AssetError(
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

class _$AssetError implements AssetError {
  const _$AssetError(this.failure, this.onRetry);

  @override
  final Failure failure;
  @override
  final Future<void> Function()? onRetry;

  @override
  String toString() {
    return 'AssetState.error(failure: $failure, onRetry: $onRetry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AssetError &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            (identical(other.onRetry, onRetry) || other.onRetry == onRetry));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failure), onRetry);

  @JsonKey(ignore: true)
  @override
  $AssetErrorCopyWith<AssetError> get copyWith =>
      _$AssetErrorCopyWithImpl<AssetError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<AssetModel> model) data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return error(failure, onRetry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<AssetModel> model)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return error?.call(failure, onRetry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<AssetModel> model)? data,
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
    required TResult Function(AssetLoading value) loading,
    required TResult Function(AssetSuccess value) data,
    required TResult Function(AssetError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AssetLoading value)? loading,
    TResult Function(AssetSuccess value)? data,
    TResult Function(AssetError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssetLoading value)? loading,
    TResult Function(AssetSuccess value)? data,
    TResult Function(AssetError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AssetError implements AssetState {
  const factory AssetError(Failure failure, Future<void> Function()? onRetry) =
      _$AssetError;

  Failure get failure;
  Future<void> Function()? get onRetry;
  @JsonKey(ignore: true)
  $AssetErrorCopyWith<AssetError> get copyWith =>
      throw _privateConstructorUsedError;
}
