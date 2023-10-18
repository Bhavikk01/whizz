import 'dart:developer';
import 'dart:io';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';



class PdfApi {

  ///       SAVES THE PDF TO APP DIRECTORY

  static Future<File> saveDocument(
      {required String name, required Document pdf}) async {
    log("==============================SAVING PDF CALLED=========================");
    late File file;

    try {
      final bytes = await pdf.save();
      final dir = await getApplicationDocumentsDirectory();
      file = File("${dir.path}/$name");
      await file.writeAsBytes(bytes);
    } on Exception catch (e) {
      log(name: "SAVING PDF EXCEPTION", e.toString());
    }
    return file;
  }

  ///    OPENS PDF FILE

  static Future openFile(File file) async {
    final url = file.path;
    log("==========================OPENING FILE===================================");
    try {
      await OpenFilex.open(url);
    } on Exception catch (e) {
      log(name: "OPEN FILE EXCEPTION", e.toString());
    }
  }
}
