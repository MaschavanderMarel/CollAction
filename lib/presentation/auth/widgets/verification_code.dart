import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../core/core.dart';
import '../../shared_widgets/pin_input/pin_input.dart';

class EnterVerificationCode extends StatefulWidget {
  final int pinLength;

  const EnterVerificationCode({super.key, this.pinLength = 6});

  @override
  EnterVerificationCodeState createState() => EnterVerificationCodeState();
}

class EnterVerificationCodeState extends State<EnterVerificationCode> {
  final _pinKey = GlobalKey<PinInputState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.mapOrNull(
          verificationCompleted: (verificationState) =>
              _pinKey.currentState?.autoComplete(verificationState.smsCode),
        );
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'Enter your \r\nverification code',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 32.0),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'We just sent you a text message with a 6-digit code to verify your account',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: context.kTheme.inactiveColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 45.0),
            PinInput(
              key: _pinKey,
              readOnly: state is SigningInUser,
              submit: (smsCode) {
                FocusScope.of(context).unfocus();
                context
                    .read<AuthBloc>()
                    .add(AuthEvent.signInWithPhone(smsCode));
              },
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state is SigningInUser || state is AwaitingCodeResend) ...[
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      color: context.kTheme.accentColor,
                      strokeWidth: 2,
                    ),
                  ),
                ] else ...[
                  Expanded(
                    child: TextButton(
                      onPressed: () => context
                          .read<AuthBloc>()
                          .add(const AuthEvent.resendCode()),
                      child: Text(
                        'No code? Click here and we will send a new one',
                        style: TextStyle(
                          color: context.kTheme.accentColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        );
      },
    );
  }
}
