import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class LocalAuthPlugin {
  static final LocalAuthentication auth = LocalAuthentication();

  static availableBiometrics() async {
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      // Some biometrics are enrolled.
    }

    if (availableBiometrics.contains(BiometricType.strong) ||
        availableBiometrics.contains(BiometricType.face)) {
      // Specific types of biometrics are available.
      // Use checks like this with caution!
    }
  }

  static Future<bool> canCheckBiometrics() async {
    return await auth.canCheckBiometrics;
  }

  static Future<(bool, String)> authenticate() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Please authenticate to continue',
          options: const AuthenticationOptions(biometricOnly: true));

      return (
        didAuthenticate,
        didAuthenticate ? 'Authenticated' : 'Not authenticated'
      );
    } on PlatformException catch (e) {
      print(e);

      if (e.code == auth_error.notEnrolled)
        return (false, 'Not enrolled biometrics');
      if (e.code == auth_error.lockedOut)
        return (false, 'Locked out biometrics');
      if (e.code == auth_error.notAvailable)
        return (false, 'Not available biometrics');
      if (e.code == auth_error.permanentlyLockedOut)
        return (false, 'Permanently locked out biometrics');

      return (false, e.toString());
    }
  }
}
