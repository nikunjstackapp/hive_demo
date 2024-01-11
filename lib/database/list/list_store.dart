import 'package:hive/hive.dart';

part 'list_store.g.dart';

@HiveType(typeId: 4)
class ListStore extends HiveObject {
  @HiveField(0)
  List<dynamic> data;
  ListStore(this.data);
  @override
  String toString() {
    return 'ListStore{data: $data}';
  }
}