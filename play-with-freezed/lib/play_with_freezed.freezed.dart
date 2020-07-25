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
