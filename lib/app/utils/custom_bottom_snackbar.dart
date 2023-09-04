
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:get/get.dart';

Future<void> customSnackBar({type, message}) {
  return AnimatedSnackBar.material(
    message,
    type: type,
    duration: const Duration(seconds: 4),
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    mobilePositionSettings: const MobilePositionSettings(
      bottomOnAppearance: 10,
    ),
  ).show(Get.context!);
}