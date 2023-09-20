import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:whizz/app/screens/profile/controller/profile_controller.dart';
import 'package:whizz/app/utils/colors.dart';
class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Container(
                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                decoration: BoxDecoration(
                  color:ColorsUtil.lightContainerColor,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  children: [

                    CircleAvatar(backgroundColor:ColorsUtil.darkContainerColor,radius: 45,backgroundImage:  Image.network("https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/events/IMG_20220914_122909.jpg").image,),
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bhavik Kothari",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                        Text("8305048867 | anuroopf02@gmail.com",softWrap: true,),
                        Text("Blood group: A+"),
                        Text("Fit",style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    )




                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
