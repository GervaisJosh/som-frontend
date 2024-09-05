import 'dart:io';
import 'package:flutter/material.dart';

class ImagePickerProvider extends ChangeNotifier {
  File? _imageFile1;
  File? _imageFile2;
  File? _imageFile3;
  File? _imageFile4;

  int _count = 0;

  int get count => _count;

  File? get imageFile1 => _imageFile1;
  File? get imageFile2 => _imageFile2;
  File? get imageFile3 => _imageFile3;
  File? get imageFile4 => _imageFile4;

  File? getImageFile(int index) {
    switch (index) {
      case 1:
        return _imageFile1;
      case 2:
        return _imageFile2;
      case 3:
        return _imageFile3;
      case 4:
        return _imageFile4;
      default:
        return null;
    }
  }

  void setImageFile(int index, File? image) {
    switch (index) {
      case 1:
        _imageFile1 = image;
        break;
      case 2:
        _imageFile2 = image;
        break;
      case 3:
        _imageFile3 = image;
        break;
      case 4:
        _imageFile4 = image;
        break;
    }
    notifyListeners();
  }

  void resetImages(int index) {
    switch (index) {
      case 1:
        _imageFile1 = null;
        _count--;
        break;
      case 2:
        _imageFile2 = null;
        _count--;
        break;
      case 3:
        _imageFile3 = null;
        _count--;
        break;
      case 4:
        _imageFile4 = null;
        _count--;
        break;
    }
    notifyListeners();
  }

  int get imageCount {
    _count++;
    // if (_imageFile1 != null) _count++;
    // if (_imageFile2 != null) _count++;
    // if (_imageFile3 != null) _count++;
    // if (_imageFile4 != null) _count++;
    return count;
  }

  void clearImages() {
    _imageFile1 = null;
    _imageFile2 = null;
    _imageFile3 = null;
    _imageFile4 = null;
    notifyListeners();
  }

  void resetCount(){
    _count = 0;
    notifyListeners();
  }
}
