import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class CameraManager {
  const CameraManager({
    this.camera,
    required this.controller,
  });

  final CameraDescription? camera;
  final CameraController controller;

  initialize() async => await controller.initialize();
  Future<XFile> takePicture() async => await controller.takePicture();
  Future<void> dispose() async => await controller.dispose();


  Widget buildPreview({Widget? child}) {
    return FutureBuilder(
      future: initialize(),
      builder: (context, state) {
        if (state.connectionState == ConnectionState.done) {
          return CameraPreview(
            controller,
            key: const Key('camera_preview'),
            child: child,
          );
        }
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }
}
