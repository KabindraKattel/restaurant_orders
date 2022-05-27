// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_items_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CartItemsStateTearOff {
  const _$CartItemsStateTearOff();

  _CartItemsState _({required OrderModel? model}) {
    return _CartItemsState(
      model: model,
    );
  }
}

/// @nodoc
const $CartItemsState = _$CartItemsStateTearOff();

/// @nodoc
mixin _$CartItemsState {
  OrderModel? get model => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartItemsStateCopyWith<CartItemsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemsStateCopyWith<$Res> {
  factory $CartItemsStateCopyWith(
          CartItemsState value, $Res Function(CartItemsState) then) =
      _$CartItemsStateCopyWithImpl<$Res>;
  $Res call({OrderModel? model});
}

/// @nodoc
class _$CartItemsStateCopyWithImpl<$Res>
    implements $CartItemsStateCopyWith<$Res> {
  _$CartItemsStateCopyWithImpl(this._value, this._then);

  final CartItemsState _value;
  // ignore: unused_field
  final $Res Function(CartItemsState) _then;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_value.copyWith(
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as OrderModel?,
    ));
  }
}

/// @nodoc
abstract class _$CartItemsStateCopyWith<$Res>
    implements $CartItemsStateCopyWith<$Res> {
  factory _$CartItemsStateCopyWith(
          _CartItemsState value, $Res Function(_CartItemsState) then) =
      __$CartItemsStateCopyWithImpl<$Res>;
  @override
  $Res call({OrderModel? model});
}

/// @nodoc
class __$CartItemsStateCopyWithImpl<$Res>
    extends _$CartItemsStateCopyWithImpl<$Res>
    implements _$CartItemsStateCopyWith<$Res> {
  __$CartItemsStateCopyWithImpl(
      _CartItemsState _value, $Res Function(_CartItemsState) _then)
      : super(_value, (v) => _then(v as _CartItemsState));

  @override
  _CartItemsState get _value => super._value as _CartItemsState;

  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_CartItemsState(
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as OrderModel?,
    ));
  }
}

/// @nodoc

class _$_CartItemsState implements _CartItemsState {
  const _$_CartItemsState({required this.model});

  @override
  final OrderModel? model;

  @override
  String toString() {
    return 'CartItemsState._(model: $model)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartItemsState &&
            const DeepCollectionEquality().equals(other.model, model));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(model));

  @JsonKey(ignore: true)
  @override
  _$CartItemsStateCopyWith<_CartItemsState> get copyWith =>
      __$CartItemsStateCopyWithImpl<_CartItemsState>(this, _$identity);
}

abstract class _CartItemsState implements CartItemsState {
  const factory _CartItemsState({required OrderModel? model}) =
      _$_CartItemsState;

  @override
  OrderModel? get model;
  @override
  @JsonKey(ignore: true)
  _$CartItemsStateCopyWith<_CartItemsState> get copyWith =>
      throw _privateConstructorUsedError;
}
