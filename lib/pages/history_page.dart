import 'package:concal_app/controller/calcultation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final CalculationPageController data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0E2954),
          title: const Text("History List"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.list),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              width: screenSize.width,
              height: screenSize.height * .8,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: data.historyModelList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(8, 5, 8, 0),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    height: screenSize.height * .15,
                    decoration: BoxDecoration(
                      color: const Color(0xFF001C30),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(2, 2),
                          blurRadius: 5,
                          spreadRadius: 1,
                          color: Colors.black.withOpacity(.5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Center(child: smallText("Feet")),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Center(child: smallText("Inch")),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Center(child: smallText("Point")),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Center(child: smallText("Width")),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: largeText(data
                                            .historyModelList[index]
                                            .widthModel
                                            .feet),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: largeText(data
                                            .historyModelList[index]
                                            .widthModel
                                            .inch),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: largeText(data
                                            .historyModelList[index]
                                            .widthModel
                                            .points),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Center(child: smallText("Length")),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: largeText(data
                                            .historyModelList[index]
                                            .lengthModel
                                            .feet),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Center(
                                        child: largeText(data
                                            .historyModelList[index]
                                            .lengthModel
                                            .inch),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: largeText(data
                                            .historyModelList[index]
                                            .lengthModel
                                            .points),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              smallText("SQFT"),
                              midText(data.historyModelList[index].thisTotal),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              width: screenSize.width,
              height: screenSize.height * .07,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF001C30),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(2, 2),
                    blurRadius: 5,
                    spreadRadius: 1,
                    color: Colors.black.withOpacity(.5),
                  ),
                ],
              ),
              child: Center(
                child: largeText(
                    "Total - ${data.historyModelList[data.historyModelList.length - 1].netTotal}"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Text smallText(String text) => Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: const Color(0xFFECF8F9),
      ),
    );

Text largeText(String text) => Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFECF8F9),
      ),
    );

Text midText(String text) => Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: const Color(0xFFECF8F9),
      ),
    );
