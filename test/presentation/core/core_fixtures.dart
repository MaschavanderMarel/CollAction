import 'package:bloc_test/bloc_test.dart';
import 'package:collaction_app/application/auth/auth_bloc.dart';
import 'package:collaction_app/application/crowdaction/subscription/subscription_bloc.dart';
import 'package:collaction_app/application/crowdaction/subscription_status/subscription_status_bloc.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class MockSubscriptionBloc
    extends MockBloc<SubscriptionEvent, SubscriptionState>
    implements SubscriptionBloc {}

class MockSubscriptionStatusBloc
    extends MockBloc<SubscriptionStatusEvent, SubscriptionStatusState>
    implements SubscriptionStatusBloc {}
