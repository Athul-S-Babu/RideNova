class BookingResponseModel {
  final String pickup;
  final String destination;
  final String date;
  final String time;
  final String vehicle;

  const BookingResponseModel({
    required this.pickup,
    required this.destination,
    required this.date,
    required this.time,
    required this.vehicle,
  });

  factory BookingResponseModel.fromJson(Map<String, dynamic> json) {
    return BookingResponseModel(
      pickup: json['pickup'] as String? ?? '',
      destination: json['destination'] as String? ?? '',
      date: json['date'] as String? ?? '',
      time: json['time'] as String? ?? '',
      vehicle: json['vehicle'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pickup': pickup,
      'destination': destination,
      'date': date,
      'time': time,
      'vehicle': vehicle,
    };
  }

  BookingResponseModel copyWith({
    String? pickup,
    String? destination,
    String? date,
    String? time,
    String? vehicle,
  }) {
    return BookingResponseModel(
      pickup: pickup ?? this.pickup,
      destination: destination ?? this.destination,
      date: date ?? this.date,
      time: time ?? this.time,
      vehicle: vehicle ?? this.vehicle,
    );
  }
}