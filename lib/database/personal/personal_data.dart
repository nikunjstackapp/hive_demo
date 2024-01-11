import 'package:hive/hive.dart';
part 'personal_data.g.dart';

@HiveType(typeId: 2)
class PersonalData extends HiveObject {
  @HiveField(0)
  String? office;
  @HiveField(1)
  String? contact;

  PersonalData({this.office, this.contact});

  @override
  String toString() {
    return 'PersonalData{office: $office, contact: $contact}';
  }
}
