import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interactive_diary/bloc/authentication/signup/google_signup_bloc.dart';
import 'package:interactive_diary/features/signup/signup_screen.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter/material.dart';
import '../../mock_firebase.dart';
import '../../widget_tester_extension.dart';
import 'signup_screen_test.mocks.dart';

@GenerateMocks(<Type>[GoogleSignupBloc])
void main() {
  setupFirebaseAuthMocks();
  final GoogleSignupBloc mockSignUpBloc = MockGoogleSignupBloc();
  late IDSignUp screen;

  setUpAll(() async {
    await Firebase.initializeApp();
    screen = const IDSignUp();
  });

  group('Signup with google', () {
    testWidgets(
        'When State is GoogleSigninInitialState, '
        'then the Google button is showed with idle status',
        (WidgetTester widgetTester) async {
      when(mockSignUpBloc.stream).thenAnswer(
          (_) => Stream<GoogleSignupState>.value(GoogleSignupInitialState()));
      when(mockSignUpBloc.state).thenAnswer((_) => GoogleSignupInitialState());

      final Finder googleButton =
          find.widgetWithText(IDGoogleSignInButton, 'Continue with Google');

      await widgetTester.blocWrapAndPump<GoogleSignupBloc>(
          mockSignUpBloc, screen,
          infiniteAnimationWidget: true);

      expect(googleButton, findsOneWidget);
    });

    testWidgets(
        'When State is GoogleSigningUpState, '
        'then the Google button is showed with loading status',
        (WidgetTester widgetTester) async {
      Widget googleButton = const IDGoogleSignInButton();
      when(mockSignUpBloc.stream).thenAnswer(
          (_) => Stream<GoogleSignupState>.value(GoogleSigningUpState()));
      when(mockSignUpBloc.state).thenAnswer((_) => GoogleSigningUpState());

      await widgetTester.blocWrapAndPump<GoogleSignupBloc>(
          mockSignUpBloc, googleButton,
          infiniteAnimationWidget: true);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    /// TODO : Re-test after enable navigation/ showDialog
    // testWidgets('When State is GoogleSignupFailedState, '
    //   'then show failed signup dialog',
    //       (WidgetTester widgetTester) async {
    //     final GoogleSignupFailedState signUpFailedState = GoogleSignupFailedState('error');
    //
    //     when(mockSignUpBloc.stream).thenAnswer((_) =>
    //       Stream<GoogleSignupState>.value(signUpFailedState));
    //     when(mockSignUpBloc.state).thenAnswer((_) => signUpFailedState);
    //
    //     await widgetTester.pumpWidget(MaterialApp(home: screen,));
    //
    //     expect(find.byType(AlertDialog), findsOneWidget);
    //
    //   });
  });
}
