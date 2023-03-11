// Null assertion ==> !
// conditional property access operator ==> ?
// null coalescing operators ==> ??

//example
void main() {
  int? stringLength(String? nullableString) {
    return nullableString?.length;
  }

  String? value = null;
  print(value);

  String? nullableString = null;
  String nonNullAbleString = nullableString!;
  // String? nullableString = "null";

  print(nullableString ?? 'alternate');
  print(nullableString != null ? nullableString : 'alternate');
}
