// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'play_with_freezed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ResultTearOff {
  const _$ResultTearOff();

// ignore: unused_element
  Some<T> some<T>(T result) {
    return Some<T>(
      result,
    );
  }

// ignore: unused_element
  None<T> none<T>() {
    return None<T>();
  }
}

// ignore: unused_element
const $Result = _$ResultTearOff();

mixin _$Result<T> {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result some(T result),
    @required Result none(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result some(T result),
    Result none(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result some(Some<T> value),
    @required Result none(None<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result some(Some<T> value),
    Result none(None<T> value),
    @required Result orElse(),
  });
}

abstract class $ResultCopyWith<T, $Res> {
  factory $ResultCopyWith(Result<T> value, $Res Function(Result<T>) then) =
      _$ResultCopyWithImpl<T, $Res>;
}

class _$ResultCopyWithImpl<T, $Res> implements $ResultCopyWith<T, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<T> _value;
  // ignore: unused_field
  final $Res Function(Result<T>) _then;
}

abstract class $SomeCopyWith<T, $Res> {
  factory $SomeCopyWith(Some<T> value, $Res Function(Some<T>) then) =
      _$SomeCopyWithImpl<T, $Res>;
  $Res call({T result});
}

class _$SomeCopyWithImpl<T, $Res> extends _$ResultCopyWithImpl<T, $Res>
    implements $SomeCopyWith<T, $Res> {
  _$SomeCopyWithImpl(Some<T> _value, $Res Function(Some<T>) _then)
      : super(_value, (v) => _then(v as Some<T>));

  @override
  Some<T> get _value => super._value as Some<T>;

  @override
  $Res call({
    Object result = freezed,
  }) {
    return _then(Some<T>(
      result == freezed ? _value.result : result as T,
    ));
  }
}

class _$Some<T> implements Some<T> {
  const _$Some(this.result) : assert(result != null);

  @override
  final T result;

  @override
  String toString() {
    return 'Result<$T>.some(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Some<T> &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(result);

  @override
  $SomeCopyWith<T, Some<T>> get copyWith =>
      _$SomeCopyWithImpl<T, Some<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result some(T result),
    @required Result none(),
  }) {
    assert(some != null);
    assert(none != null);
    return some(result);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result some(T result),
    Result none(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (some != null) {
      return some(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result some(Some<T> value),
    @required Result none(None<T> value),
  }) {
    assert(some != null);
    assert(none != null);
    return some(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result some(Some<T> value),
    Result none(None<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (some != null) {
      return some(this);
    }
    return orElse();
  }
}

abstract class Some<T> implements Result<T> {
  const factory Some(T result) = _$Some<T>;

  T get result;
  $SomeCopyWith<T, Some<T>> get copyWith;
}

abstract class $NoneCopyWith<T, $Res> {
  factory $NoneCopyWith(None<T> value, $Res Function(None<T>) then) =
      _$NoneCopyWithImpl<T, $Res>;
}

class _$NoneCopyWithImpl<T, $Res> extends _$ResultCopyWithImpl<T, $Res>
    implements $NoneCopyWith<T, $Res> {
  _$NoneCopyWithImpl(None<T> _value, $Res Function(None<T>) _then)
      : super(_value, (v) => _then(v as None<T>));

  @override
  None<T> get _value => super._value as None<T>;
}

class _$None<T> implements None<T> {
  const _$None();

  @override
  String toString() {
    return 'Result<$T>.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is None<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result some(T result),
    @required Result none(),
  }) {
    assert(some != null);
    assert(none != null);
    return none();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result some(T result),
    Result none(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result some(Some<T> value),
    @required Result none(None<T> value),
  }) {
    assert(some != null);
    assert(none != null);
    return none(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result some(Some<T> value),
    Result none(None<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class None<T> implements Result<T> {
  const factory None() = _$None<T>;
}

class _$PersonTearOff {
  const _$PersonTearOff();

// ignore: unused_element
  _Person call(
      {String firstName,
      String lastName,
      int age,
      String favoriteFood,
      String zipcode}) {
    return _Person(
      firstName: firstName,
      lastName: lastName,
      age: age,
      favoriteFood: favoriteFood,
      zipcode: zipcode,
    );
  }
}

// ignore: unused_element
const $Person = _$PersonTearOff();

mixin _$Person {
  String get firstName;
  String get lastName;
  int get age;
  String get favoriteFood;
  String get zipcode;

  $PersonCopyWith<Person> get copyWith;
}

abstract class $PersonCopyWith<$Res> {
  factory $PersonCopyWith(Person value, $Res Function(Person) then) =
      _$PersonCopyWithImpl<$Res>;
  $Res call(
      {String firstName,
      String lastName,
      int age,
      String favoriteFood,
      String zipcode});
}

class _$PersonCopyWithImpl<$Res> implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._value, this._then);

  final Person _value;
  // ignore: unused_field
  final $Res Function(Person) _then;

  @override
  $Res call({
    Object firstName = freezed,
    Object lastName = freezed,
    Object age = freezed,
    Object favoriteFood = freezed,
    Object zipcode = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
      age: age == freezed ? _value.age : age as int,
      favoriteFood: favoriteFood == freezed
          ? _value.favoriteFood
          : favoriteFood as String,
      zipcode: zipcode == freezed ? _value.zipcode : zipcode as String,
    ));
  }
}

abstract class _$PersonCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$PersonCopyWith(_Person value, $Res Function(_Person) then) =
      __$PersonCopyWithImpl<$Res>;
  @override
  $Res call(
      {String firstName,
      String lastName,
      int age,
      String favoriteFood,
      String zipcode});
}

class __$PersonCopyWithImpl<$Res> extends _$PersonCopyWithImpl<$Res>
    implements _$PersonCopyWith<$Res> {
  __$PersonCopyWithImpl(_Person _value, $Res Function(_Person) _then)
      : super(_value, (v) => _then(v as _Person));

  @override
  _Person get _value => super._value as _Person;

  @override
  $Res call({
    Object firstName = freezed,
    Object lastName = freezed,
    Object age = freezed,
    Object favoriteFood = freezed,
    Object zipcode = freezed,
  }) {
    return _then(_Person(
      firstName: firstName == freezed ? _value.firstName : firstName as String,
      lastName: lastName == freezed ? _value.lastName : lastName as String,
      age: age == freezed ? _value.age : age as int,
      favoriteFood: favoriteFood == freezed
          ? _value.favoriteFood
          : favoriteFood as String,
      zipcode: zipcode == freezed ? _value.zipcode : zipcode as String,
    ));
  }
}

class _$_Person implements _Person {
  _$_Person(
      {this.firstName,
      this.lastName,
      this.age,
      this.favoriteFood,
      this.zipcode});

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final int age;
  @override
  final String favoriteFood;
  @override
  final String zipcode;

  @override
  String toString() {
    return 'Person(firstName: $firstName, lastName: $lastName, age: $age, favoriteFood: $favoriteFood, zipcode: $zipcode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Person &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.favoriteFood, favoriteFood) ||
                const DeepCollectionEquality()
                    .equals(other.favoriteFood, favoriteFood)) &&
            (identical(other.zipcode, zipcode) ||
                const DeepCollectionEquality().equals(other.zipcode, zipcode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(favoriteFood) ^
      const DeepCollectionEquality().hash(zipcode);

  @override
  _$PersonCopyWith<_Person> get copyWith =>
      __$PersonCopyWithImpl<_Person>(this, _$identity);
}

abstract class _Person implements Person {
  factory _Person(
      {String firstName,
      String lastName,
      int age,
      String favoriteFood,
      String zipcode}) = _$_Person;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  int get age;
  @override
  String get favoriteFood;
  @override
  String get zipcode;
  @override
  _$PersonCopyWith<_Person> get copyWith;
}
