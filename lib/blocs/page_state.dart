part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnRegistrastionPage extends PageState {
  final RegistrationData registrationData;
  OnRegistrastionPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnAccounConfirmationPage extends PageState {
  final RegistrationData registrationData;
  OnAccounConfirmationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnProfilePage extends PageState {
  @override
  List<Object> get props => [];
}
