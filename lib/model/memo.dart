import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'memo.freezed.dart';

@freezed
class Memo with _$Memo {
  const factory Memo(
      {required String id,
      required String title,
      required String detail,
      required Timestamp createdDate,
      Timestamp? updatedDate}) = _Memo;
}
