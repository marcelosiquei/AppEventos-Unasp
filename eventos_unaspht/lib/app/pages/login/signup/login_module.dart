import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:eventos_unaspht/app/pages/login/signup/signup_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:eventos_unaspht/app/pages/login/recovery_pass/recover_pass_bloc.dart';
import 'package:eventos_unaspht/app/pages/login/signin/signin_bloc.dart';
import 'package:eventos_unaspht/app/pages/login/signin/signin_page.dart';
import 'package:eventos_unaspht/app/pages/login/signup/login_repository.dart';


class LoginModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => SigninBloc()),
        Bloc((i) => RecoverPassBloc()),
        Bloc((i) => SignupBloc(i.getDependency<LoginRepository>())),
      ];

  @override
  List<Dependency> get dependencies => [Dependency((i) => LoginRepository())];

  @override
  Widget get view => SigninPage();

  static Inject get to => Inject<LoginModule>.of();
}

