import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/button/custom_button.dart';
import '../../../utils/color.dart';
import '../../../utils/helper_widget.dart';
import '../../vedio_player/player.dart';

class AddVideo extends StatefulWidget {
  const AddVideo({super.key});

  @override
  State<AddVideo> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  File? galleryFile;
  final picker = ImagePicker();
  List<String> videoFile = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height / 31,
            ),
            tabIndex(3),
            SizedBox(
              height: height / 51,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Choose Your ",
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 11,
                ),
                const Text(
                  "sample Content",
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              "Please Upload high-quality context \nthat showcase your work",
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColor.blackShade),
            ),
            SizedBox(
              height: 21,
            ),
            Container(
              height: height / 4,
              width: width / 3,
              decoration: BoxDecoration(
                  color: AppColor.blackShade,
                  borderRadius: BorderRadius.circular(11)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.video_call,
                    size: 41,
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 11),
                      alignment: Alignment.center,
                      width: width / 5,
                      height: height / 41,
                      decoration: BoxDecoration(
                          color: AppColor.black,
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        "Upload",
                        style: TextStyle(color: AppColor.white, fontSize: 12),
                      ),
                    ),
                    onTap: () {
                      _showPicker(context: context);


                    },
                  ),
                ],
              ),
            ),
            Text(
              "Upload Your Video",
              style: TextStyle(color: AppColor.blackShade, fontSize: 11),
            ),
            Spacer(),
            Align(
                alignment: Alignment.topLeft,
                child: Text("Video ${videoFile.length}/${videoFile.length}",style: TextStyle(fontSize: 18),)),
            SizedBox(height: height/31,),
            Row(
              children: [
                for(var i=0;i<videoFile.length;i++)

                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text((i+1).toString(),style: TextStyle(fontSize: 19),),
                    InkWell(
                      child: Container(
                        height: height / 6,
                        width: width / 3,
                        color: Colors.red,
                        child: VideoApp( videoFile: videoFile[i], isPreview: true,),
                      ),
                      onTap: (){
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => VideoApp(videoFile: videoFile[i], isPreview: false,)));
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: height/21,),

            NextButton(onPress: (){},)
          ],
        ),
      ),
    );
  }

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  getVideo(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getVideo(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getVideo(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickVideo(
        source: img,
        preferredCameraDevice: CameraDevice.front,
        maxDuration: const Duration(minutes: 10));
    XFile? xfilePick = pickedFile;

    // print("xfilePick  ${xfilePick!.path.toString()}");

    videoFile.add(xfilePick!.path.toString());
    setState(
      () {
        galleryFile = File(pickedFile!.path);
            },
    );
  }
}
