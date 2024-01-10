import 'dart:io';

import 'package:edemadetection/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tflite/tflite.dart';

class Screen1 extends StatefulWidget {
  final Items item;

  Screen1(this.item);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  File? imageFile;
  String? filename;
  List? _output;
  late File _image;

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _output = output;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 96, 80, 117),
      appBar: AppBar(
        title: const Text("IMAGE-PICKER"),
      ),
      body: Container(
        child: imageFile == null
            ? Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _getFromGallery();
                      },
                      child: const Text("PICK FROM GALLERY"),
                    ),
                    Container(
                      height: 40.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _getFromCamera();
                      },
                      child: const Text("TAKE PHOTO WITH CAMERA"),
                    )
                  ],
                ),
              )
            : Container(
                child: Image.file(
                  imageFile!,
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }

  void loadModel() async {
    print("Loading models...");
    try {
      await Tflite.loadModel(
        model: "assets/ML/DMEmodel.tflite",
      );
      await Tflite.loadModel(
        model: "assets/ML/lungsmodel.tflite",
      );
      print("Models loaded successfully");
    } catch (e) {
      print("Error loading models: $e");
    }
  }

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        filename = pickedFile.name;
      });

      // Assign _image
      _image = File(pickedFile.path);

      classifyImage(_image);
      await uploadImagetoFirebase(imageFile!);
    }
  }

  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });

      // Assign _image
      _image = File(pickedFile.path);

      classifyImage(_image);
    }
  }

  Future<void> uploadImagetoFirebase(File imageFile) async {
    try {
      await FirebaseStorage.instance
          .ref()
          .child('image/')
          .child(filename!)
          .putFile(imageFile);
    } catch (e) {
      print(e);
    }
  }
}


// import 'dart:io';

// import 'package:edemadetection/screens/dashboard.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:tflite/tflite.dart';

// class Screen1 extends StatefulWidget {
//   final Items item;

//   Screen1(this.item);

//   @override
//   State<Screen1> createState() => _Screen1State();
// }

// class _Screen1State extends State<Screen1> {
//   File? imageFile;
//   String? filename;
//   List? _output;
//   late File _image;

  
// @override
// void initState(){
//   super.initState();
//   loadModel();
// }
//  classifyImage(File image) async {
//     var output = await Tflite.runModelOnImage(
//       path: image.path,
//       numResults: 2,
//       threshold: 0.5,
//       imageMean: 127.5,
//       imageStd: 127.5,
//     );
//     setState(() {
//       _output = output;
//     });
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: const Color.fromARGB(255, 96, 80, 117),
//         appBar: AppBar(
//           title: const Text("IMAGE-PICKER"),
//         ),
//         body: Container(
//             child: imageFile == null
//                 ? Container(
//                     alignment: Alignment.center,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             _getFromGallery();
//                           },
//                           child: const Text("PICK FROM GALLERY"),
//                         ),
//                         Container(
//                           height: 40.0,
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             _getFromCamera();
//                           },
//                           child: const Text("TAKE PHOTO WITH CAMERA"),
//                         )
//                       ],
//                     ),
//                   )
//                 : Container(
//                     child: Image.file(
//                       imageFile!,
//                       fit: BoxFit.cover,
//                     ),
//                   )));
//   }


// void loadModel() async {
//   print("Loading models...");
//   try {
//     await Tflite.loadModel(
//       model: "assets/Images/DMEmodel.tflite",
//     );
//     await Tflite.loadModel(
//       model: "assets/Images/lungsmodel.tflite",
//     );
//     print("Models loaded successfully");
//   } catch (e) {
//     print("Error loading models: $e");
//   }
// }

// void makePrediction(input) async {
//   var output = await Tflite.runModelOnFrame(
//     bytesList: input,
//   );
//   print(output);
// }

// void disposeModel() {
//   Tflite.close();
// }
//   /// Get from gallery
//   _getFromGallery() async {
//   XFile? pickedFile = await ImagePicker().pickImage(
//     source: ImageSource.gallery,
//   );
//   if (pickedFile != null) {
//     setState(() {
//       imageFile = File(pickedFile.path);
//       filename = pickedFile.name;
//     });

//     // Missing assignment of _image
//     _image = File(pickedFile.path);

//     classifyImage(_image);
//     await uploadImagetoFirebase(imageFile!);
//   }
// }

// _getFromCamera() async {
//   XFile? pickedFile = await ImagePicker().pickImage(
//     source: ImageSource.camera,
//   );
//   if (pickedFile != null) {
//     setState(() {
//       imageFile = File(pickedFile.path);
//     });

//     // Missing assignment of _image
//     _image = File(pickedFile.path);

//     classifyImage(_image);
//   }
// }


//   Future<void> uploadImagetoFirebase(File imageFile) async {
//     try {
//       await FirebaseStorage.instance
//           .ref()
//           .child('image/')
//           .child(filename!)
//           .putFile(imageFile);
//     } catch (e) {
//       print(e);
//     }
//   }
// }
