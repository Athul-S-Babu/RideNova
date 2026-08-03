import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/gemini_remote_datasource.dart';
import '../../data/repository/ai_repository_impl.dart';

import '../../domain/entities/booking__details.dart';

import '../../domain/usercases/extract_booking_details.dart';

/// ---------------------------
/// STATE
/// ---------------------------

class AiAssistantState {
  final bool isLoading;
  final BookingDetails? bookingDetails;
  final String? errorMessage;

  const AiAssistantState({
    this.isLoading = false,
    this.bookingDetails,
    this.errorMessage,
  });

  AiAssistantState copyWith({
    bool? isLoading,
    BookingDetails? bookingDetails,
    String? errorMessage,
  }) {
    return AiAssistantState(
      isLoading: isLoading ?? this.isLoading,
      bookingDetails: bookingDetails ?? this.bookingDetails,
      errorMessage: errorMessage,
    );
  }
}

/// ---------------------------
/// NOTIFIER
/// ---------------------------

class AiAssistantNotifier
    extends StateNotifier<AiAssistantState> {

  final ExtractBookingDetails extractBookingDetails;

  AiAssistantNotifier(this.extractBookingDetails)
      : super(const AiAssistantState());

  Future<void> extractBooking(String message) async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
    );

    try {
      final booking = await extractBookingDetails(message);

      state = state.copyWith(
        isLoading: false,
        bookingDetails: booking,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }
}

/// ---------------------------
/// PROVIDER
/// ---------------------------

final aiAssistantProvider =
StateNotifierProvider<
    AiAssistantNotifier,
    AiAssistantState>((ref) {

  return AiAssistantNotifier(
    ExtractBookingDetails(
      repository: AiRepositoryImpl(
        remoteDataSource: GeminiRemoteDataSource(
          apiKey: '',
        ),
      ),
    ),
  );
});