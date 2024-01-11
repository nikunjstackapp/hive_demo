import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hive_demo/database/list/list_store.dart';
import 'package:hive_demo/database/map/map_store.dart';
import 'package:path_provider/path_provider.dart';

import 'database/contact/data.dart';
import 'database/personal/personal_data.dart';

class Database {
  Database._privateConstructor();

  static final Database instance = Database._privateConstructor();

  late Box _singleBox = Hive.box('singleBox');
  late Box<Data> _box;
  late Box<MapStore> _mapBox;
  late Box<ListStore> _listBox;

  Future<void> inItHive() async {
    Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentsDir.path);

    //Define Adapter
    Hive.registerAdapter(DataAdapter());
    Hive.registerAdapter(PersonalDataAdapter());
    Hive.registerAdapter(MapStoreAdapter());
    Hive.registerAdapter(ListStoreAdapter());

    //open Boxes
    _box = await Hive.openBox('CDMI');
    _singleBox = await Hive.openBox('singleBox');

    _mapBox = await Hive.openBox('mapStore');
    _listBox = await Hive.openBox('listStore');
  }

  Future<void> addKeyValue(String key, String value) async {
    await _singleBox.put(key, value);
  }

  Future<String?> getKeyValue(String key) async {
    return await _singleBox.get(key);
  }

  void updateKeyValue(String key, String value) {
    if (_singleBox.containsKey(key)) {
      _singleBox.put(key, value);
    } else {
      print('Key not found.');
    }
  }

  Future<void> deleteKeyValue(String key) async {
    if (_singleBox.containsKey(key)) {
      await _singleBox.delete(key);
    } else {
      print('Key not found.');
    }
  }

  // CREATE
  Future<void> addData(Data data) async {
    await _box.add(data);
  }

  Future<void> addMapData(MapStore data) async {
    await _mapBox.add(data);
  }

  Future<void> addListData(ListStore data) async {
    await _listBox.add(data);
  }

  // READ
  List<Data> getData() {
    return _box.values.toList();
  }

  // UPDATE
  Future<void> updateData(int index, Data data) async {
    await _box.putAt(index, data);
  }

  // DELETE
  Future<void> deleteData(int index) async {
    await _box.deleteAt(index);
  }

  // Close the Hive box when no longer needed
  Future<void> closeBox() async {
    await _box.close();
  }
}
