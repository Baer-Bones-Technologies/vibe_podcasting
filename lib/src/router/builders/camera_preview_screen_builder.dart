import 'package:go_router/go_router.dart';

import '../../../ui/pages/camera/camera_preview.dart';

final cameraPreviewScreenBuilder = GoRoute(
  path: CameraPreview.routeLocation,
  name: CameraPreview.routeName,
  builder: (_, state) => CameraPreview(
    returnPath: state.extra as String,
  ),
);