import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'etablissement_post.g.dart';

@JsonSerializable()
class EtablissementPost {
  bool? success;
  Data? data;
  String? message;

  EtablissementPost({this.success, this.data, this.message});

  @override
  String toString() {
    return 'EtablissementPost(success: $success, data: $data, message: $message)';
  }

  factory EtablissementPost.fromJson(Map<String, dynamic> json) {
    return _$EtablissementPostFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EtablissementPostToJson(this);

  EtablissementPost copyWith({
    bool? success,
    Data? data,
    String? message,
  }) {
    return EtablissementPost(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}
