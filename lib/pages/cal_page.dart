import 'package:concal_app/controller/calcultation_controller.dart';
import 'package:concal_app/routes/app_pages.dart';
import 'package:concal_app/widget/cell.dart';
import 'package:concal_app/widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class CalCulationPage extends StatelessWidget {
  CalCulationPage({super.key});
  final CalculationPageController _controller =
      Get.put<CalculationPageController>(CalculationPageController());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0E2954),
          title: const Text("AreaCal"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.HISTORY, arguments: _controller);
              },
              icon: const Icon(Icons.list),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: screenSize.height * .3,
              child: Obx(
                () => Column(
                  children: [
                    SizedBox(height: screenSize.height * .02),
                    Container(
                      width: screenSize.width * .9,
                      height: screenSize.height * .12,
                      color: Colors.redAccent,
                      child: Row(
                        children: [
                          //~------------------------------Length feet
                          Cell(
                            label: "Feet",
                            isCellSelected:
                                _controller.lengthFeetISSELECTED.value,
                            selectedCellIndex: 1,
                            valueOfCell: _controller.lengthFeetValue.value,
                            onDelete: () {
                              _controller.lengthFeetValue.value = -1;
                              _controller.inputValue.value = "";
                            },
                          ),
                          //~------------------------------Length inches
                          Cell(
                            label: "Inch",
                            isCellSelected:
                                _controller.lengthInchISSELECTED.value,
                            selectedCellIndex: 2,
                            valueOfCell: _controller.lengthInchValue.value,
                            onDelete: () {
                              _controller.lengthInchValue.value = -1;
                              _controller.inputValue.value = "";
                            },
                          ),

                          //~------------------------------Length points
                          Cell(
                            label: "Point",
                            isCellSelected:
                                _controller.lengthPointISSELECTED.value,
                            selectedCellIndex: 3,
                            valueOfCell: _controller.lengthPointValue.value,
                            onDelete: () {
                              _controller.lengthPointValue.value = -1;
                              _controller.inputValue.value = "";
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * .04,
                      child: Text(
                        "X",
                        style: GoogleFonts.roboto(fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * .9,
                      height: screenSize.height * .12,
                      child: Row(
                        children: [
                          //~------------------------------Width feet
                          Cell(
                            label: "Feet",
                            isCellSelected:
                                _controller.widthFeetISSELECTED.value,
                            selectedCellIndex: 4,
                            valueOfCell: _controller.widthFeetValue.value,
                            onDelete: () {
                              _controller.widthFeetValue.value = -1;
                              _controller.inputValue.value = "";
                            },
                          ),
                          //~------------------------------Width inches
                          Cell(
                            label: "Inch",
                            isCellSelected:
                                _controller.widthInchISSELECTED.value,
                            selectedCellIndex: 5,
                            valueOfCell: _controller.widthInchValue.value,
                            onDelete: () {
                              _controller.widthInchValue.value = -1;
                              _controller.inputValue.value = "";
                            },
                          ),
                          //~------------------------------Width points
                          Cell(
                            label: "Point",
                            isCellSelected:
                                _controller.widthPointISSELECTED.value,
                            selectedCellIndex: 6,
                            valueOfCell: _controller.widthPointValue.value,
                            onDelete: () {
                              _controller.widthPointValue.value = -1;
                              _controller.inputValue.value = "";
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //~----------------------------Total Result
            Obx(
              () => _controller.currentTotal.value < 0
                  ? SizedBox(
                      height: screenSize.height * .1,
                    )
                  : Container(
                      height: screenSize.height * .1,
                      color: const Color(0xFF0E2954),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Total sqft  :",
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "${_controller.currentTotal}",
                            style: GoogleFonts.roboto(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),

            //~---------------------------------- Number Pad
            SizedBox(
              height: screenSize.height * .36,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 1.8,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return NumberButton(
                    onTap: () {
                      _controller.getinputNumber(index);
                    },
                    index: index,
                  );
                },
              ),
            ),

            //~----------------------------- Add Button
            InkWell(
              onTap: () {
                Logger().i("clicke");
                _controller.calculate();
                _controller.lengthFeetValue.value = -1;
                _controller.lengthInchValue.value = -1;
                _controller.lengthPointValue.value = -1;
                _controller.widthFeetValue.value = -1;
                _controller.widthInchValue.value = -1;
                _controller.widthPointValue.value = -1;
              },
              child: Container(
                height: screenSize.height * .09,
                width: screenSize.width * .6,
                decoration: const BoxDecoration(
                  color: Color(0xFF0E2954),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Add",
                    style: GoogleFonts.roboto(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
