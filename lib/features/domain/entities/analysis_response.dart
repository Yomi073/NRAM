import 'package:pv_smart_click/features/domain/entities/monthly_result.dart';

class AnalysisResponse {
  String? analysisId;
  String? userId;
  String? selfSufficiencyPercentage;
  String? systemCapacity;
  String? area;
  String? annualConsumptionKWh;
  String? annualReductionConsumptionKWh;
  String? annualProductionKWh;
  String? annualEnergyFromGridKWh;
  String? annualFeedInEnergyToGridKWh;
  String? annualSavingEnergyFromPowerPlantKWh;
  String? annualSavingEnergyFromPowerPlantMoney;
  String? annualFeedInEnergyToGridMoney;
  String? annualFNEEnergyMoney;
  String? annualFeedInEnergyToGridPercentage;
  String? annualCO2Reduction;
  String? annualConsumptionMoney;
  String? annualReductionConsumptionMoney;
  String? annualReductionConsumptionPercentage;
  String? annualSavingMoney;
  String? lifeSavings;
  String? investment;
  String? investmentReturn;
  String? investmentCostPerKw;
  String? currency;
  String? priceType;
  String? country;
  String? typeCalculation;
  List<MonthlyResultDTO>? monthlyResult;
  List<String>? profitability;

  AnalysisResponse({
    this.analysisId,
    this.userId,
    this.selfSufficiencyPercentage,
    this.systemCapacity,
    this.area,
    this.annualConsumptionKWh,
    this.annualReductionConsumptionKWh,
    this.annualProductionKWh,
    this.annualEnergyFromGridKWh,
    this.annualFeedInEnergyToGridKWh,
    this.annualSavingEnergyFromPowerPlantKWh,
    this.annualSavingEnergyFromPowerPlantMoney,
    this.annualFeedInEnergyToGridMoney,
    this.annualFNEEnergyMoney,
    this.annualFeedInEnergyToGridPercentage,
    this.annualCO2Reduction,
    this.annualConsumptionMoney,
    this.annualReductionConsumptionMoney,
    this.annualReductionConsumptionPercentage,
    this.annualSavingMoney,
    this.lifeSavings,
    this.investment,
    this.investmentReturn,
    this.investmentCostPerKw,
    this.currency,
    this.priceType,
    this.country,
    this.typeCalculation,
    this.monthlyResult,
    this.profitability,
  });

  factory AnalysisResponse.fromJson(Map<String, dynamic> json) {
    return AnalysisResponse(
      analysisId: json['analysisId'],
      userId: json['userId'],
      selfSufficiencyPercentage: doubleToString(json['selfSufficiencyPercentage']),
      systemCapacity: doubleToString(json['systemCapacity']),
      area: doubleToString(json['area']),
      annualConsumptionKWh: doubleToString(json['annualConsumptionKWh']),
      annualReductionConsumptionKWh: doubleToString(json['annualReductionConsumptionKWh']),
      annualProductionKWh: doubleToString(json['annualProductionKWh']),
      annualEnergyFromGridKWh: doubleToString(json['annualEnergyFromGridKWh']),
      annualFeedInEnergyToGridKWh: doubleToString(json['annualFeedInEnergyToGridKWh']),
      annualSavingEnergyFromPowerPlantKWh: doubleToString(json['annualSavingEnergyFromPowerPlantKWh']),
      annualSavingEnergyFromPowerPlantMoney: doubleToString(json['annualSavingEnergyFromPowerPlantMoney']),
      annualFeedInEnergyToGridMoney: doubleToString(json['annualFeedInEnergyToGridMoney']),
      annualFNEEnergyMoney: doubleToString(json['annualFNEEnergyMoney']),
      annualFeedInEnergyToGridPercentage: doubleToString(json['annualFeedInEnergyToGridPercentage']),
      annualCO2Reduction: doubleToString(json['annualCO2Reduction']),
      annualConsumptionMoney: doubleToString(json['annualConsumptionMoney']),
      annualReductionConsumptionMoney: doubleToString(json['annualReductionConsumptionMoney']),
      annualReductionConsumptionPercentage: doubleToString(json['annualReductionConsumptionPercentage']),
      annualSavingMoney: doubleToString(json['annualSavingMoney']),
      lifeSavings: doubleToString(json['lifeSavings']),
      investment: doubleToString(json['investment']),
      investmentReturn: doubleToString(json['investmentReturn']),
      investmentCostPerKw: doubleToString(json['investmentCostPerKw']),
      currency: json['currency'],
      priceType: json['priceType'],
      country: json['country'],
      typeCalculation: json['typeCalculation'],
    );
  }

  static String doubleToString(dynamic value) {
    if (value == null) {
      return "";
    }
    return value is double ? value.toStringAsFixed(2) : value.toString();
  }
}
