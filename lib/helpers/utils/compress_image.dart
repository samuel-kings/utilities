import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:sk_utilities/constants/enums.dart';

class ImageCompressor {
  final _defaultCompressedImage = CompressedImage(type: SKCompressedImageType.file, image: null, errorMessage: null);

  /// this is used because the compress image package does not support windows and linux
  bool _isWindowsOrLinux() {
    return Platform.isWindows || Platform.isLinux;
  }

  /// compress file and get file
  /// Note: This method is not supported on Web
  Future<CompressedImage?> compressAndGetFile(File file, String targetPath, [ImageOptions? options]) async {
    CompressedImage compressedImage = _defaultCompressedImage;
    options ??= ImageOptions();

    if (kIsWeb) {
      compressedImage.errorMessage = "Web is not supported for file compression, please use Uint8List";
      return compressedImage;
    } else if (_isWindowsOrLinux()) {
      compressedImage.errorMessage = "Windows and Linux are not supported by flutter_image_compress package";
      return compressedImage;
    }

    try {
      final result = await FlutterImageCompress.compressAndGetFile(
        file.path,
        targetPath,
        minWidth: options.minWidth,
        minHeight: options.minHeight,
        quality: options.quality,
        rotate: options.rotate,
        format: options.format,
        autoCorrectionAngle: options.autoCorrectionAngle,
        keepExif: options.keepExif,
        inSampleSize: options.inSampleSize,
      );

      if (result != null) {
        compressedImage.image = File(result.path);
      } else {
        compressedImage.errorMessage = 'Failed to compress image';
      }
    } on CompressError catch (e) {
      compressedImage.errorMessage = e.message;
    } catch (e) {
      compressedImage.errorMessage = e.toString();
    }

    return compressedImage;
  }

  /// compress file and get Uint8List
  /// Note: This method is not supported on Web
  Future<CompressedImage?> compresFileGetUint8List(File file, [ImageOptions? options]) async {
    CompressedImage compressedImage = _defaultCompressedImage;
    options ??= ImageOptions();

    if (kIsWeb) {
      compressedImage.errorMessage = "Web is not supported for file compression, please use Uint8List";
      return compressedImage;
    } else if (_isWindowsOrLinux()) {
      compressedImage.errorMessage = "Windows and Linux are not supported by flutter_image_compress package";
      return compressedImage;
    }

    try {
      final result = await FlutterImageCompress.compressWithFile(
        file.path,
        minWidth: options.minWidth,
        minHeight: options.minHeight,
        quality: options.quality,
        rotate: options.rotate,
        format: options.format,
        autoCorrectionAngle: options.autoCorrectionAngle,
        keepExif: options.keepExif,
        inSampleSize: options.inSampleSize,
      );

      if (result != null) {
        compressedImage.type = SKCompressedImageType.uint8List;
        compressedImage.image = result;
      } else {
        compressedImage.errorMessage = 'Failed to compress image';
      }
    } on CompressError catch (e) {
      compressedImage.errorMessage = e.message;
    } catch (e) {
      compressedImage.errorMessage = e.toString();
    }

    return compressedImage;
  }

  /// compress Uint8List and get Uint8List
  Future<CompressedImage?> compressAndGetUint8List(Uint8List data, [ImageOptions? options]) async {
    CompressedImage compressedImage = _defaultCompressedImage;
    options ??= ImageOptions();

    if (kIsWeb) {
      // check for heic format
      if (options.format == CompressFormat.heic) {
        compressedImage.errorMessage = "Web is not supported for heic format";
        return compressedImage;
      }

      // check for rotate
      if (options.rotate != 0) {
        compressedImage.errorMessage = "Web is not supported for rotate";
        return compressedImage;
      }

      // check for keepExif
      if (options.keepExif) {
        compressedImage.errorMessage = "Web is not supported for keepExif";
        return compressedImage;
      }
    } else {
      if (_isWindowsOrLinux()) {
        compressedImage.errorMessage = "Windows and Linux are not supported by flutter_image_compress package";
        return compressedImage;
      }

      // check for MacOS unsupported features
      if (Platform.isMacOS) {
        // if webp format
        if (options.format == CompressFormat.webp) {
          compressedImage.errorMessage = "MacOS is not supported for webp format";
          return compressedImage;
        }
      }
    }

    try {
      final result = await FlutterImageCompress.compressWithList(
        data,
        minWidth: options.minWidth,
        minHeight: options.minHeight,
        quality: options.quality,
        rotate: options.rotate,
        format: options.format,
        autoCorrectionAngle: options.autoCorrectionAngle,
        keepExif: options.keepExif,
        inSampleSize: options.inSampleSize,
      );

      compressedImage.type = SKCompressedImageType.uint8List;
      compressedImage.image = result;
    } on CompressError catch (e) {
      compressedImage.errorMessage = e.message;
    } catch (e) {
      compressedImage.errorMessage = e.toString();
    }

    return compressedImage;
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

class CompressedImage {
  SKCompressedImageType type;
  dynamic image;
  String? errorMessage;

  CompressedImage({
    required this.type,
    required this.image,
    this.errorMessage,
  });
}

class ImageOptions {
  int minWidth;
  int minHeight;
  int inSampleSize;
  int quality;
  int rotate;
  bool autoCorrectionAngle;
  CompressFormat format;
  bool keepExif;
  int numberOfRetries;

  ImageOptions({
    this.minWidth = 1920,
    this.minHeight = 1080,
    this.inSampleSize = 1,
    this.quality = 95,
    this.rotate = 0,
    this.autoCorrectionAngle = true,
    this.format = CompressFormat.jpeg,
    this.keepExif = false,
    this.numberOfRetries = 5,
  });
}
