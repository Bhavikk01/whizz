import 'package:Whizz/app/models/reports_model.dart';
import 'package:Whizz/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/scale_utility.dart';

class ReportTile extends StatelessWidget {
  final ReportsModel report;

  const ReportTile({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return Card(
      margin: EdgeInsets.only(
        left: scale.getScaledWidth(20),
        right: scale.getScaledWidth(20),
        top: scale.getScaledHeight(3),
      ),
      shadowColor: const Color(0x33000000),
      elevation: 5,
      shape: const RoundedRectangleBorder(),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.titleHeight,
        shape: const RoundedRectangleBorder(),
        minLeadingWidth: scale.getScaledWidth(35),
        horizontalTitleGap: scale.getScaledWidth(20),
        tileColor: Colors.white,
        style: ListTileStyle.list,
        contentPadding: EdgeInsets.only(
          top: scale.getScaledHeight(30),
          bottom: scale.getScaledHeight(15),
          left: scale.getScaledWidth(10),
        ),
        title: Text(
          report.fileName!,
          style: AppTheme.appTheme.textTheme.bodyMedium!.copyWith(
            fontSize: scale.getScaledFont(14),
            color: Colors.black,
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: scale.getScaledHeight(20),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: scale.getScaledHeight(5),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      ConstantData.locationIcon,
                      height: scale.getScaledFont(12),
                    ),
                    SizedBox(
                      width: scale.getScaledHeight(6),
                    ),
                    SizedBox(
                      width: scale.getScaledHeight(170),
                      child: Text(
                        '${report.reportType}, ${report.reportLocation}',
                        style: AppTheme.appTheme.textTheme.bodySmall!.copyWith(
                          fontSize: scale.getScaledFont(10),
                          color: ColorsUtil.greyTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: scale.getScaledHeight(5)),
                Text(
                  DateFormat('dd MMM, yyyy').format(report.time!),
                  style: AppTheme.appTheme.textTheme.bodySmall!.copyWith(
                    fontSize: scale.getScaledFont(10),
                    color: ColorsUtil.greyTextColor,
                  ),
                ),
                // SizedBox(height: scale.getScaledHeight(10)),
              ],
            )
          ],
        ),
        leading: SvgPicture.asset(
          ConstantData.fileIcon,
        ),
        trailing: IconButton(
          onPressed: () {

          },
          icon: SvgPicture.asset(
            ConstantData.shareCircle,
            height: scale.getScaledHeight(40),
          ),
        ),
      ),
    );
  }
}
