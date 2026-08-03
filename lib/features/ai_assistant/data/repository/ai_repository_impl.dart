import '../../domain/entities/booking__details.dart';

import '../../domain/repository/ai_repository.dart';
import '../datasource/gemini_remote_datasource.dart';
import '../models/booking_response_model.dart';

class AiRepositoryImpl implements AiRepository {
  final GeminiRemoteDataSource remoteDataSource;

  const AiRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<BookingDetails> extractBookingDetails(String message) async {
    final Map<String, dynamic> response =
    await remoteDataSource.extractBookingDetails(message);

    final BookingResponseModel model =
    BookingResponseModel.fromJson(response);

    return BookingDetails(
      pickup: model.pickup,
      destination: model.destination,
      date: model.date,
      time: model.time,
      vehicle: model.vehicle,
    );
  }
}