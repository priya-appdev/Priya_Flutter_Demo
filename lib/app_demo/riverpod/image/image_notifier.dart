import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:counter_app/app_demo/services/image_picker_service.dart';
import 'image_state.dart';

class ImageNotifier extends StateNotifier<ImageState>{

  ImageNotifier() : super(ImageState());

}