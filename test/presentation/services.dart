import 'package:collaction_app/application/auth/auth_bloc.dart';
import 'package:collaction_app/application/crowdaction/subscription/subscription_bloc.dart';
import 'package:collaction_app/application/crowdaction/subscription_status/subscription_status_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/core_fixtures.dart';

final getIt = GetIt.instance;

void registerServices() {
  getIt.registerSingleton<AuthBloc>(MockAuthBloc());
  getIt.registerSingleton<SubscriptionBloc>(MockSubscriptionBloc());
  getIt.registerSingleton<SubscriptionStatusBloc>(MockSubscriptionStatusBloc());
}
