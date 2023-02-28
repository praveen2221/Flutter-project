import 'dart:collection';

class StudentsDetails extends LinkedListEntry<StudentsDetails>{
  final String name;
  final int age;
  final String gender;
  StudentsDetails(this.name,this.age,this.gender);
  
  String toString(){
    return '$name : $age : $gender';
  }
}

void main() {
  final peopleList =LinkedList<StudentsDetails>();
  peopleList.addAll([StudentsDetails('Alice',25,'female'),StudentsDetails('Bob',30,'male'),StudentsDetails('Charlie',40,'male')]);
  for(var entry in peopleList){
    
    print(entry);
  }
  print("------Age------");
  peopleList.forEach((entry){
    print(entry.age);
  });
 
}
