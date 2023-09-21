import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whizz/app/utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

//TODO
  /*
  * Responsive
  *
  * */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              // backgroundColor: Color(0xff2B447C),
              expandedHeight: Get.height / 2.5,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Container(
                      // height: Get.height / 2,
                      decoration: BoxDecoration(
                          color: ColorsUtil.brandColor,

                          image: DecorationImage(
                              image: Image.asset("assets/images/smallbg.png",fit: BoxFit.fitWidth,width: Get.width)
                                  .image)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 60,
                            child: Text(
                              "A",
                              style: GoogleFonts.roboto(
                                  fontSize: 70,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff2B447C)),
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text("Apoorv Pancholi",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(color: Colors.white)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Indore, Madhya Pradesh",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(color: Colors.white70)),
                            ],
                          )
                        ],
                      ));
                },
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: Container(
                  width: Get.width,
                  decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)))),
                  child: SizedBox(
                    height: 15,
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: Container(
                // color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Text('Personal Details ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: ColorsUtil.brandColor)),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      // height: 100,
                      padding: EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(color: Color(0xff2B447C)))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.edit,
                              size: 14,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Phone no :',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: ColorsUtil.brandColor)),
                                TextSpan(
                                    text: ' 9244470379',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: ColorsUtil.brandColor)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Gender  :',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: ColorsUtil.brandColor)),
                                TextSpan(
                                    text: ' Male',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: ColorsUtil.brandColor)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Age :',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: ColorsUtil.brandColor)),
                                TextSpan(
                                    text: ' 21',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: ColorsUtil.brandColor)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Email :',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: ColorsUtil.brandColor)),
                                TextSpan(
                                    text: '  apoorv@gmail.com',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: ColorsUtil.brandColor)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: 'Address :',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: ColorsUtil.brandColor)),
                                TextSpan(
                                    text:
                                        '  32 Dhanvantri Nagar  Rajendra  nagar',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: ColorsUtil.brandColor)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Medical History',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: ColorsUtil.brandColor)),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(color: Color(0xff2B447C)))),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: ColorsUtil.brandColor)),
                                    TextSpan(
                                        text: 'AB+',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: ColorsUtil.brandColor)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text('Allergies : Dust',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: ColorsUtil.brandColor)),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Detailed Report",
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff2B447C),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(0xff2B447C),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: "Appointment"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ));
  }
}