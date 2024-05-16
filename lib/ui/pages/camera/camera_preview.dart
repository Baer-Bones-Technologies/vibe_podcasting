import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe_podcasting/ui/pages/camera/photo_preview.dart';
import 'package:vibe_podcasting/ui/providers/camera_providers.dart';

class CameraPreview extends ConsumerStatefulWidget {
  const CameraPreview({super.key, this.returnPath = ''});
  static const routeLocation = '/camera_preview';
  static const routeName = 'Camera Preview';

  final String returnPath;

  @override
  ConsumerState<CameraPreview> createState() => _CameraPreviewState();
}

class _CameraPreviewState extends ConsumerState<CameraPreview> {
@override
  Widget build(BuildContext context) {
    final cameraController = ref.watch(cameraManagerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            ref.read(previewImageProvider.notifier).state = null;
            context.pop();
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Spacer(),
                      IconButton(
                          color: Colors.white,
                          iconSize: 50,
                          padding: const EdgeInsets.all(16),
                          onPressed: () async {
                             await cameraController
                                    ?.takePicture()
                                    .then((value) {
                                      if(value != null) {
                                        ref.read(previewImageProvider.notifier).state = value;
                                            context.push(
                                            PhotoPreview.routeLocation, extra: widget.returnPath);
                                      }
                            });
                          },
                          icon: const Icon(Icons.camera_alt),
                          style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            backgroundColor: WidgetStateProperty.all(
                                Colors.white.withOpacity(0.5)),
                          )),
                      const SizedBox(width: 16),
                      IconButton(
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                          cameraController?.toggleCamera();
                        });
                          },
                        icon: const Icon(Icons.flip_camera_ios),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            child: cameraController?.buildPreview() ??
                const CupertinoActivityIndicator(),
          ),
        ],
      ),
    );
  }
}
