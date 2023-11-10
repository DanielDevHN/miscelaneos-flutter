import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class BiometricScreen extends ConsumerWidget {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final canCheckBiometrics = ref.watch(canCheckBiometricsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometric Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {},
              child: const Text('Authenticate'),
            ),

            canCheckBiometrics.when(
              data: (canChek) => Text('Can check biometrics: $canChek'),
              error: (error, _) => Text('Error: $error'),
              loading: () => const CircularProgressIndicator(),
            ),

            //TODO: Feedback for biometric authentication
            const SizedBox(height: 40),
            const Text('Status of biometric', style: TextStyle(fontSize: 30)),
            const Text('Status: XXXX', style: TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }
}
