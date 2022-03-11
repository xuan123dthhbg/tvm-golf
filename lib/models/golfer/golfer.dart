import 'package:json_annotation/json_annotation.dart';
part 'golfer.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Golfer {
  String? id;
  String? fullName;
  String? avatar;
  String? cover;
  double? handicap;
  double? idx;

  Golfer({this.cover,
    this.avatar,
    this.fullName,
    this.handicap,
    this.idx,
    this.id});
  factory Golfer.fromJson(Map<String, dynamic> json) => _$GolferFromJson(json);

  Map<String, dynamic> toJson() => _$GolferToJson(this);
}
