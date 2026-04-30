import 'dart:io';

class ImageState {

  final File? selectedImage;
  final bool isLoading;
  final String? error;

  ImageState({
    this.selectedImage,
    this.isLoading = false,
    this.error
  });

  ImageState copyWith({
    File? selectedImage,
    bool? isLoading,
    String? error
  }){
    return ImageState(
      selectedImage:  selectedImage ?? this.selectedImage,
      isLoading: isLoading ?? this.isLoading,
      error: error
    );
  }
}