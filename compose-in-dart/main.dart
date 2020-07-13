void main() {
  String appendExclamation(String word) => '$word!';
  int num(String word) => word.length;
  int addOne(int num) => num + 1;

  var composed = pipe().from(appendExclamation).to(num).to(addOne);

  print(composed("wow"));
}

PipeMaker pipe() => PipeMaker();

class PipeMaker {
  Pipe<T, U> from<T, U>(U Function(T) wrappedFn) => Pipe(wrappedFn);
}

class Pipe<T, U> {
  U Function(T) wrappedFn;

  Pipe(U Function(T) wrappedFn) {
    this.wrappedFn = wrappedFn;
  }

  Pipe<T, V> to<V>(V Function(U) input) {
    return Pipe((T arg) => input(wrappedFn(arg)));
  }

  U call(T arg) => wrappedFn(arg);
}
