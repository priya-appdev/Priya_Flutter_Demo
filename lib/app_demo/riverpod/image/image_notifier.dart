import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counter_app/app_demo/services/image_picker_service.dart';
import 'package:image_picker/image_picker.dart';
import 'image_state.dart';

class ImageNotifier extends StateNotifier<ImageState> {
  ImageNotifier() : super(ImageState());

  final _service = ImagePickerService();

  Future<void> pickImageFromGallery() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final file = await _service.pickFromGallery();

      if (file == null) {
        state = state.copyWith(isLoading: false);
        return;
      }
      state = state.copyWith(selectedImage: file, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to [ick image $e',
      );
    }
  }

  Future<void> pickImageFromCamera() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final file = await _service.pickFromCamera();
      if (file == null) {
        state = state.copyWith(isLoading: false);
        return;
      }

      state = state.copyWith(isLoading: false, selectedImage: file);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to capture image $e',
      );
    }
  }

  //MARK: REFACTOR THE CODE OF CAMERA AND GALLERY

  Future<void> pickImage(ImageSource source) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final file = await _service.pickImage(source);

      if (file == null) {
        state = state.copyWith(isLoading: false);
      }
      state = state.copyWith(selectedImage: file, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to pick image $e',
      );
    }
  }

  void clearImage() {
    state = ImageState();
  }
}
