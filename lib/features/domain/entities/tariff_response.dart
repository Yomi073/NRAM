class TariffModel {
  final String? priceId;
  final String? tariffModel;
  final bool? hasTwoPrices;
  final String? privacyStatus;
  final String? currency;
  final String? type;

  TariffModel({
    required this.priceId,
    required this.tariffModel,
    required this.hasTwoPrices,
    required this.privacyStatus,
    required this.currency,
    required this.type,
  });

  factory TariffModel.fromJson(Map<String, dynamic> json) {
    return TariffModel(
      priceId: json['priceId'] as String?,
      tariffModel: json['tariffModel'] as String?,
      hasTwoPrices: json['hasTwoPrices'] as bool?,
      privacyStatus: json['privacyStatus'] as String?,
      currency: json['currency'] as String?,
      type: json['type'] as String?,
    );
  }
}
