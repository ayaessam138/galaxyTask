import 'package:hive/hive.dart';
part 'home_entity.g.dart';

@HiveType(typeId: 0)
class HomeEntity {
  @HiveField(0)
  String? image;
  @HiveField(1)
  String mainTitle;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? publishDate;
  @HiveField(4)
  final String? author;
  @HiveField(5)
  String? source;
  @HiveField(6)
  String? article;

  HomeEntity(
      {this.image,
      required this.mainTitle,
      this.description,
      this.publishDate,
      this.author,
      this.source,
      this.article});
}
