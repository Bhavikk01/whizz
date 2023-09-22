import 'package:Whizz/app/screens/home/controllers/home_controller.dart';
import 'package:Whizz/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/scale_utility.dart';

class NewHomeScreen extends GetView<HomeController> {
  const NewHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsUtil.brandColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: ColorsUtil.brandColor,
              expandedHeight: Get.height/5,
              flexibleSpace: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {

                return Container(
                  padding: EdgeInsets.symmetric(vertical: scale.getScaledHeight(50),horizontal: scale.getScaledWidth(30)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [


                      Text.rich(TextSpan(

                        children:[
                          TextSpan(
                            text: "Good Morning\n",
                            style:  TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              // height: 0.06,
                              letterSpacing: -0.41,
                            ),
                          ),
                          TextSpan(
                            text: "Bhavik",
                            style:  TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              // height: 0.06,
                              letterSpacing: -0.41,
                            ),
                          )


                        ]

                      )

                      )

                    ],

                  ),
                );


              },),
            ),
            SliverFillRemaining(
              child: Container(
                decoration:ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(100)))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                ),
              ),
            )



          ],
        ),
      ),
    );
  }
}
