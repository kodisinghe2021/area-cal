import 'package:concal_app/model/measurements_model.dart';

class HistoryModel {
  MeasurementsModel lengthModel;
  MeasurementsModel widthModel;
  String thisTotal;
  String netTotal;

  HistoryModel({
    required this.lengthModel,
    required this.widthModel,
    required this.thisTotal,
    required this.netTotal,
  });


}
