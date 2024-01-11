// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonalDataAdapter extends TypeAdapter<PersonalData> {
  @override
  final int typeId = 2;

  @override
  PersonalData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonalData(
      office: fields[0] as String?,
      contact: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PersonalData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.office)
      ..writeByte(1)
      ..write(obj.contact);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonalDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
