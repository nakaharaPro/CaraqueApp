//エラーハンドリグ

import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T>{
  const factory Result.success(T value) = Success<T>;//成功した場合に返すインスタンス
  const factory Result.failure() = Failure<T>;

}