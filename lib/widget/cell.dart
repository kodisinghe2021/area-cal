import 'package:concal_app/controller/calcultation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Cell extends StatelessWidget {
  Cell({
    super.key,
    required this.selectedCellIndex,
    required this.isCellSelected,
    required this.valueOfCell,
    required this.onDelete,
    required this.label,
  });
  final CalculationPageController _controller =
      Get.put<CalculationPageController>(CalculationPageController());

  final int selectedCellIndex;
  final bool isCellSelected;
  final int valueOfCell;
  final String label;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        _controller.setSelectedCell(selectedCellIndex);
        _controller.inputValue.value = "";
      },
      child: Container(
        width: screenSize.width * .3,
        height: screenSize.height * .12,
        decoration: BoxDecoration(
          color: isCellSelected
              ? const Color.fromARGB(255, 43, 202, 234)
              : const Color.fromARGB(255, 239, 234, 234),
          // border: Border.all(width: isCellSelected ? 3 : 1),
          // borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                //   _controller.lengthFeetValue.value
                valueOfCell == -1 ? "" : valueOfCell.toString(),
                style: GoogleFonts.roboto(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (valueOfCell != -1)
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: onDelete,
                  icon: const Icon(
                    Icons.delete,
                    size: 15,
                  ),
                ),
              ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
