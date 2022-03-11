// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'golfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Golfer _$GolferFromJson(Map<String, dynamic> json) {
  return Golfer(
    cover: json['cover'] as String?,
    avatar: json['avatar'] as String?,
    fullName: json['fullName'] as String?,
    handicap: (json['handicap'] as num?)?.toDouble(),
    idx: (json['idx'] as num?)?.toDouble(),
    id: json['id'] as String?,
  );
}

Map<String, dynamic> _$GolferToJson(Golfer instance) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'avatar': instance.avatar,
  'cover': instance.cover,
  'handicap': instance.handicap,
  'idx': instance.idx,
};
