// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return _UserResponse.fromJson(json);
}

/// @nodoc
class _$UserResponseTearOff {
  const _$UserResponseTearOff();

  _UserResponse call(
      {required String email,
      required String username,
      required String token,
      String? image}) {
    return _UserResponse(
      email: email,
      username: username,
      token: token,
      image: image,
    );
  }

  UserResponse fromJson(Map<String, Object> json) {
    return UserResponse.fromJson(json);
  }
}

/// @nodoc
const $UserResponse = _$UserResponseTearOff();

/// @nodoc
mixin _$UserResponse {
  String get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserResponseCopyWith<UserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseCopyWith<$Res> {
  factory $UserResponseCopyWith(
          UserResponse value, $Res Function(UserResponse) then) =
      _$UserResponseCopyWithImpl<$Res>;
  $Res call({String email, String username, String token, String? image});
}

/// @nodoc
class _$UserResponseCopyWithImpl<$Res> implements $UserResponseCopyWith<$Res> {
  _$UserResponseCopyWithImpl(this._value, this._then);

  final UserResponse _value;
  // ignore: unused_field
  final $Res Function(UserResponse) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? username = freezed,
    Object? token = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserResponseCopyWith<$Res>
    implements $UserResponseCopyWith<$Res> {
  factory _$UserResponseCopyWith(
          _UserResponse value, $Res Function(_UserResponse) then) =
      __$UserResponseCopyWithImpl<$Res>;
  @override
  $Res call({String email, String username, String token, String? image});
}

/// @nodoc
class __$UserResponseCopyWithImpl<$Res> extends _$UserResponseCopyWithImpl<$Res>
    implements _$UserResponseCopyWith<$Res> {
  __$UserResponseCopyWithImpl(
      _UserResponse _value, $Res Function(_UserResponse) _then)
      : super(_value, (v) => _then(v as _UserResponse));

  @override
  _UserResponse get _value => super._value as _UserResponse;

  @override
  $Res call({
    Object? email = freezed,
    Object? username = freezed,
    Object? token = freezed,
    Object? image = freezed,
  }) {
    return _then(_UserResponse(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserResponse implements _UserResponse {
  const _$_UserResponse(
      {required this.email,
      required this.username,
      required this.token,
      this.image});

  factory _$_UserResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_UserResponseFromJson(json);

  @override
  final String email;
  @override
  final String username;
  @override
  final String token;
  @override
  final String? image;

  @override
  String toString() {
    return 'UserResponse(email: $email, username: $username, token: $token, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserResponse &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(image);

  @JsonKey(ignore: true)
  @override
  _$UserResponseCopyWith<_UserResponse> get copyWith =>
      __$UserResponseCopyWithImpl<_UserResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserResponseToJson(this);
  }
}

abstract class _UserResponse implements UserResponse {
  const factory _UserResponse(
      {required String email,
      required String username,
      required String token,
      String? image}) = _$_UserResponse;

  factory _UserResponse.fromJson(Map<String, dynamic> json) =
      _$_UserResponse.fromJson;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get username => throw _privateConstructorUsedError;
  @override
  String get token => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserResponseCopyWith<_UserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
