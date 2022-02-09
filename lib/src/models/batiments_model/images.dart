/*
 * @Author: Boris Gautier 
 * @Date: 2022-02-09 13:47:26 
 * @Last Modified by:   Boris Gautier 
 * @Last Modified time: 2022-02-09 13:47:26 
 */
import 'package:json_annotation/json_annotation.dart';

import 'image.dart';

part 'images.g.dart';

@JsonSerializable()
class Images {
  bool? success;
  Image? data;
  String? message;

  Images({this.success, this.data, this.message});

  @override
  String toString() {
    return 'Images(success: $success, data: $data, message: $message)';
  }

  factory Images.fromJson(Map<String, dynamic> json) {
    return _$ImagesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ImagesToJson(this);

  Images copyWith({
    bool? success,
    Image? data,
    String? message,
  }) {
    return Images(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
