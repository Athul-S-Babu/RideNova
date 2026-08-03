import '../entities/booking__details.dart';

import '../repository/ai_repository.dart';

class ExtractBookingDetails {
  final AiRepository repository;

  const ExtractBookingDetails({
    required this.repository,
  });

  Future<BookingDetails> call(String message) {
    return repository.extractBookingDetails(message);
  }
}