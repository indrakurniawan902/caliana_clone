import 'package:caliana_clone/screen/identity/review_data_argument.dart';
import 'package:caliana_clone/screen/identity/selfie_argument.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class SelfieScreen extends StatefulWidget {
  const SelfieScreen({super.key});

  @override
  State<SelfieScreen> createState() => _SelfieScreenState();
}

class _SelfieScreenState extends State<SelfieScreen> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  int direction = 0;

  @override
  void initState() {
    startCamera(direction);
    super.initState();
  }

  void startCamera(int direction) async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {}); //To refresh widget
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SelfieArgument;
    final size = MediaQuery.of(context).size;
    if (cameraController.value.isInitialized) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Ambil Foto Wajah",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Stack(
          children: [
            const Positioned.fill(
                child: Align(
              alignment: Alignment.topCenter,
              child: Text("Tempatkan Wajah Anda di tengah area selfie"),
            )),
            Positioned.fill(
                child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                  height: size.width,
                  width: size.height,
                  child: CameraPreview(
                    cameraController,
                  )),
            )),
            GestureDetector(
              onTap: () {
                setState(() {
                  direction = direction == 0 ? 1 : 0;
                  startCamera(direction);
                });
              },
              child:
                  button(Icons.flip_camera_ios_outlined, Alignment.bottomLeft),
            ),
            GestureDetector(
              onTap: () {
                cameraController.takePicture().then((XFile? file) {
                  if (mounted) {
                    if (file != null) {
                      Navigator.pushNamed(context, "/review",
                          arguments: ReviewDataArgument(
                            accessCardNumber: args.accessCardNumber,
                            identityCardNumber: args.identityCardNumber,
                              cardName: args.cardName,
                              filePathCard: args.filePathCard,
                              name: args.name,
                              email: args.email,
                              selfiePath: file.path));
                      print("Picture saved to ${file.path}");
                    }
                  }
                });
              },
              child: button(Icons.camera_alt_outlined, Alignment.bottomCenter),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget button(IconData icon, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
          bottom: 20,
        ),
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
