// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:miscelaneos/config/config.dart';

final canCheckBiometricsProvider = FutureProvider<bool>((ref) async {
  return await LocalAuthPlugin.canCheckBiometrics();
});

enum localAuthStatus { authenticated, unauthenticated, authenticating }

class LocalAuthStatus {
  final bool didAuthenticate;
  final localAuthStatus status;
  final String message;

  LocalAuthStatus({
    this.didAuthenticate = false,
    this.status = localAuthStatus.unauthenticated,
    this.message = '',
  });

  LocalAuthStatus copyWith({
    bool? didAuthenticate,
    localAuthStatus? status,
    String? message,
  }) =>
      LocalAuthStatus(
        didAuthenticate: didAuthenticate ?? this.didAuthenticate,
        status: status ?? this.status,
        message: message ?? this.message,
      );
}
