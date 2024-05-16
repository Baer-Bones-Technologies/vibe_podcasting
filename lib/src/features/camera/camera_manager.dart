import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class CameraManager {
  CameraManager({
    required this.cameras,
    required this.controller,
  });

  final List<CameraDescription>? cameras;
  CameraController? controller;
  CameraDescription? get currentCamera => cameras?.first;

  initialize() async => await controller?.initialize();
  Future<XFile?> takePicture() async => await controller?.takePicture();
  Future<void> dispose() async => await controller?.dispose();


  Widget buildPreview({Widget? child}) {
    return FutureBuilder(
      future: initialize(),
      builder: (context, state) {
        if (state.connectionState == ConnectionState.done) {
          return controller != null ? CameraPreview(
            controller!,
            key: const Key('camera_preview'),
            child: child,
          ) : const Center(
            child: Text('No camera found'),
          );
        }
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }

void toggleCamera() {
    final camera = cameras?.firstWhere((element) => element != currentCamera);
    controller?.dispose();
    controller = camera != null ? CameraController(camera, ResolutionPreset.max) : null;
    controller?.initialize();
  }
}
