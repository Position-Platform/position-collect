import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:positioncollect/src/blocs/auth/auth_bloc.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  mainBloc();
}

void mainBloc() {
  group('AuthBloc', () {
    blocTest<AuthBloc, AuthState>(
      'emits [] when nothing is added',
      build: () => AuthBloc(),
      expect: () => [],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [1] when AuthStarted is added',
      build: () => AuthBloc(),
      act: (bloc) => bloc.add(AuthStarted()),
      expect: () => [1],
    );
  });
}
