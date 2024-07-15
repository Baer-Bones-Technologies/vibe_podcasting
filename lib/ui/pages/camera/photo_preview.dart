import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../di/providers/camera_providers.dart';
import 'camera_preview.dart';

class PhotoPreview extends ConsumerWidget {
  const PhotoPreview({super.key, required this.returnPath});
  static const routeLocation = '${CameraPreview.routeLocation}/photo_preview';
  static const routeName = 'Photo Preview';

  final String returnPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePreview = ref.watch(previewImageProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
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
                          color: Colors.green,
                          iconSize: 50,
                          padding: const EdgeInsets.all(16),
                          onPressed: () async {
                            context.go(returnPath);
                          },
                          icon: const Icon(Icons.check)),
                      const Spacer(),
                      IconButton(
                          color: Colors.white,
                          iconSize: 50,
                          padding: const EdgeInsets.all(16),
                          onPressed: () {
                            context.go(CameraPreview.routeLocation);
                          },
                          icon: const Icon(Icons.cancel_outlined)),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          imagePreview != null ? Image.file(
              File(imagePreview.path),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
            )  : const Center(child: CupertinoActivityIndicator()),
        ],
      ),
    );
  }
}
