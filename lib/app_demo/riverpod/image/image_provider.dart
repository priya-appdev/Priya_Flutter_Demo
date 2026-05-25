import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'image_notifier.dart';
import 'image_state.dart';

final imageProvider = StateNotifierProvider<ImageNotifier, ImageState>((ref) {
  return ImageNotifier();
});
