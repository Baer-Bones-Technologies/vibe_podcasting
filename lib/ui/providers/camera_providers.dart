import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cameraGroupProvider = FutureProvider((ref) async {
  await availableCameras();
});
