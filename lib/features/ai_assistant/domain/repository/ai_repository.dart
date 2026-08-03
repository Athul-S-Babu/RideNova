import '../entities/booking__details.dart';


abstract class AiRepository {
  Future<BookingDetails> extractBookingDetails(String message);
}