import 'package:Whizz/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../utils/constants.dart';
import '../../../utils/scale_utility.dart';

class AppointMentScreen extends StatelessWidget {
  const AppointMentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return Scaffold(
      backgroundColor: ColorsUtil.brandColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            collapsedHeight: scale.getScaledHeight(80),
            expandedHeight: scale.getScaledHeight(150),
            backgroundColor: Colors.transparent,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          ConstantData.backgroundTile,
                        ),
                        fit: BoxFit.cover,
                      ),
                      color: ColorsUtil.brandColor,
                      // borderRadius: const BorderRadius.only(
                      //   bottomLeft: Radius.circular(25),
                      //   bottomRight: Radius.circular(25),
                      // ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        CircleAvatar(
                          backgroundImage: Image.network(
                              "https://www.aucmed.edu/sites/g/files/krcnkv361/files/styles/atge_3_2_crop_md/public/2021-11/large-Smile-Guy-web.jpg?h=6b55786a&itok=Wy7cQpYS")
                              .image,
                          maxRadius: 50,
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
                                color: Colors.white,
                                fontSize: scale.getScaledFont(22),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'General doctor',
                              style: TextStyle(
                                color: Color(0xFFD1D1D6),
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w400,
                                height: 1.5
                              ),
                            ),
                            Text(
                              '\$700',
                              style: TextStyle(
                                color: Color(0xFF01B001),
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w400,
                                  height: 1.5


                              ),
                            )
                          ],
                        )
                      ],
                    ));
              },
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              padding: scale.getPadding(horizontal: 15 , vertical: 10),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: scale.getScaledHeight(20),
                  ),
                  Text(
                    'Choose Date',
                    style: TextStyle(
                      color: Color(0xFFD1D1D6),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // TableCalendar(focusedDay: DateTime.now(), firstDay:  DateTime.utc(2010, 10, 16), lastDay: DateTime.utc(2030, 3, 14))

                  Container(
                    // color: Colors.blue,
                    height: scale.getScaledHeight(300),
                    child: TableCalendar(
                        calendarStyle:CalendarStyle(defaultTextStyle: GoogleFonts.roboto(fontStyle: FontStyle.italic)) ,
                        headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
                        availableGestures: AvailableGestures.all,
                        onDaySelected: (selectedDay, focusedDay) {
                          focusedDay: selectedDay;
                        },
                        focusedDay: DateTime.now(),
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14)),

                  ),
                  SizedBox(
                    height: scale.getScaledHeight(20),
                  ),
                  Text(
                    'Choose Time',
                    style: TextStyle(
                      color: Color(0xFFD1D1D6),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(20),
                  ),
                  Center(
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 20,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      alignment: WrapAlignment.center,
                      runSpacing: 20,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 80,
                            height: 26,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 0.50, color: Color(0xFFD1D1D6)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Center(child: Text("3.00 pm")),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 26,
                          decoration: ShapeDecoration(
                            color: ColorsUtil.brandColor,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 0.50, color: ColorsUtil.brandColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Center(
                              child: Text(
                                "3:30 pm",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        Container(
                          width: 80,
                          height: 26,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFFD1D1D6)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Center(child: Text("4:00 pm")),
                        ),
                        Container(
                          width: 80,
                          height: 26,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFFD1D1D6)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Center(child: Text("4:30 pm")),
                        ),
                        Container(
                          width: 80,
                          height: 26,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFFD1D1D6)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Center(child: Text("5:00 pm")),
                        ),
                        Container(
                          width: 80,
                          height: 26,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.50, color: Color(0xFFD1D1D6)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Center(child: Text("5:30 pm")),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 110,
                        height: 43,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFF7F5F5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                      SizedBox(
                        width: scale.getScaledHeight(20),
                      ),
                      SizedBox(
                        width: 110,
                        height: 43,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFFF6B6B),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: Text(
                              "Book",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
