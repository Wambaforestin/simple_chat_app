import 'package:json_annotation/json_annotation.dart';

part 'images_model.g.dart';

@JsonSerializable()
class PixelformImage {
  String id;
  String filename;
  String? title;

  @JsonKey(name: 'url_full_size')
  String urlFullSize;

  @JsonKey(name: 'url_small_size')
  String urlSmallSize;

  PixelformImage(
      {required this.id,
      this.title,
      required this.filename,
      required this.urlFullSize,
      required this.urlSmallSize});

       factory PixelformImage.fromJson(Map<String, dynamic> json) => _$PixelformImageFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PixelformImageToJson(this);
}
