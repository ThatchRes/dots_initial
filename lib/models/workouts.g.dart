// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workouts.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutsAdapter extends TypeAdapter<Workouts> {
  @override
  final int typeId = 0;

  @override
  Workouts read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Workouts(
      name: fields[0] as String,
      setAmount: fields[1] as int,
      cycleName: (fields[2] as List).cast<CycleName>(),
      excersizesContent: (fields[3] as List).cast<ExcersizeContent>(),
      isFavorite: (fields[4] as bool?) ?? false,
    );
  }

  @override
  void write(BinaryWriter writer, Workouts obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.setAmount)
      ..writeByte(2)
      ..write(obj.cycleName)
      ..writeByte(3)
      ..write(obj.excersizesContent)
      ..writeByte(4)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CycleNameAdapter extends TypeAdapter<CycleName> {
  @override
  final int typeId = 1;

  @override
  CycleName read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CycleName(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CycleName obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CycleNameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExcersizeContentAdapter extends TypeAdapter<ExcersizeContent> {
  @override
  final int typeId = 2;

  @override
  ExcersizeContent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExcersizeContent(
      name: fields[0] as String,
      description: fields[1] as String,
      sets: fields[2] as String,
      initNum: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ExcersizeContent obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.sets)
      ..writeByte(3)
      ..write(obj.initNum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExcersizeContentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
