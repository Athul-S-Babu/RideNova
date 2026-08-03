class BookingDetails {
  final String pickup;
  final String destination;
  final String date;
  final String time;
  final String vehicle;

  const BookingDetails({
    required this.pickup,
    required this.destination,
    required this.date,
    required this.time,
    required this.vehicle,
  });

  BookingDetails copyWith({
    String? pickup,
    String? destination,
    String? date,
    String? time,
    String? vehicle,
  }) {
    return BookingDetails(
      pickup: pickup ?? this.pickup,
      destination: destination ?? this.destination,
      date: date ?? this.date,
      time: time ?? this.time,
      vehicle: vehicle ?? this.vehicle,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookingDetails &&
        other.pickup == pickup &&
        other.destination == destination &&
        other.date == date &&
        other.time == time &&
        other.vehicle == vehicle;
  }

  @override
  int get hashCode {
    return Object.hash(
      pickup,
      destination,
      date,
      time,
      vehicle,
    );
  }

  @override
  String toString() {
    return 'BookingDetails('
        'pickup: $pickup, '
        'destination: $destination, '
        'date: $date, '
        'time: $time, '
        'vehicle: $vehicle'
        ')';
  }
}