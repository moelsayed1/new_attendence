import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_attendence/l10n/app_localizations.dart'; // Assuming AppLocalizations is needed
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class FaceImageScreen extends StatefulWidget {
  const FaceImageScreen({super.key});

  @override
  State<FaceImageScreen> createState() => _FaceImageScreenState();
}

class _FaceImageScreenState extends State<FaceImageScreen> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;
  File? _capturedImage;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    if (_cameras != null && _cameras!.isNotEmpty) {
      _controller = CameraController(
        _cameras![0],
        ResolutionPreset.high,
        enableAudio: false,
      );

      try {
        await _controller!.initialize();
        setState(() {
          _isCameraInitialized = true;
        });
      } catch (e) {
        print('Error initializing camera: $e');
      }
    }
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }

    try {
      final XFile photo = await _controller!.takePicture();
      final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
      final Directory appDir = await getApplicationDocumentsDirectory();
      final String fileName = 'face_image_$timestamp.jpg';
      final String filePath = path.join(appDir.path, fileName);

      // Copy the captured image to the app's documents directory
      await File(photo.path).copy(filePath);
      
      setState(() {
        _capturedImage = File(filePath);
      });

      // Show success dialog
      _showSuccessDialog();

      // TODO: Here you can implement the API call to save the image
      // You can access the image file at _capturedImage.path
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              gradient: LinearGradient(
                begin: Alignment(0.50, -0.00),
                end: Alignment(0.50, 1.00),
                colors: [const Color(0xFFDBD5FF), Colors.white],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF7E6DEA),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 40.w,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'تم التقاط الصورة بنجاح',
                  style: TextStyle(
                    color: const Color(0xFF0E0E0E),
                    fontSize: 18.sp,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF27B6E3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    minimumSize: Size(200.w, 45.h),
                  ),
                  child: Text(
                    'حسناً',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 375.w, // Responsive width
        height: 812.h, // Responsive height
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.50, -0.00),
            end: Alignment(0.50, 1.00),
            colors: [const Color(0xFFDBD5FF), Colors.white],
          ),
        ),
        child: Stack(
          children: [
            // Top Bar Section
            Positioned(
              left: 0.w,
              top: 0.h,
              child: Container(
                width: 375.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Status Bar Placeholder
                    Container(
                      width: double.infinity,
                      height: 44.h,
                      // This stack is for the 5:13, 76% battery etc. details.
                      // For now, it's a placeholder. You might integrate a package for this later.
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0.w,
                            top: 0.h,
                            child: Container(width: 375.w, height: 44.h),
                          ),
                          Positioned(
                            left: 327.w,
                            top: 15.h,
                            child: Container(
                              width: 16.w,
                              height: 13.h,
                              decoration: ShapeDecoration(
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.r),
                                    bottomLeft: Radius.circular(4.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 331.w,
                            top: 15.h,
                            child: Text(
                              '76',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w700,
                                height: 1.30,
                                letterSpacing: 0.06.sp,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 39.50.w,
                            top: 13.h,
                            child: Text(
                              '5:13',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.17.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // AppBar Section: "يلا البصمة"
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF7E6DEA), // Violet color from image
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 24.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://placehold.co/24x24"), // Placeholder emoji
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            ' يلا البصمة',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w700,
                              height: 1.20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Camera Preview or Captured Image
            Positioned(
              left: 99.w,
              top: 193.h,
              child: Container(
                width: 178.w,
                height: 178.h,
                decoration: ShapeDecoration(
                  color: const Color(0x3F859AAB),
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 1.w,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: const Color(0xFF27B6E3),
                    ),
                  ),
                ),
                child: ClipOval(
                  child: _capturedImage != null
                      ? Image.file(_capturedImage!, fit: BoxFit.cover)
                      : _isCameraInitialized
                          ? CameraPreview(_controller!)
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                ),
              ),
            ),
            // "يلا سيلفي" Button
            Positioned(
              left: 16.w,
              top: 428.h,
              child: GestureDetector(
                onTap: _takePicture,
                child: Container(
                  width: 343.w,
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7.h),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF27B6E3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 24.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://placehold.co/24x24"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'يلا سيلفي',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 