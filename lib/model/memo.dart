import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_memo_app/model/json_converter/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'memo.freezed.dart';
part 'memo.g.dart';

@freezed
class Memo with _$Memo {
  const factory Memo(
      {required String title,
      required String detail,
      @TimestampConverter() required DateTime createdDate,
      @TimestampConverter() DateTime? updatedDate}) = _Memo;

  factory Memo.fromJson(Map<String, dynamic> json) => _$MemoFromJson(json);
}
