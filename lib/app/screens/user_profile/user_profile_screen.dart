import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Whizz/app/utils/colors.dart';
import 'package:Whizz/app/utils/constants.dart';
import 'package:Whizz/app/utils/scale_utility.dart';

import '../../routes/app_pages.dart';
import '../../services/user.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: ColorsUtil.brandColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            expandedHeight: Get.height / 2.5,
            collapsedHeight: scale.getScaledHeight(200),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    ConstantData.backgroundTile,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: scale.getScaledHeight(15),
                    ),
                    UserStore.to.profile.userProfile != null ? CircleAvatar(
                      backgroundImage: NetworkImage(
                        UserStore.to.profile.userProfile!,
                      ),
                      radius: 60,
                    ):  const CircleAvatar(
                      backgroundImage: AssetImage(
                        ConstantData.userAvatar,
                      ),
                      radius: 60,
                    ),
                    Column(

                      children: [
                        SizedBox(
                          height: scale.getScaledHeight(10),
                        ),
                        Text(
                          UserStore.to.profile.fullName?? '--/--',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: scale.getScaledHeight(10),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: scale.getScaledWidth(300),
                          child: Text(
                            '${UserStore.to.profile.userAddress!.city}, ${UserStore.to.profile.userAddress!.state}\n${UserStore.to.profile.userAddress!.street}',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: scale.getPadding(horizontal: 15, vertical: 10),
              decoration: ShapeDecoration(
                color: ColorsUtil.brandWhite,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Personal Details ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorsUtil.brandColor,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(20),
                  ),
                  Container(
                    padding: scale.getPadding(all: 10),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: ColorsUtil.brandColor,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () async {
                              await Get.toNamed(Routes.userProfileDetails);
                              log('Hello world');
                            },
                            child: Icon(
                              Icons.edit,
                              size: scale.getScaledFont(15),
                            ),
                          ),
                        ),
                        Obx(
                          () => Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Phone no :',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: ColorsUtil.brandColor,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ${UserStore.to.profile.mobile}',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: ColorsUtil.brandColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: scale.getScaledHeight(10),
                        ),
                        Obx(
                          () => Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Age :',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: ColorsUtil.brandColor,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ${UserStore.to.profile.age}',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: ColorsUtil.brandColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: scale.getScaledHeight(10),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Email :',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: ColorsUtil.brandColor,
                                ),
                              ),
                              TextSpan(
                                text: ' ${UserStore.to.profile.email}',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: ColorsUtil.brandColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: scale.getScaledHeight(10),
                        ),
                        Obx(
                          () => Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Address :',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: ColorsUtil.brandColor,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ${UserStore.to.profile.userAddress!.street}',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: ColorsUtil.brandColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: scale.getScaledHeight(10),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(20),
                  ),
                  Text(
                    'Medical History',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorsUtil.brandColor,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(20),
                  ),
                  Container(
                    padding: scale.getPadding(all: 10),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: ColorsUtil.brandColor,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Blood Group : ',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: ColorsUtil.brandColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'AB+',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: ColorsUtil.brandColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: scale.getScaledWidth(50),
                            ),
                            Text(
                              'Allergies : Dust',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: ColorsUtil.brandColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: scale.getScaledHeight(20),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsUtil.brandColor,
                            padding: scale.getPadding(horizontal: 10),
                          ),
                          child: const Text(
                            "Detailed Report",
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(20),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
