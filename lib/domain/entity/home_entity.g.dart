// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeEntityAdapter extends TypeAdapter<HomeEntity> {
  @override
  final int typeId = 0;

  @override
  HomeEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeEntity(
      image: fields[0] as String?,
      mainTitle: fields[1] as String,
      description: fields[2] as String?,
      publishDate: fields[3] as String?,
      author: fields[4] as String?,
      source: fields[5] as String?,
      article: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HomeEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.mainTitle)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.publishDate)
      ..writeByte(4)
      ..write(obj.author)
      ..writeByte(5)
      ..write(obj.source)
      ..writeByte(6)
      ..write(obj.article);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
