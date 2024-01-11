import 'package:hive/hive.dart';

part 'map_store.g.dart';

@HiveType(typeId: 3)
class MapStore extends HiveObject {
  @HiveField(0)
  Map<String, dynamic> data;
  MapStore(this.data);
  @override
  String toString() {
    return 'MapStore{data: $data}';
  }
}
