class GoogleLatLng {
  final String lat;
  final String lng;

  GoogleLatLng({
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory GoogleLatLng.fromJson(Map<String, dynamic> json) {
    return GoogleLatLng(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}
