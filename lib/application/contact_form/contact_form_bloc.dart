import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../domain/contact_form/i_contact_form_repository.dart';
import '../../infrastructure/contact_form/contact_form_dto.dart';

part 'contact_form_event.dart';
part 'contact_form_state.dart';

@injectable
class ContactFormBloc extends Bloc<ContactFormEvent, ContactFormState> {
  final IContactRepository _contactFormApi;

  ContactFormBloc(this._contactFormApi)
      : super(const ContactFormState.initial()) {
    on<ContactFormEvent>(
      (event, emit) async {
        if (event is _Submitted) {
          emit(const ContactFormState.submitting());

          final unitOrFailure = await _contactFormApi.sendContactFormContents(
            event.contents,
          );

          if (unitOrFailure.isRight()) {
            emit(const ContactFormState.submissionSuccessful());
          } else {
            emit(const ContactFormState.failed('Submission failed'));
          }
        }
      },
    );
  }
}
