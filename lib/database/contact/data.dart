import 'package:hive/hive.dart';

part 'data.g.dart';

@HiveType(typeId: 1)
class Data extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String contact;

  Data(this.name, this.contact);

  @override
  String toString() {
    return 'data{name: $name, con: $contact}';
  }
}
