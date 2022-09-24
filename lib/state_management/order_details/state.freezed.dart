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
class _$OrderDetailsStateTearOff {
  const _$OrderDetailsStateTearOff();

  OrderDetailsLoading loading() {
    return const OrderDetailsLoading();
  }

  OrderDetailsData data({required List<OrderDetailModel> data}) {
    return OrderDetailsData(
      data: data,
    );
  }

  OrderDetailsError error(Failure failure, Future<void> Function()? onRetry) {
    return OrderDetailsError(
      failure,
      onRetry,
    );
  }
}

/// @nodoc
const $OrderDetailsState = _$OrderDetailsStateTearOff();

/// @nodoc
mixin _$OrderDetailsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<OrderDetailModel> data) data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<OrderDetailModel> data)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<OrderDetailModel> data)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OrderDetailsLoading value) loading,
    required TResult Function(OrderDetailsData value) data,
    required TResult Function(OrderDetailsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OrderDetailsLoading value)? loading,
    TResult Function(OrderDetailsData value)? data,
    TResult Function(OrderDetailsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderDetailsLoading value)? loading,
    TResult Function(OrderDetailsData value)? data,
    TResult Function(OrderDetailsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailsStateCopyWith<$Res> {
  factory $OrderDetailsStateCopyWith(
          OrderDetailsState value, $Res Function(OrderDetailsState) then) =
      _$OrderDetailsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$OrderDetailsStateCopyWithImpl<$Res>
    implements $OrderDetailsStateCopyWith<$Res> {
  _$OrderDetailsStateCopyWithImpl(this._value, this._then);

  final OrderDetailsState _value;
  // ignore: unused_field
  final $Res Function(OrderDetailsState) _then;
}

/// @nodoc
abstract class $OrderDetailsLoadingCopyWith<$Res> {
  factory $OrderDetailsLoadingCopyWith(
          OrderDetailsLoading value, $Res Function(OrderDetailsLoading) then) =
      _$OrderDetailsLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$OrderDetailsLoadingCopyWithImpl<$Res>
    extends _$OrderDetailsStateCopyWithImpl<$Res>
    implements $OrderDetailsLoadingCopyWith<$Res> {
  _$OrderDetailsLoadingCopyWithImpl(
      OrderDetailsLoading _value, $Res Function(OrderDetailsLoading) _then)
      : super(_value, (v) => _then(v as OrderDetailsLoading));

  @override
  OrderDetailsLoading get _value => super._value as OrderDetailsLoading;
}

/// @nodoc

class _$OrderDetailsLoading implements OrderDetailsLoading {
  const _$OrderDetailsLoading();

  @override
  String toString() {
    return 'OrderDetailsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OrderDetailsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<OrderDetailModel> data) data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<OrderDetailModel> data)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<OrderDetailModel> data)? data,
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
    required TResult Function(OrderDetailsLoading value) loading,
    required TResult Function(OrderDetailsData value) data,
    required TResult Function(OrderDetailsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OrderDetailsLoading value)? loading,
    TResult Function(OrderDetailsData value)? data,
    TResult Function(OrderDetailsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderDetailsLoading value)? loading,
    TResult Function(OrderDetailsData value)? data,
    TResult Function(OrderDetailsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class OrderDetailsLoading implements OrderDetailsState {
  const factory OrderDetailsLoading() = _$OrderDetailsLoading;
}

/// @nodoc
abstract class $OrderDetailsDataCopyWith<$Res> {
  factory $OrderDetailsDataCopyWith(
          OrderDetailsData value, $Res Function(OrderDetailsData) then) =
      _$OrderDetailsDataCopyWithImpl<$Res>;
  $Res call({List<OrderDetailModel> data});
}

/// @nodoc
class _$OrderDetailsDataCopyWithImpl<$Res>
    extends _$OrderDetailsStateCopyWithImpl<$Res>
    implements $OrderDetailsDataCopyWith<$Res> {
  _$OrderDetailsDataCopyWithImpl(
      OrderDetailsData _value, $Res Function(OrderDetailsData) _then)
      : super(_value, (v) => _then(v as OrderDetailsData));

  @override
  OrderDetailsData get _value => super._value as OrderDetailsData;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(OrderDetailsData(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<OrderDetailModel>,
    ));
  }
}

/// @nodoc

class _$OrderDetailsData implements OrderDetailsData {
  const _$OrderDetailsData({required this.data});

  @override
  final List<OrderDetailModel> data;

  @override
  String toString() {
    return 'OrderDetailsState.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderDetailsData &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $OrderDetailsDataCopyWith<OrderDetailsData> get copyWith =>
      _$OrderDetailsDataCopyWithImpl<OrderDetailsData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<OrderDetailModel> data) data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<OrderDetailModel> data)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<OrderDetailModel> data)? data,
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
    required TResult Function(OrderDetailsLoading value) loading,
    required TResult Function(OrderDetailsData value) data,
    required TResult Function(OrderDetailsError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OrderDetailsLoading value)? loading,
    TResult Function(OrderDetailsData value)? data,
    TResult Function(OrderDetailsError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderDetailsLoading value)? loading,
    TResult Function(OrderDetailsData value)? data,
    TResult Function(OrderDetailsError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class OrderDetailsData implements OrderDetailsState {
  const factory OrderDetailsData({required List<OrderDetailModel> data}) =
      _$OrderDetailsData;

  List<OrderDetailModel> get data;
  @JsonKey(ignore: true)
  $OrderDetailsDataCopyWith<OrderDetailsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailsErrorCopyWith<$Res> {
  factory $OrderDetailsErrorCopyWith(
          OrderDetailsError value, $Res Function(OrderDetailsError) then) =
      _$OrderDetailsErrorCopyWithImpl<$Res>;
  $Res call({Failure failure, Future<void> Function()? onRetry});
}

/// @nodoc
class _$OrderDetailsErrorCopyWithImpl<$Res>
    extends _$OrderDetailsStateCopyWithImpl<$Res>
    implements $OrderDetailsErrorCopyWith<$Res> {
  _$OrderDetailsErrorCopyWithImpl(
      OrderDetailsError _value, $Res Function(OrderDetailsError) _then)
      : super(_value, (v) => _then(v as OrderDetailsError));

  @override
  OrderDetailsError get _value => super._value as OrderDetailsError;

  @override
  $Res call({
    Object? failure = freezed,
    Object? onRetry = freezed,
  }) {
    return _then(OrderDetailsError(
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

class _$OrderDetailsError implements OrderDetailsError {
  const _$OrderDetailsError(this.failure, this.onRetry);

  @override
  final Failure failure;
  @override
  final Future<void> Function()? onRetry;

  @override
  String toString() {
    return 'OrderDetailsState.error(failure: $failure, onRetry: $onRetry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderDetailsError &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            (identical(other.onRetry, onRetry) || other.onRetry == onRetry));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failure), onRetry);

  @JsonKey(ignore: true)
  @override
  $OrderDetailsErrorCopyWith<OrderDetailsError> get copyWith =>
      _$OrderDetailsErrorCopyWithImpl<OrderDetailsError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<OrderDetailModel> data) data,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return error(failure, onRetry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<OrderDetailModel> data)? data,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return error?.call(failure, onRetry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<OrderDetailModel> data)? data,
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
    required TResult Function(OrderDetailsLoading value) loading,
    required TResult Function(OrderDetailsData value) data,
    required TResult Function(OrderDetailsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OrderDetailsLoading value)? loading,
    TResult Function(OrderDetailsData value)? data,
    TResult Function(OrderDetailsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OrderDetailsLoading value)? loading,
    TResult Function(OrderDetailsData value)? data,
    TResult Function(OrderDetailsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class OrderDetailsError implements OrderDetailsState {
  const factory OrderDetailsError(
      Failure failure, Future<void> Function()? onRetry) = _$OrderDetailsError;

  Failure get failure;
  Future<void> Function()? get onRetry;
  @JsonKey(ignore: true)
  $OrderDetailsErrorCopyWith<OrderDetailsError> get copyWith =>
      throw _privateConstructorUsedError;
}
