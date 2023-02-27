// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Memo _$$_MemoFromJson(Map<String, dynamic> json) => _$_Memo(
      title: json['title'] as String,
      detail: json['detail'] as String,
      createdDate:
          const TimestampConverter().fromJson(json['createdDate'] as Timestamp),
      updatedDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['updatedDate'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$_MemoToJson(_$_Memo instance) => <String, dynamic>{
      'title': instance.title,
      'detail': instance.detail,
      'createdDate': const TimestampConverter().toJson(instance.createdDate),
      'updatedDate': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.updatedDate, const TimestampConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
