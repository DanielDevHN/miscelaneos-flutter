// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:miscelaneos/config/config.dart';

final canCheckBiometricsProvider = FutureProvider<bool>((ref) async {
  return await LocalAuthPlugin.canCheckBiometrics();
});

enum localAuthStatus { authenticated, unauthenticated, authenticating }

class LocalAuthState {
  final bool didAuthenticate;
  final localAuthStatus status;
  final String message;

  LocalAuthState({
    this.didAuthenticate = false,
    this.status = localAuthStatus.unauthenticated,
    this.message = '',
  });

  LocalAuthState copyWith({
    bool? didAuthenticate,
    localAuthStatus? status,
    String? message,
  }) =>
      LocalAuthState(
        didAuthenticate: didAuthenticate ?? this.didAuthenticate,
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  String toString() {
    return '''

      didAuthenticate: $didAuthenticate,
      status: $status,
      message: $message,
  ''';
  }
}

class LocalAuthNotifier extends StateNotifier<LocalAuthState> {
  LocalAuthNotifier() : super(LocalAuthState());

  Future<(bool, String)> authenticateUser() async {
    final (didAuthenticate, message) = await LocalAuthPlugin.authenticate();

    state = state.copyWith(
      didAuthenticate: didAuthenticate,
      message: message,
      status: didAuthenticate
          ? localAuthStatus.authenticated
          : localAuthStatus.unauthenticated,
    );

    return (didAuthenticate, message);
  }
}

final localAuthProvider =
    StateNotifierProvider<LocalAuthNotifier, LocalAuthState>((ref) {
  return LocalAuthNotifier();
});
