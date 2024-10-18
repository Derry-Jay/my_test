import 'package:image_picker/image_picker.dart';

import 'enums.dart';

class MyMediaPicker extends ImagePicker {
  static final MyMediaPicker _singleton = MyMediaPicker._internal();

  factory MyMediaPicker() => _singleton;

  MyMediaPicker._internal();

  Future<LostDataResponse> get lostDataResponse => retrieveLostData();

  Future<List<XFile>> pickManyMedia(
      {int? limit,
      PickType? type,
      double? maxWidth,
      double? maxHeight,
      int? imageQuality,
      bool? requestFullMetadata}) {
    switch (type) {
      case PickType.image:
        return pickMultiImage(
            limit: limit,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: imageQuality,
            requestFullMetadata: requestFullMetadata ?? true);
      default:
        return pickMultipleMedia(
            limit: limit,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: imageQuality,
            requestFullMetadata: requestFullMetadata ?? true);
    }
  }
}
