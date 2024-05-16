import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../src/features/camera/camera_manager.dart';

final cameraGroupProvider =
    FutureProvider<List<CameraDescription>>((ref) async => await availableCameras());

final cameraManagerProvider = Provider<CameraManager?>((ref) {
  final cameras = ref.watch(cameraGroupProvider);
  CameraController? controller;
  if (!cameras.isLoading && cameras.valueOrNull != null) {
    controller = CameraController(cameras.value!.first, ResolutionPreset.max);
  }

  return controller != null
      ? CameraManager(
          cameras: cameras.value,
          controller: controller,
        )
      : null;
});

final previewImageProvider = StateProvider<XFile?>((ref) => null);

