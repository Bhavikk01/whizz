import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:whizz/app/utils/colors.dart';

import 'controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        SingleChildScrollView(
          child: InteractiveViewer(
            minScale: 0.4,
            maxScale: 0.5,
            boundaryMargin: EdgeInsets.all(20.0),
            child: Image.network(
              "https://i.stack.imgur.com/HILmr.png",
              height: Get.height,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        DraggableScrollableSheet(
          controller: controller.draggableScrollableController,
          initialChildSize: 0.15,
          minChildSize: 0.15,
          maxChildSize: 0.95,
          snap: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
              decoration: BoxDecoration(
                  color: ColorsUtil.brandWhite,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15))),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10,),

                    TextFormField(onTap: (){
                      controller.draggableScrollableController.animateTo(1, duration: Duration(milliseconds: 500), curve: Curves.easeIn);


                      },decoration: InputDecoration(hintText: "Hospital name"),),
                    SizedBox(height: 20,),
                    // ElevatedButton(onPressed: () {}, child: Text("Search")),
                    // SizedBox(height: 10,)
                  ],
                ),
              ),
            );
          },
        )
      ],
    )));
  }
}
/*
*  BottomSheet(constraints: BoxConstraints(
        maxHeight: Get.height*0.9,
        minHeight: Get.height*0.4
      ),
        enableDrag: true,
        showDragHandle: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        onClosing: () {},
        builder: (BuildContext context) {
          return Container();
        },
      ),*/
