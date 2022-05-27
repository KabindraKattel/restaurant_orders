// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'signin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInStateTearOff {
  const _$SignInStateTearOff();

  SignInInitial initial() {
    return const SignInInitial();
  }

  SignInSubmitting submitting() {
    return const SignInSubmitting();
  }

  SignInAuthenticated authenticated() {
    return const SignInAuthenticated();
  }

  SignInError error(Failure failure, Future<void> Function()? onRetry) {
    return SignInError(
      failure,
      onRetry,
    );
  }
}

/// @nodoc
const $SignInState = _$SignInStateTearOff();

/// @nodoc
mixin _$SignInState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() submitting,
    required TResult Function() authenticated,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? submitting,
    TResult Function()? authenticated,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? submitting,
    TResult Function()? authenticated,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInInitial value) initial,
    required TResult Function(SignInSubmitting value) submitting,
    required TResult Function(SignInAuthenticated value) authenticated,
    required TResult Function(SignInError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInInitial value)? initial,
    TResult Function(SignInSubmitting value)? submitting,
    TResult Function(SignInAuthenticated value)? authenticated,
    TResult Function(SignInError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitial value)? initial,
    TResult Function(SignInSubmitting value)? submitting,
    TResult Function(SignInAuthenticated value)? authenticated,
    TResult Function(SignInError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res> implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  final SignInState _value;
  // ignore: unused_field
  final $Res Function(SignInState) _then;
}

/// @nodoc
abstract class $SignInInitialCopyWith<$Res> {
  factory $SignInInitialCopyWith(
          SignInInitial value, $Res Function(SignInInitial) then) =
      _$SignInInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInInitialCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements $SignInInitialCopyWith<$Res> {
  _$SignInInitialCopyWithImpl(
      SignInInitial _value, $Res Function(SignInInitial) _then)
      : super(_value, (v) => _then(v as SignInInitial));

  @override
  SignInInitial get _value => super._value as SignInInitial;
}

/// @nodoc

class _$SignInInitial implements SignInInitial {
  const _$SignInInitial();

  @override
  String toString() {
    return 'SignInState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignInInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() submitting,
    required TResult Function() authenticated,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? submitting,
    TResult Function()? authenticated,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? submitting,
    TResult Function()? authenticated,
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
    required TResult Function(SignInInitial value) initial,
    required TResult Function(SignInSubmitting value) submitting,
    required TResult Function(SignInAuthenticated value) authenticated,
    required TResult Function(SignInError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInInitial value)? initial,
    TResult Function(SignInSubmitting value)? submitting,
    TResult Function(SignInAuthenticated value)? authenticated,
    TResult Function(SignInError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitial value)? initial,
    TResult Function(SignInSubmitting value)? submitting,
    TResult Function(SignInAuthenticated value)? authenticated,
    TResult Function(SignInError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SignInInitial implements SignInState {
  const factory SignInInitial() = _$SignInInitial;
}

/// @nodoc
abstract class $SignInSubmittingCopyWith<$Res> {
  factory $SignInSubmittingCopyWith(
          SignInSubmitting value, $Res Function(SignInSubmitting) then) =
      _$SignInSubmittingCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInSubmittingCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res>
    implements $SignInSubmittingCopyWith<$Res> {
  _$SignInSubmittingCopyWithImpl(
      SignInSubmitting _value, $Res Function(SignInSubmitting) _then)
      : super(_value, (v) => _then(v as SignInSubmitting));

  @override
  SignInSubmitting get _value => super._value as SignInSubmitting;
}

/// @nodoc

class _$SignInSubmitting implements SignInSubmitting {
  const _$SignInSubmitting();

  @override
  String toString() {
    return 'SignInState.submitting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignInSubmitting);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() submitting,
    required TResult Function() authenticated,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return submitting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? submitting,
    TResult Function()? authenticated,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return submitting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? submitting,
    TResult Function()? authenticated,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInInitial value) initial,
    required TResult Function(SignInSubmitting value) submitting,
    required TResult Function(SignInAuthenticated value) authenticated,
    required TResult Function(SignInError value) error,
  }) {
    return submitting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInInitial value)? initial,
    TResult Function(SignInSubmitting value)? submitting,
    TResult Function(SignInAuthenticated value)? authenticated,
    TResult Function(SignInError value)? error,
  }) {
    return submitting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitial value)? initial,
    TResult Function(SignInSubmitting value)? submitting,
    TResult Function(SignInAuthenticated value)? authenticated,
    TResult Function(SignInError value)? error,
    required TResult orElse(),
  }) {
    if (submitting != null) {
      return submitting(this);
    }
    return orElse();
  }
}

abstract class SignInSubmitting implements SignInState {
  const factory SignInSubmitting() = _$SignInSubmitting;
}

/// @nodoc
abstract class $SignInAuthenticatedCopyWith<$Res> {
  factory $SignInAuthenticatedCopyWith(
          SignInAuthenticated value, $Res Function(SignInAuthenticated) then) =
      _$SignInAuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInAuthenticatedCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res>
    implements $SignInAuthenticatedCopyWith<$Res> {
  _$SignInAuthenticatedCopyWithImpl(
      SignInAuthenticated _value, $Res Function(SignInAuthenticated) _then)
      : super(_value, (v) => _then(v as SignInAuthenticated));

  @override
  SignInAuthenticated get _value => super._value as SignInAuthenticated;
}

/// @nodoc

class _$SignInAuthenticated implements SignInAuthenticated {
  const _$SignInAuthenticated();

  @override
  String toString() {
    return 'SignInState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignInAuthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() submitting,
    required TResult Function() authenticated,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? submitting,
    TResult Function()? authenticated,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? submitting,
    TResult Function()? authenticated,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInInitial value) initial,
    required TResult Function(SignInSubmitting value) submitting,
    required TResult Function(SignInAuthenticated value) authenticated,
    required TResult Function(SignInError value) error,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInInitial value)? initial,
    TResult Function(SignInSubmitting value)? submitting,
    TResult Function(SignInAuthenticated value)? authenticated,
    TResult Function(SignInError value)? error,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitial value)? initial,
    TResult Function(SignInSubmitting value)? submitting,
    TResult Function(SignInAuthenticated value)? authenticated,
    TResult Function(SignInError value)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class SignInAuthenticated implements SignInState {
  const factory SignInAuthenticated() = _$SignInAuthenticated;
}

/// @nodoc
abstract class $SignInErrorCopyWith<$Res> {
  factory $SignInErrorCopyWith(
          SignInError value, $Res Function(SignInError) then) =
      _$SignInErrorCopyWithImpl<$Res>;
  $Res call({Failure failure, Future<void> Function()? onRetry});
}

/// @nodoc
class _$SignInErrorCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements $SignInErrorCopyWith<$Res> {
  _$SignInErrorCopyWithImpl(
      SignInError _value, $Res Function(SignInError) _then)
      : super(_value, (v) => _then(v as SignInError));

  @override
  SignInError get _value => super._value as SignInError;

  @override
  $Res call({
    Object? failure = freezed,
    Object? onRetry = freezed,
  }) {
    return _then(SignInError(
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

class _$SignInError implements SignInError {
  const _$SignInError(this.failure, this.onRetry);

  @override
  final Failure failure;
  @override
  final Future<void> Function()? onRetry;

  @override
  String toString() {
    return 'SignInState.error(failure: $failure, onRetry: $onRetry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInError &&
            const DeepCollectionEquality().equals(other.failure, failure) &&
            (identical(other.onRetry, onRetry) || other.onRetry == onRetry));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failure), onRetry);

  @JsonKey(ignore: true)
  @override
  $SignInErrorCopyWith<SignInError> get copyWith =>
      _$SignInErrorCopyWithImpl<SignInError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() submitting,
    required TResult Function() authenticated,
    required TResult Function(Failure failure, Future<void> Function()? onRetry)
        error,
  }) {
    return error(failure, onRetry);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? submitting,
    TResult Function()? authenticated,
    TResult Function(Failure failure, Future<void> Function()? onRetry)? error,
  }) {
    return error?.call(failure, onRetry);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? submitting,
    TResult Function()? authenticated,
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
    required TResult Function(SignInInitial value) initial,
    required TResult Function(SignInSubmitting value) submitting,
    required TResult Function(SignInAuthenticated value) authenticated,
    required TResult Function(SignInError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInInitial value)? initial,
    TResult Function(SignInSubmitting value)? submitting,
    TResult Function(SignInAuthenticated value)? authenticated,
    TResult Function(SignInError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInInitial value)? initial,
    TResult Function(SignInSubmitting value)? submitting,
    TResult Function(SignInAuthenticated value)? authenticated,
    TResult Function(SignInError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SignInError implements SignInState {
  const factory SignInError(Failure failure, Future<void> Function()? onRetry) =
      _$SignInError;

  Failure get failure;
  Future<void> Function()? get onRetry;
  @JsonKey(ignore: true)
  $SignInErrorCopyWith<SignInError> get copyWith =>
      throw _privateConstructorUsedError;
}
