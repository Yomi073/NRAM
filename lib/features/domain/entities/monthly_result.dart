class MonthlyResultDTO {
  String? month;
  String? year;
  double? consumptionKWh;
  double? consumptionHighKWh;
  double? consumptionLowKWh;
  double? productionKWh;
  double? energyFromGridKWh;
  double? feedInEnergyToGridKWh;
  double? savingEnergyFromPowerPlantKWh;
  double? consumptionMoney;
  double? feedInEnergyToGridMoney;
  double? feedInEnergyToGridPricePerkWh;
  double? energyFromGridPricePerkWh;
  double? savingEnergyFromPowerPlantMoney;
  double? savingMoney;
  double? actualBillMoney;
  List<double>? hourlyProduction;
  List<double>? hourlyConsumption;

  MonthlyResultDTO({
    this.month,
    this.year,
    this.consumptionKWh,
    this.consumptionHighKWh,
    this.consumptionLowKWh,
    this.productionKWh,
    this.energyFromGridKWh,
    this.feedInEnergyToGridKWh,
    this.savingEnergyFromPowerPlantKWh,
    this.consumptionMoney,
    this.feedInEnergyToGridMoney,
    this.feedInEnergyToGridPricePerkWh,
    this.energyFromGridPricePerkWh,
    this.savingEnergyFromPowerPlantMoney,
    this.savingMoney,
    this.actualBillMoney,
    this.hourlyProduction,
    this.hourlyConsumption,
  });

  factory MonthlyResultDTO.fromJson(Map<String, dynamic> json) {
    return MonthlyResultDTO(
      month: json['month'],
      year: json['year'],
      consumptionKWh: json['consumptionKWh'],
      consumptionHighKWh: json['consumptionHighKWh'],
      consumptionLowKWh: json['consumptionLowKWh'],
      productionKWh: json['productionKWh'],
      energyFromGridKWh: json['energyFromGridKWh'],
      feedInEnergyToGridKWh: json['feedInEnergyToGridKWh'],
      savingEnergyFromPowerPlantKWh: json['savingEnergyFromPowerPlantKWh'],
      consumptionMoney: json['consumptionMoney'],
      feedInEnergyToGridMoney: json['feedInEnergyToGridMoney'],
      feedInEnergyToGridPricePerkWh: json['feedInEnergyToGridPricePerkWh'],
      energyFromGridPricePerkWh: json['energyFromGridPricePerkWh'],
      savingEnergyFromPowerPlantMoney: json['savingEnergyFromPowerPlantMoney'],
      savingMoney: json['savingMoney'],
      actualBillMoney: json['actualBillMoney'],
      hourlyProduction: json['hourlyProduction'],
      hourlyConsumption: json['hourlyConsumption'],
    );
  }
}
