class BookingRequestModel {
  final String message;

  const BookingRequestModel({
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }

  factory BookingRequestModel.fromJson(Map<String, dynamic> json) {
    return BookingRequestModel(
      message: json['message'] as String,
    );
  }

  BookingRequestModel copyWith({
    String? message,
  }) {
    return BookingRequestModel(
      message: message ?? this.message,
    );
  }
}