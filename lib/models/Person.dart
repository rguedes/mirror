
class Person {

  final String id;
  final String name;
  final String avatar;

  Person(this.id, this.name, this.avatar);

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      json['id'],
      json['name'],
      json['avatar'],
    );
  }
}