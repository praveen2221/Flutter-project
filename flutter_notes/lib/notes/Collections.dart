import 'dart:collection';

void main() {
  /// Collections

//   Map
//   Set
//   List
//   LinkedList
//   Queue
  //                    0       1
  List<String> fruits = ["Apple", "grapes"];
  print(fruits.reversed);

  //    key     value
  Map<String, String> name = {"name1": "Madhu", "name2": "Test"};
//   print(fruits[0]);
//   print(name["name1"]);

  // Map

  // 1.HashMap
  // 2.LinkedHashMap
  // 3.SplayTreeMap
  // 4.UnmodifiableMapView

  // 1.HashMap & 2.LinkedHashMap ------------------

  final Map<int, String> planets = HashMap();

  planets[3] = 'Earth'; // {3:"Earth"}

  planets.addAll({4: 'Mars', 1: 'Mars'});

  final gasGiants = {5: 'Jupiter', 5: 'Saturn'};

  planets.addEntries(gasGiants.entries);

//    print(planets);
//    print(planets.isEmpty);
//    print(planets.isNotEmpty);

//   planets.forEach((key,value){
//     print(value);

//   });

  print(planets.containsKey(4));

  // planets.remove(4);

  planets.update(1, (v) => 'Venus');
//  planets.clear();
  print(planets);
  print(planets.length);
//   3.SplayTreeMap --------------
  final planetsByMass = SplayTreeMap<double, String>((a, b) => a.compareTo(b));

//4.UnmodifiableMapView
  planets.remove(4);

// SET ---------------------------------
  final letters = HashSet<String>();

  letters.add("Apple");
  letters.addAll({'Mango', 'C', 'D'});
//   print(letters);
//     print(letters.isEmpty);
//    print(letters.isNotEmpty);
//    print(letters.length);
  // print(letters.contains('B'));

//  letters.forEach(print);
  final anotherSet = letters.toSet();
  // print(anotherSet);
  letters.remove('B');
  letters.removeWhere((element) => element.startsWith('Ap'));
  // print(letters);
//  final anotherSet = <String>{};

  /// Splay Tree Set

  final planetData = SplayTreeSet<String>((a, b) => a.compareTo(b));

  planetData.addAll({'Venus', 'Mars', 'Earth', 'Jupiter'});

  final elementAt = planetData.elementAt(1);
//  print(elementAt);

//   Queue

//     1.Queue
//     2.ListQueue
//     3.DoubleLinkedQueue
  final queue = Queue<int>();
  final queueList = ListQueue<int>();

  //print(planets.runtimeType);

  queueList.addAll([1, 2, 3]);
  queueList.addFirst(0);
  queueList.addLast(10);
//   queueList.removeFirst();
//   queueList.removeLast();
  print(queueList);
  print(queueList.toList());

  final numbers = <int>[10, 20, 30];
}
