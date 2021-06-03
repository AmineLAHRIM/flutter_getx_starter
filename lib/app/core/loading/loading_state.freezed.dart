// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'loading_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoadingStateTearOff {
  const _$LoadingStateTearOff();

  LOADING loading() {
    return const LOADING();
  }

  EMPTY empty() {
    return const EMPTY();
  }

  ERROR error({String? message, MessageType? type}) {
    return ERROR(
      message: message,
      type: type,
    );
  }

  LOADED loaded() {
    return const LOADED();
  }
}

/// @nodoc
const $LoadingState = _$LoadingStateTearOff();

/// @nodoc
mixin _$LoadingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(String? message, MessageType? type) error,
    required TResult Function() loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(String? message, MessageType? type)? error,
    TResult Function()? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LOADING value) loading,
    required TResult Function(EMPTY value) empty,
    required TResult Function(ERROR value) error,
    required TResult Function(LOADED value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LOADING value)? loading,
    TResult Function(EMPTY value)? empty,
    TResult Function(ERROR value)? error,
    TResult Function(LOADED value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingStateCopyWith<$Res> {
  factory $LoadingStateCopyWith(
          LoadingState value, $Res Function(LoadingState) then) =
      _$LoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingStateCopyWithImpl<$Res> implements $LoadingStateCopyWith<$Res> {
  _$LoadingStateCopyWithImpl(this._value, this._then);

  final LoadingState _value;
  // ignore: unused_field
  final $Res Function(LoadingState) _then;
}

/// @nodoc
abstract class $LOADINGCopyWith<$Res> {
  factory $LOADINGCopyWith(LOADING value, $Res Function(LOADING) then) =
      _$LOADINGCopyWithImpl<$Res>;
}

/// @nodoc
class _$LOADINGCopyWithImpl<$Res> extends _$LoadingStateCopyWithImpl<$Res>
    implements $LOADINGCopyWith<$Res> {
  _$LOADINGCopyWithImpl(LOADING _value, $Res Function(LOADING) _then)
      : super(_value, (v) => _then(v as LOADING));

  @override
  LOADING get _value => super._value as LOADING;
}

/// @nodoc

class _$LOADING implements LOADING {
  const _$LOADING();

  @override
  String toString() {
    return 'LoadingState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LOADING);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(String? message, MessageType? type) error,
    required TResult Function() loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(String? message, MessageType? type)? error,
    TResult Function()? loaded,
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
    required TResult Function(LOADING value) loading,
    required TResult Function(EMPTY value) empty,
    required TResult Function(ERROR value) error,
    required TResult Function(LOADED value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LOADING value)? loading,
    TResult Function(EMPTY value)? empty,
    TResult Function(ERROR value)? error,
    TResult Function(LOADED value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LOADING implements LoadingState {
  const factory LOADING() = _$LOADING;
}

/// @nodoc
abstract class $EMPTYCopyWith<$Res> {
  factory $EMPTYCopyWith(EMPTY value, $Res Function(EMPTY) then) =
      _$EMPTYCopyWithImpl<$Res>;
}

/// @nodoc
class _$EMPTYCopyWithImpl<$Res> extends _$LoadingStateCopyWithImpl<$Res>
    implements $EMPTYCopyWith<$Res> {
  _$EMPTYCopyWithImpl(EMPTY _value, $Res Function(EMPTY) _then)
      : super(_value, (v) => _then(v as EMPTY));

  @override
  EMPTY get _value => super._value as EMPTY;
}

/// @nodoc

class _$EMPTY implements EMPTY {
  const _$EMPTY();

  @override
  String toString() {
    return 'LoadingState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EMPTY);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(String? message, MessageType? type) error,
    required TResult Function() loaded,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(String? message, MessageType? type)? error,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LOADING value) loading,
    required TResult Function(EMPTY value) empty,
    required TResult Function(ERROR value) error,
    required TResult Function(LOADED value) loaded,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LOADING value)? loading,
    TResult Function(EMPTY value)? empty,
    TResult Function(ERROR value)? error,
    TResult Function(LOADED value)? loaded,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EMPTY implements LoadingState {
  const factory EMPTY() = _$EMPTY;
}

/// @nodoc
abstract class $ERRORCopyWith<$Res> {
  factory $ERRORCopyWith(ERROR value, $Res Function(ERROR) then) =
      _$ERRORCopyWithImpl<$Res>;
  $Res call({String? message, MessageType? type});
}

/// @nodoc
class _$ERRORCopyWithImpl<$Res> extends _$LoadingStateCopyWithImpl<$Res>
    implements $ERRORCopyWith<$Res> {
  _$ERRORCopyWithImpl(ERROR _value, $Res Function(ERROR) _then)
      : super(_value, (v) => _then(v as ERROR));

  @override
  ERROR get _value => super._value as ERROR;

  @override
  $Res call({
    Object? message = freezed,
    Object? type = freezed,
  }) {
    return _then(ERROR(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageType?,
    ));
  }
}

/// @nodoc

class _$ERROR implements ERROR {
  const _$ERROR({this.message, this.type});

  @override
  final String? message;
  @override
  final MessageType? type;

  @override
  String toString() {
    return 'LoadingState.error(message: $message, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ERROR &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  $ERRORCopyWith<ERROR> get copyWith =>
      _$ERRORCopyWithImpl<ERROR>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(String? message, MessageType? type) error,
    required TResult Function() loaded,
  }) {
    return error(message, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(String? message, MessageType? type)? error,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LOADING value) loading,
    required TResult Function(EMPTY value) empty,
    required TResult Function(ERROR value) error,
    required TResult Function(LOADED value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LOADING value)? loading,
    TResult Function(EMPTY value)? empty,
    TResult Function(ERROR value)? error,
    TResult Function(LOADED value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ERROR implements LoadingState {
  const factory ERROR({String? message, MessageType? type}) = _$ERROR;

  String? get message => throw _privateConstructorUsedError;
  MessageType? get type => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ERRORCopyWith<ERROR> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LOADEDCopyWith<$Res> {
  factory $LOADEDCopyWith(LOADED value, $Res Function(LOADED) then) =
      _$LOADEDCopyWithImpl<$Res>;
}

/// @nodoc
class _$LOADEDCopyWithImpl<$Res> extends _$LoadingStateCopyWithImpl<$Res>
    implements $LOADEDCopyWith<$Res> {
  _$LOADEDCopyWithImpl(LOADED _value, $Res Function(LOADED) _then)
      : super(_value, (v) => _then(v as LOADED));

  @override
  LOADED get _value => super._value as LOADED;
}

/// @nodoc

class _$LOADED implements LOADED {
  const _$LOADED();

  @override
  String toString() {
    return 'LoadingState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LOADED);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(String? message, MessageType? type) error,
    required TResult Function() loaded,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(String? message, MessageType? type)? error,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LOADING value) loading,
    required TResult Function(EMPTY value) empty,
    required TResult Function(ERROR value) error,
    required TResult Function(LOADED value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LOADING value)? loading,
    TResult Function(EMPTY value)? empty,
    TResult Function(ERROR value)? error,
    TResult Function(LOADED value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LOADED implements LoadingState {
  const factory LOADED() = _$LOADED;
}
