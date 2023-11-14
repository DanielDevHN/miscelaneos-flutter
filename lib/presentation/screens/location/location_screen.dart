import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userLocationAsync = ref.watch(userLocationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //!Current Location
            const Text('Current Location'),
            userLocationAsync.when(
              data: (data) => Text('$data'),
              error: (error, stackTrace) => Text('Error: $error'),
              loading: () => LoadingAnimationWidget.staggeredDotsWave(
                  color: Color(Colors.blue.value), size: 50),
            ),

            const SizedBox(height: 30),
            //!Location tracking
            const Text('Location tracking'),
          ],
        ),
      ),
    );
  }
}
