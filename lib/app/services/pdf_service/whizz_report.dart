import 'dart:io';
import 'package:Whizz/app/services/pdf_service/pdf_class.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import '../../models/user_model.dart';

class WhizzReport {
  ///   PAGE DIMENSIONS
  final double pageHeight = PdfPageFormat.a4.height;
  final double pageWidth = PdfPageFormat.a4.width;

  ///   PICTURES
  late String headerBackground;
  late String whizzIcon;
  late String bullet;

  ///   FONTS
  late Font defaultFonts;
  late Font defaultBoldFonts;
  late Font defaultItalicFonts;
  late Font defaultBoldItalicFonts;

  ///   DATA
  UserModel user;
  String diseaseName = "";
  String severity = '';
  String diseaseDescription = "";
  List<dynamic> symptoms = [];
  List<dynamic> precautions = [];

  ///     CONSTRUCTOR
  WhizzReport(
      {required this.user,
      required this.diseaseDescription,
      required this.symptoms,
      required this.severity,
      required this.precautions});

  Future<File> generate() async {
    /// Loading background from assets
    headerBackground =
        await rootBundle.loadString("assets/pdf_assets/pdf_bg.svg");

    /// Loading Whizz icon
    whizzIcon = await rootBundle.loadString("assets/pdf_assets/appIcon.svg");

    bullet = await rootBundle.loadString("assets/pdf_assets/bullet.svg");

    /// Loading fonts online , todo Load form asset
    defaultFonts = await PdfGoogleFonts.robotoRegular();
    defaultBoldFonts = await PdfGoogleFonts.robotoBold();
    defaultItalicFonts = await PdfGoogleFonts.robotoItalic();
    defaultBoldItalicFonts = await PdfGoogleFonts.robotoBoldItalic();

    Document pdf = Document();
    pdf.addPage(
      MultiPage(
          theme: ThemeData(
              textAlign: TextAlign.left,
              softWrap: true,
              defaultTextStyle: TextStyle(
                  color: PdfColors.black,
                  font: defaultFonts,
                  fontBold: defaultBoldFonts,
                  fontItalic: defaultItalicFonts,
                  fontBoldItalic: defaultBoldItalicFonts)),
          pageFormat: PdfPageFormat.a4,
          margin: const EdgeInsets.symmetric(
              vertical: 3 * PdfPageFormat.mm, horizontal: 3 * PdfPageFormat.mm),
          build: (context) => [
                reportHeader(),
                SizedBox(height: pageHeight / 30),
                reportContent(),
              ],
          footer: (context) => reportFooter(context)),
    );
    return PdfApi.saveDocument(name: "HealthReport.pdf", pdf: pdf);
  }

  reportHeader() => Container(
      padding: const EdgeInsets.symmetric(horizontal: 0.5 * PdfPageFormat.cm),
      height: PdfPageFormat.a4.availableHeight / 5.5,
      decoration: BoxDecoration(
        image: DecorationSvgImage(svg: headerBackground),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("Medical Report",
            style:
                TextStyle(fontSize: pageHeight / 25, color: PdfColors.white)),
        SvgImage(
          svg: whizzIcon,
        )
      ]));

  reportContent() => Container(
      margin: const EdgeInsets.symmetric(horizontal: 0.5 * PdfPageFormat.cm),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        reportPatientDetails(),
        SizedBox(height: pageHeight / 30),
        reportDiseaseDescription(),
        SizedBox(height: pageHeight / 30),
        reportSymptoms(),
        SizedBox(height: pageHeight / 30),
        reportPrecautions()
      ]));

  ///    PATIENT DETAILS
  reportPatientDetails() =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Patient Demographics',
          style: TextStyle(
            fontSize: pageHeight / 40,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: pageHeight / 50),

        /// NAME , GENDER AND LOCATION
        Row(children: [
          ///        NAME
          tableHeaderCell("Name"),
          tableValueCell(text: "Ram"),

          ///        GENDER
          tableHeaderCell("Gender"),
          tableValueCell(text: "Male"),

          ///        LOCATION
          tableHeaderCell("Location"),
          tableValueCell(text: "Ayodhya"),
        ]),

        ///  BLOOD GROUP , DOB AND NATIONALITY
        Row(children: [
          ///        BLOOD GROUP
          tableHeaderCell("Blood Group"),
          tableValueCell(text: "A+"),

          ///        DATE OF BIRTH
          tableHeaderCell("Date of birth"),
          tableValueCell(text: "10/01/5551  "),

          ///        NATIONALITY
          tableHeaderCell("Nationality"),
          tableValueCell(text: "Indian"),
        ]),

        /// CHECK-UP DATE, AGE AND ID NO.
        Row(children: [
          ///        DATE
          tableHeaderCell("DATE"),
          tableValueCell(text: "10/10/2023"),

          ///        AGE
          tableHeaderCell("AGE"),
          tableValueCell(text: "100"),

          ///        ID NO.
          tableHeaderCell("ID NO."),
          tableValueCell(text: "1234567"),
        ]),
      ]);

  ///    DISEASE DESCRIPTION
  reportDiseaseDescription() =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Disease Description',
          style: TextStyle(
            fontSize: pageHeight / 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: pageHeight / 35),

        ///   DISEASE TABLE
        Row(children: [
          ///    NAME
          tableHeaderCell("Name"),
          tableValueCell(text: diseaseName, width: true),

          ///    SEVERITY
          tableHeaderCell("Severity"),
          tableValueCell(text: "${severity}", width: true, color: PdfColors.amber)
        ]),

        SizedBox(height: pageHeight / 35),

        ///  DESCRIPTION
        Text(diseaseDescription,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic))
      ]);

  ///    SYMPTOMS
  reportSymptoms() =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Symptoms',
          style: TextStyle(
            fontSize: pageHeight / 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Wrap(
            direction: Axis.horizontal,
            spacing: 50,
            runAlignment: WrapAlignment.center,
            children: List.generate(
                symptoms.length, (index) => bullets(symptoms[index])))
      ]);

  reportPrecautions() =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Precautions',
          style: TextStyle(
            fontSize: pageHeight / 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Wrap(
            direction: Axis.horizontal,
            spacing: 100,
            runAlignment: WrapAlignment.center,
            children: List.generate(
                symptoms.length, (index) => bullets(precautions[index])))
      ]);

  /// REPORT BULLETS
  bullets(String text) => Container(
      margin: EdgeInsets.symmetric(vertical: 3 * PdfPageFormat.mm),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        SvgImage(
          svg: bullet,
        ),
        SizedBox(width: 2),
        Text(text, style: const TextStyle(fontSize: 14))
      ]));

  /// TABLE CELLS
  tableHeaderCell(String text) {
    return Container(
        height: pageHeight / 20,
        width: pageWidth / 6.5,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: PdfColor.fromHex("DCE6FC"),
            border: Border.all(color: PdfColor.fromHex("D1D1D6"), width: 2)),
        child: Text(text,
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)));
  }

  tableValueCell({
    required String text,
    bool width = false,
    PdfColor color = PdfColors.white,
  }) {
    return Container(
        height: pageHeight / 20,
        width: width ? pageWidth / 3.25 : pageWidth / 6.5,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: PdfColor.fromHex("D1D1D6"), width: 2)),
        child: Text(text, style: const TextStyle(fontSize: 10)));
  }

  ///      FOOTER
  reportFooter(context) => Column(children: [
        Divider(
            color: PdfColors.grey, borderStyle: BorderStyle.dashed, height: 10),
        Align(
            alignment: Alignment.centerRight,
            child:
                Text("Page of ${context.pageNumber} of ${context.pagesCount}"))
      ]);
}
