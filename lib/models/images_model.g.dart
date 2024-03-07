// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixelformImage _$PixelformImageFromJson(Map<String, dynamic> json) =>
    PixelformImage(
      id: json['id'] as String,
      title: json['title'] as String?,
      filename: json['filename'] as String,
      urlFullSize: json['url_full_size'] as String,
      urlSmallSize: json['url_small_size'] as String,
    );

Map<String, dynamic> _$PixelformImageToJson(PixelformImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'title': instance.title,
      'url_full_size': instance.urlFullSize,
      'url_small_size': instance.urlSmallSize,
    };
