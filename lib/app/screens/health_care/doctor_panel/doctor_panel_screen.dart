import 'package:Whizz/app/screens/health_care/doctor_panel/controller/doctor_panel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../utils/colors.dart';
import '../../../utils/scale_utility.dart';

class DoctorHomeScreen extends GetView<DoctorScreenController> {
  const DoctorHomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsUtil.brandColor,
          automaticallyImplyLeading: true,
        ),
        body: Container(
          padding: scale.getPadding(left: 20, right: 20, top: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // DOCTOR
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "https://www.aucmed.edu/sites/g/files/krcnkv361/files/styles/atge_3_2_crop_md/public/2021-11/large-Smile-Guy-web.jpg?h=6b55786a&itok=Wy7cQpYS",
                        height: scale.getScaledHeight(150),
                        width: scale.getScaledWidth(100),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: scale.getScaledWidth(20),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. Jane Doe',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: scale.getScaledFont(22),
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        Text(
                          'Heart specialist',
                          style: TextStyle(
                            color: Color(0x4F1A203D),
                            fontSize: scale.getScaledFont(12),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/hospitalMarker.svg",),
                            SizedBox(width: scale.getScaledWidth(2),),
                            Text(
                              'Apollo Hospital Indore ',
                              style: TextStyle(
                                color: Color(0x4F1A203D),
                                fontSize: scale.getScaledFont(12),
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: scale.getScaledHeight(20),
                ),
                // RATINGS
                Container(
                  padding: scale.getPadding(top: 10, bottom: 10),
                  width: scale.fw,
                  height: scale.getScaledHeight(55),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFD1D1D6)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Experience',
                            style: TextStyle(
                              color: Color(0x4F1A203D),
                              fontSize: scale.getScaledFont(10),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: scale.getScaledHeight(5),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '10+ ',
                                  style: TextStyle(
                                    color: Color(0xFF18B928),
                                    fontSize: scale.getScaledHeight(12),
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: 'yrs',
                                  style: TextStyle(
                                    color: Color(0xFF18B928),
                                    fontSize: scale.getScaledFont(9),
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: scale.getScaledHeight(52),
                        width: 1,
                        child: Container(
                          color: Color(0xFFD1D1D6),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Rating',
                            style: TextStyle(
                              color: Color(0x4F1A203D),
                              fontSize: scale.getScaledFont(10),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: scale.getScaledHeight(5),
                          ),
                          SvgPicture.asset(
                            "assets/icons/stars.svg",
                            height: 12,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: scale.getScaledHeight(20),
                ),

                //ABOUT DOCTOR
                Text(
                  'About',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: scale.getScaledFont(15),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: scale.getScaledHeight(10),
                ),
                // DETAILS
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu ',
                  style: TextStyle(
                    color: ColorsUtil.greyTextColor,
                    fontSize: scale.getScaledFont(12),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: scale.getScaledHeight(15),
                ),
                Text(
                  ' Appointments',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: scale.getScaledFont(15),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: scale.getScaledHeight(20),
                ),

                ListView.builder(
                    padding: scale.getPadding(top: 5,bottom: 5),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, cnt) => Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: scale.getPadding(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: ListTile(
                          leading: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1600",
                                height: scale.getScaledHeight(50),
                                width: scale.getScaledWidth(50),
                                fit: BoxFit.cover,
                              )),
                          title: Text(
                            'James knite',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.75),
                              fontSize: scale.getScaledFont(12),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          subtitle: Text(
                            '25 years',
                            style: TextStyle(
                              color: Color(0x4F1A203D),
                              fontSize: scale.getScaledFont(10),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Appt time',
                                style: TextStyle(
                                  color: Colors.black
                                      .withOpacity(0.699999988079071),
                                  fontSize: scale.getScaledFont(12),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              Text(
                                '27 Sept 2023',
                                style: TextStyle(
                                  color: Color(0x4F01B001),
                                  fontSize: scale.getScaledFont(10),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                ),
                              ),
                              Text(
                                '12:22pm',
                                style: TextStyle(
                                  color: Color(0x4F01B001),
                                  fontSize: scale.getScaledFont(10),
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
