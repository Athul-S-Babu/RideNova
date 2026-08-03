import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../home/domain/entities/location.dart';
import '../../../home/presentation/providers/home_providers.dart';

import '../provider/ai_provider.dart';


class AiAssistantPage extends ConsumerStatefulWidget {
  const AiAssistantPage({super.key});

  @override
  ConsumerState<AiAssistantPage> createState() =>
      _AiAssistantPageState();
}

class _AiAssistantPageState
    extends ConsumerState<AiAssistantPage> {
  final TextEditingController _messageController =
  TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final message = _messageController.text.trim();

    if (message.isEmpty) return;

    ref
        .read(aiAssistantProvider.notifier)
        .extractBooking(message);

    _messageController.clear();
  }
  void _continueBooking() {
    final booking = ref.read(aiAssistantProvider).bookingDetails;

    if (booking == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No booking details found'),
        ),
      );
      return;
    }

    final pickup = Location(
      id: 'pickup',
      address: booking.pickup,
      latitude: 0,
      longitude: 0,
    );

    final destination = Location(
      id: 'destination',
      address: booking.destination,
      latitude: 0,
      longitude: 0,
    );

    ref.read(currentRideProvider.notifier).setPickupLocation(pickup);


    final vehicleTypes = ref.read(vehicleTypesProvider);

    final selectedVehicle = vehicleTypes.firstWhere(
          (vehicle) =>
      vehicle.name.toLowerCase() ==
          booking.vehicle.toLowerCase(),
      orElse: () => vehicleTypes.first,
    );

    ref
        .read(currentRideProvider.notifier)
        .setVehicleType(selectedVehicle);

    ref
        .read(selectedVehicleTypeProvider.notifier)
        .state = selectedVehicle;

    ref.read(currentRideProvider.notifier).setDropoffLocation(destination);

    context.go('/location-selector');
  }
  @override
  Widget build(BuildContext context) {
    final aiState = ref.watch(aiAssistantProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('RideNova AI'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: _buildBody(context, aiState),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText:
                        'Describe your ride',
                        border: OutlineInputBorder(

                        ),
                      ),
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _sendMessage(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(
      BuildContext context,
      AiAssistantState state,
      ) {
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state.errorMessage != null) {
      return Center(
        child: Text(
          state.errorMessage!,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    if (state.bookingDetails == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.smart_toy_outlined,
              size: 80,
            ),
            SizedBox(height: 20),
            Text(
              "Hi! I'm RideNova AI",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Describe your trip naturally.\n\nExample:\n.",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }

    final booking = state.bookingDetails!;

    return ListView(
      children: [
        const Text(
          "Ride Details",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 20),

        Card(
          child: ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text("Pickup"),
            subtitle: Text(booking.pickup),
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.flag),
            title: const Text("Destination"),
            subtitle: Text(booking.destination),
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text("Date"),
            subtitle: Text(booking.date),
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.access_time),
            title: const Text("Time"),
            subtitle: Text(booking.time),
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(Icons.directions_car),
            title: const Text("Vehicle"),
            subtitle: Text(booking.vehicle),
          ),
        ),

        const SizedBox(height: 24),

        // ElevatedButton.icon(
        //   onPressed: () {
        //     // Next step:
        //     // Navigate to Ride Booking page
        //     // and update currentRideProvider
        //   },
        //   icon: const Icon(Icons.local_taxi),
        //   label: const Text("Continue Booking"),
        // ),




        ElevatedButton.icon(
          onPressed: _continueBooking,
          icon: const Icon(Icons.local_taxi),
          label: const Text("Continue Booking"),
        ),
      ],
    );
  }
}