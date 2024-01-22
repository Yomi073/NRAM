import 'package:pv_smart_click/features/domain/entities/googleLatLng.dart';

class AnalysisRequest {
  final String tilt;
  final String area;
  final String azimuth;
  final String consumptionAverageBill;
  final GoogleLatLng googleLatLng;
  final String priceID;
  final String siteDataInputType;
  final String typeCalculation;

  AnalysisRequest({
    required this.tilt,
    required this.area,
    required this.azimuth,
    required this.consumptionAverageBill,
    required this.googleLatLng,
    required this.priceID,
    required this.siteDataInputType,
    required this.typeCalculation,
  });

  Map<String, dynamic> toJson() {
    return {
      'tilt': tilt,
      'area': area,
      'azimuth': azimuth,
      'consumptionAverageBill': consumptionAverageBill,
      'googleLatLng': googleLatLng.toJson(),
      'priceID': priceID,
      'siteDataInputType': siteDataInputType,
      'typeCalculation': typeCalculation,
    };
  }
}
