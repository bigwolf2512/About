// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthPageStateTearOff {
  const _$AuthPageStateTearOff();

  _AuthPageState call(
      {AuthPageSubPage currentSubView = AuthPageSubPage.login}) {
    return _AuthPageState(
      currentSubView: currentSubView,
    );
  }
}

/// @nodoc
const $AuthPageState = _$AuthPageStateTearOff();

/// @nodoc
mixin _$AuthPageState {
  AuthPageSubPage get currentSubView => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthPageStateCopyWith<AuthPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthPageStateCopyWith<$Res> {
  factory $AuthPageStateCopyWith(
          AuthPageState value, $Res Function(AuthPageState) then) =
      _$AuthPageStateCopyWithImpl<$Res>;
  $Res call({AuthPageSubPage currentSubView});
}

/// @nodoc
class _$AuthPageStateCopyWithImpl<$Res>
    implements $AuthPageStateCopyWith<$Res> {
  _$AuthPageStateCopyWithImpl(this._value, this._then);

  final AuthPageState _value;
  // ignore: unused_field
  final $Res Function(AuthPageState) _then;

  @override
  $Res call({
    Object? currentSubView = freezed,
  }) {
    return _then(_value.copyWith(
      currentSubView: currentSubView == freezed
          ? _value.currentSubView
          : currentSubView // ignore: cast_nullable_to_non_nullable
              as AuthPageSubPage,
    ));
  }
}

/// @nodoc
abstract class _$AuthPageStateCopyWith<$Res>
    implements $AuthPageStateCopyWith<$Res> {
  factory _$AuthPageStateCopyWith(
          _AuthPageState value, $Res Function(_AuthPageState) then) =
      __$AuthPageStateCopyWithImpl<$Res>;
  @override
  $Res call({AuthPageSubPage currentSubView});
}

/// @nodoc
class __$AuthPageStateCopyWithImpl<$Res>
    extends _$AuthPageStateCopyWithImpl<$Res>
    implements _$AuthPageStateCopyWith<$Res> {
  __$AuthPageStateCopyWithImpl(
      _AuthPageState _value, $Res Function(_AuthPageState) _then)
      : super(_value, (v) => _then(v as _AuthPageState));

  @override
  _AuthPageState get _value => super._value as _AuthPageState;

  @override
  $Res call({
    Object? currentSubView = freezed,
  }) {
    return _then(_AuthPageState(
      currentSubView: currentSubView == freezed
          ? _value.currentSubView
          : currentSubView // ignore: cast_nullable_to_non_nullable
              as AuthPageSubPage,
    ));
  }
}

/// @nodoc
class _$_AuthPageState implements _AuthPageState {
  const _$_AuthPageState({this.currentSubView = AuthPageSubPage.login});

  @JsonKey(defaultValue: AuthPageSubPage.login)
  @override
  final AuthPageSubPage currentSubView;

  @override
  String toString() {
    return 'AuthPageState(currentSubView: $currentSubView)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthPageState &&
            (identical(other.currentSubView, currentSubView) ||
                const DeepCollectionEquality()
                    .equals(other.currentSubView, currentSubView)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentSubView);

  @JsonKey(ignore: true)
  @override
  _$AuthPageStateCopyWith<_AuthPageState> get copyWith =>
      __$AuthPageStateCopyWithImpl<_AuthPageState>(this, _$identity);
}

abstract class _AuthPageState implements AuthPageState {
  const factory _AuthPageState({AuthPageSubPage currentSubView}) =
      _$_AuthPageState;

  @override
  AuthPageSubPage get currentSubView => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthPageStateCopyWith<_AuthPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
