import 'package:go_router/go_router.dart';

import '../../../ui/pages/camera/photo_preview.dart';

final photoPreviewScreenBuilder = GoRoute(
path: PhotoPreview.routeLocation,
name: PhotoPreview.routeName,
builder: (_, state) => PhotoPreview(
returnPath: state.extra as String,
));