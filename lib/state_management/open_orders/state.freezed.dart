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
class _$OpenOrdersStateTearOff {
  const _$OpenOrdersStateTearOff();

  OpenOrdersLoading loading() {
    return const OpenOrdersLoading();
  }

  OpenOrdersData data(
      {required Map<OpenOrderTableModel, List<OpenOrderModel>> data}) {
    return OpenOrdersData(
      data: data,
    );
  }

  OpenOrdersError error(Failure failure, Future<void> Function()? onRetry) {
    return OpenOrdersError(
      failure,
      onRetry,
    );
  }
}

/// @nodoc
const $OpenOrdersState = _$OpenOrdersStateTearOff();

/// @nodoc
mixin _$OpenOrdersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            Map<OpenOrderTableModel, List<OpenOrderModel>> data)
        data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Map<OpenOrderTableModel, List<OpenOrderModel>> data)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Map<OpenOrderTableModel, List<OpenOrderModel>> data)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OpenOrdersLoading value) loading,
    required TResult Function(OpenOrdersData value) data,
    required TResult Function(OpenOrdersError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OpenOrdersLoading value)? loading,
    TResult Function(OpenOrdersData value)? data,
    TResult Function(OpenOrdersError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OpenOrdersLoading value)? loading,
    TResult Function(OpenOrdersData value)? data,
    TResult Function(OpenOrdersError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenOrdersStateCopyWith<$Res> {
  factory $OpenOrdersStateCopyWith(
          OpenOrdersState value, $Res Function(OpenOrdersState) then) =
      _$OpenOrdersStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$OpenOrdersStateCopyWithImpl<$Res>
    implements $OpenOrdersStateCopyWith<$Res> {
  _$OpenOrdersStateCopyWithImpl(this._value, this._then);

  final OpenOrdersState _value;
  // ignore: unused_field
  final $Res Function(OpenOrdersState) _then;
}

/// @nodoc
abstract class $OpenOrdersLoadingCopyWith<$Res> {
  factory $OpenOrdersLoadingCopyWith(
          OpenOrdersLoading value, $Res Function(OpenOrdersLoading) then) =
      _$OpenOrdersLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$OpenOrdersLoadingCopyWithImpl<$Res>
    extends _$OpenOrdersStateCopyWithImpl<$Res>
    implements $OpenOrdersLoadingCopyWith<$Res> {
  _$OpenOrdersLoadingCopyWithImpl(
      OpenOrdersLoading _value, $Res Function(OpenOrdersLoading) _then)
      : super(_value, (v) => _then(v as OpenOrdersLoading));

  @override
  OpenOrdersLoading get _value => super._value as OpenOrdersLoading;
}

/// @nodoc

class _$OpenOrdersLoading implements OpenOrdersLoading {
  const _$OpenOrdersLoading();

  @override
  String toString() {
    return 'OpenOrdersState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OpenOrdersLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            Map<OpenOrderTableModel, List<OpenOrderModel>> data)
        data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Map<OpenOrderTableModel, List<OpenOrderModel>> data)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Map<OpenOrderTableModel, List<OpenOrderModel>> data)? data,
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
    required TResult Function(OpenOrdersLoading value) loading,
    required TResult Function(OpenOrdersData value) data,
    required TResult Function(OpenOrdersError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OpenOrdersLoading value)? loading,
    TResult Function(OpenOrdersData value)? data,
    TResult Function(OpenOrdersError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OpenOrdersLoading value)? loading,
    TResult Function(OpenOrdersData value)? data,
    TResult Function(OpenOrdersError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class OpenOrdersLoading implements OpenOrdersState {
  const factory OpenOrdersLoading() = _$OpenOrdersLoading;
}

/// @nodoc
abstract class $OpenOrdersDataCopyWith<$Res> {
  factory $OpenOrdersDataCopyWith(
          OpenOrdersData value, $Res Function(OpenOrdersData) then) =
      _$OpenOrdersDataCopyWithImpl<$Res>;
  $Res call({Map<OpenOrderTableModel, List<OpenOrderModel>> data});
}

/// @nodoc
class _$OpenOrdersDataCopyWithImpl<$Res>
    extends _$OpenOrdersStateCopyWithImpl<$Res>
    implements $OpenOrdersDataCopyWith<$Res> {
  _$OpenOrdersDataCopyWithImpl(
      OpenOrdersData _value, $Res Function(OpenOrdersData) _then)
      : super(_value, (v) => _then(v as OpenOrdersData));

  @override
  OpenOrdersData get _value => super._value as OpenOrdersData;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(OpenOrdersData(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<OpenOrderTableModel, List<OpenOrderModel>>,
    ));
  }
}

/// @nodoc

class _$OpenOrdersData implements OpenOrdersData {
  const _$OpenOrdersData({required this.data});

  @override
  final Map<OpenOrderTableModel, List<OpenOrderModel>> data;

  @override
  String toString() {
    return 'OpenOrdersState.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OpenOrdersData &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $OpenOrdersDataCopyWith<OpenOrdersData> get copyWith =>
      _$OpenOrdersDataCopyWithImpl<OpenOrdersData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            Map<OpenOrderTableModel, List<OpenOrderModel>> data)
        data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Map<OpenOrderTableModel, List<OpenOrderModel>> data)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Map<OpenOrderTableModel, List<OpenOrderModel>> data)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OpenOrdersLoading value) loading,
    required TResult Function(OpenOrdersData value) data,
    required TResult Function(OpenOrdersError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OpenOrdersLoading value)? loading,
    TResult Function(OpenOrdersData value)? data,
    TResult Function(OpenOrdersError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OpenOrdersLoading value)? loading,
    TResult Function(OpenOrdersData value)? data,
    TResult Function(OpenOrdersError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class OpenOrdersData implements OpenOrdersState {
  const factory OpenOrdersData(
          {required Map<OpenOrderTableModel, List<OpenOrderModel>> data}) =
      _$OpenOrdersData;

  Map<OpenOrderTableModel, List<OpenOrderModel>> get data;
  @JsonKey(ignore: true)
  $OpenOrdersDataCopyWith<OpenOrdersData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenOrdersErrorCopyWith<$Res> {
  factory $OpenOrdersErrorCopyWith(
          OpenOrdersError value, $Res Function(OpenOrdersError) then) =
      _$OpenOrdersErrorCopyWithImpl<$Res>;
  $Res call({Failure failure, Future<void> Function()? onRetry});
}

/// @nodoc
class _$OpenOrdersErrorCopyWithImpl<$Res>
    extends _$OpenOrdersStateCopyWithImpl<$Res>
    implements $OpenOrdersErrorCopyWith<$Res> {
  _$OpenOrdersErrorCopyWithImpl(
      OpenOrdersError _value, $Res Function(OpenOrdersError) _then)
      : super(_value, (v) => _then(v as OpenOrdersError));

  @override
  OpenOrdersError get _value => super._value as OpenOrdersError;

  @override
  $Res call({
    Object? failure = freezed,
    Object? onRetry = freezed,
  }) {
    return _then(OpenOrdersError(
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

class _$OpenOrdersError implements OpenOrdersError {
  const _$OpenOrdersError(this.failure, this.onRetry);

  @override
  final Failure failure;
  @override
  final Future<void> Function()? onRetry;

  @override
  String toString() {
    return 'OpenOrdersState.error(failure: $failure, onRetry: $onRetry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OpenOrdersError &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            (identical(other.onRetry, onRetry) || other.onRetry == onRetry));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failure), onRetry);

  @JsonKey(ignore: true)
  @override
  $OpenOrdersErrorCopyWith<OpenOrdersError> get copyWith =>
      _$OpenOrdersErrorCopyWithImpl<OpenOrdersError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(
            Map<OpenOrderTableModel, List<OpenOrderModel>> data)
        data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return error(failure, onRetry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Map<OpenOrderTableModel, List<OpenOrderModel>> data)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return error?.call(failure, onRetry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Map<OpenOrderTableModel, List<OpenOrderModel>> data)? data,
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
    required TResult Function(OpenOrdersLoading value) loading,
    required TResult Function(OpenOrdersData value) data,
    required TResult Function(OpenOrdersError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OpenOrdersLoading value)? loading,
    TResult Function(OpenOrdersData value)? data,
    TResult Function(OpenOrdersError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OpenOrdersLoading value)? loading,
    TResult Function(OpenOrdersData value)? data,
    TResult Function(OpenOrdersError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class OpenOrdersError implements OpenOrdersState {
  const factory OpenOrdersError(
      Failure failure, Future<void> Function()? onRetry) = _$OpenOrdersError;

  Failure get failure;
  Future<void> Function()? get onRetry;
  @JsonKey(ignore: true)
  $OpenOrdersErrorCopyWith<OpenOrdersError> get copyWith =>
      throw _privateConstructorUsedError;
}
