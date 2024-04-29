// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavorateAdapter extends TypeAdapter<Favorate> {
  @override
  final int typeId = 2;

  @override
  Favorate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Favorate(
      id: fields[0] as String,
      name: fields[1] as String,
      imageUrl: fields[2] as String,
      price: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Favorate obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavorateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
