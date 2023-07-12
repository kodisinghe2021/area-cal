import 'package:concal_app/model/history_model.dart';
import 'package:concal_app/model/measurements_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class CalculationPageController extends GetxController {
  late MeasurementsModel _widthModel;
  late MeasurementsModel _lengthModel;
  late HistoryModel _historyModel;
  List<HistoryModel> historyModelList = [];
//!---------------------------------------------calculation
//! ==== current total
  var currentTotal = 0.0.obs;

  void calculate() {
    //~ validation
    if (lengthFeetValue.value < 0) {
      Get.snackbar("Empty value", "Please enter value");
      Logger().e("Empty value", "Please enter value");
      return;
    }
    if (widthFeetValue.value < 0) {
      Get.snackbar("Empty value", "Please enter value");
      Logger().e("Empty value", "Please enter value");
      return;
    }

    //~ ----calculation
    //~ -- values
    double lengthFeetAsINCHES = lengthFeetValue.value * 12;
    double lengthINCHES = 0;
    double lengthPointsAsINCHES = 0;

    double widthFeetAsINCHES = widthFeetValue.value * 12;
    double widthINCHES = 0;
    double widthPointsAsINCHES = 0;

    if (lengthInchValue.value > 0) {
      lengthINCHES = lengthInchValue.value.toDouble();
    }

    if (lengthPointValue.value > 0) {
      lengthPointsAsINCHES = lengthPointValue.value.toDouble() / 8;
    }

    if (widthInchValue.value > 0) {
      widthINCHES = widthInchValue.value.toDouble();
    }

    if (widthPointValue.value > 0) {
      widthPointsAsINCHES = widthPointValue.value.toDouble() / 8;
    }

    double totalLengthInINCHES =
        lengthFeetAsINCHES + lengthINCHES + lengthPointsAsINCHES;
    double totalwidthInINCHES =
        widthFeetAsINCHES + widthINCHES + widthPointsAsINCHES;
    double totalSQINCH = totalLengthInINCHES * totalwidthInINCHES;
    int SQINCH = totalSQINCH ~/ 144;
    double twoDes = double.parse((totalSQINCH / 144).toStringAsFixed(2));
    Logger().i("~$SQINCH -- $twoDes");
    currentTotal.value =
        double.parse((currentTotal.value + twoDes).toStringAsFixed(2));
    //!--- create object
    _widthModel = MeasurementsModel(
      feet: widthFeetValue.value > 0 ? widthFeetValue.value.toString() : "0",
      inch: widthInchValue.value > 0 ? widthInchValue.value.toString() : "0",
      points:
          widthPointValue.value > 0 ? widthPointValue.value.toString() : "0",
    );

    _lengthModel = MeasurementsModel(
      feet: lengthFeetValue.value.toString(),
      inch: lengthInchValue.value.toString(),
      points: lengthPointValue.value.toString(),
    );

    _historyModel = HistoryModel(
      lengthModel: _lengthModel,
      widthModel: _widthModel,
      thisTotal: twoDes.toString(),
      netTotal: currentTotal.value.toString(),
    );
    Logger().i(
        "model created -- ${_historyModel.lengthModel.feet}  ${_historyModel.widthModel.feet}");
    historyModelList.add(_historyModel);
    Logger().i("model added -- length ${historyModelList.length}");
  }

  //---- selected line store here
  var lengthFeetISSELECTED = false.obs;
  var lengthInchISSELECTED = false.obs;
  var lengthPointISSELECTED = false.obs;
  var widthFeetISSELECTED = false.obs;
  var widthInchISSELECTED = false.obs;
  var widthPointISSELECTED = false.obs;

  RxInt lengthFeetValue = RxInt(-1);
  RxInt lengthInchValue = RxInt(-1);
  RxInt lengthPointValue = RxInt(-1);
  RxInt widthFeetValue = RxInt(-1);
  RxInt widthInchValue = RxInt(-1);
  RxInt widthPointValue = RxInt(-1);

//------oo
//-- this is the selector of the field

  var inputValue = "".obs;
  void _setNumbers(int value) {
    if (value < 9) {
      inputValue.value = inputValue.value + (value + 1).toString();
    }
    if (value == 10) {
      inputValue.value = '${inputValue.value}0';
    }
    if (value == 9) {
      inputValue.value = "";
    }
  }

  void getinputNumber(int value) {
    _setNumbers(value);

    if (lengthFeetISSELECTED.value) {
      lengthFeetValue.value = int.parse(inputValue.value);
    }
    if (lengthInchISSELECTED.value) {
      lengthInchValue.value = int.parse(inputValue.value);
    }
    if (lengthPointISSELECTED.value) {
      lengthPointValue.value = int.parse(inputValue.value);
    }
    if (widthFeetISSELECTED.value) {
      widthFeetValue.value = int.parse(inputValue.value);
    }
    if (widthInchISSELECTED.value) {
      widthInchValue.value = int.parse(inputValue.value);
    }
    if (widthPointISSELECTED.value) {
      widthPointValue.value = int.parse(inputValue.value);
    }
  }

//! --------------- find selsected cell
  void setSelectedCell(int cellNumber) {
    if (cellNumber == 1) {
      lengthFeetISSELECTED.value = true;
      lengthInchISSELECTED.value = false;
      lengthPointISSELECTED.value = false;
      widthFeetISSELECTED.value = false;
      widthInchISSELECTED.value = false;
      widthPointISSELECTED.value = false;
    } else if (cellNumber == 2) {
      lengthFeetISSELECTED.value = false;
      lengthInchISSELECTED.value = true;
      lengthPointISSELECTED.value = false;
      widthFeetISSELECTED.value = false;
      widthInchISSELECTED.value = false;
      widthPointISSELECTED.value = false;
    } else if (cellNumber == 3) {
      lengthFeetISSELECTED.value = false;
      lengthInchISSELECTED.value = false;
      lengthPointISSELECTED.value = true;
      widthFeetISSELECTED.value = false;
      widthInchISSELECTED.value = false;
      widthPointISSELECTED.value = false;
    } else if (cellNumber == 4) {
      lengthFeetISSELECTED.value = false;
      lengthInchISSELECTED.value = false;
      lengthPointISSELECTED.value = false;
      widthFeetISSELECTED.value = true;
      widthInchISSELECTED.value = false;
      widthPointISSELECTED.value = false;
    } else if (cellNumber == 5) {
      lengthFeetISSELECTED.value = false;
      lengthInchISSELECTED.value = false;
      lengthPointISSELECTED.value = false;
      widthFeetISSELECTED.value = false;
      widthInchISSELECTED.value = true;
      widthPointISSELECTED.value = false;
    } else if (cellNumber == 6) {
      lengthFeetISSELECTED.value = false;
      lengthInchISSELECTED.value = false;
      lengthPointISSELECTED.value = false;
      widthFeetISSELECTED.value = false;
      widthInchISSELECTED.value = false;
      widthPointISSELECTED.value = true;
    }
  }
}
