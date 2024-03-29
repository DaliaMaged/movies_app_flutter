import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class WatchList extends HiveObject{
  @HiveField(0)
  String? posterPath;
  @HiveField(1)
  String? releaseDate;
  @HiveField(2)
  String? title;
  WatchList({required this.releaseDate,this.title,this.posterPath});

  WatchList.fromJson(Map<String, dynamic> json) {
      posterPath = json['posterPath'];
      releaseDate =  json["releaseDate"];
      title = json["title"];

  }

   Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
      map['title'] = title;
      map['posterPath'] = posterPath;
      map['releaseDate'] = releaseDate;
      return map;
  }
}
class WatchListAdapter extends TypeAdapter<WatchList>{
  @override
  WatchList read(BinaryReader reader) {
    final releaseDate = reader.readString();
    final imageUrl = reader.readString();
    final title = reader.readString();
    return WatchList(releaseDate: releaseDate,title: title,posterPath: imageUrl);
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, WatchList obj) {
    writer.writeString(obj.releaseDate ?? "");
    writer.writeString(obj.posterPath ?? "");
    writer.writeString(obj.title ?? "");

  }

}