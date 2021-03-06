import 'package:eventos_unaspht/app/pages/login/signup/login_module.dart';
import 'package:eventos_unaspht/app/pages/login/signup/signup_bloc.dart';
import 'package:eventos_unaspht/app/shared/components/button.dart';
import 'package:eventos_unaspht/app/shared/components/text.field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


//INFORMAÇÕES DE CADASTRO

class BasicInfoStep extends StatefulWidget {
  @override
  _BasicInfoStepState createState() => _BasicInfoStepState();
}

class _BasicInfoStepState extends State<BasicInfoStep> {
  @override
  Widget build(BuildContext context) {
    Color orange = Theme.of(context).secondaryHeaderColor;
    SignupBloc signupBloc = LoginModule.to.getBloc<SignupBloc>();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            CustomTextField(
              controller: signupBloc.nameController,
              isBlue: false,
              onChanged: signupBloc.isValidBasicForm,
              icon: FontAwesomeIcons.userAlt,
              hintText: "Nome e Sobrenome",
              isPassword: false,
              inputType: TextInputType.text,
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: signupBloc.emailController,
              isBlue: false,
              icon: FontAwesomeIcons.solidEnvelope,
              hintText: "E-mail",
              onChanged: signupBloc.isValidBasicForm,
              isPassword: false,
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            CustomTextField(
              onChanged: signupBloc.isValidBasicForm,
              controller: signupBloc.passController,
              isBlue: false,
              icon: FontAwesomeIcons.lock,
              hintText: "Senha",
              isPassword: true,
              inputType: TextInputType.text,
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: signupBloc.passconfirmController,
              isBlue: false,
              onChanged: signupBloc.isValidBasicForm,
              icon: FontAwesomeIcons.lock,
              hintText: "Confirmação de senha",
              isPassword: true,
              inputType: TextInputType.text,
            ),
            SizedBox(height: 20),
            StreamBuilder<bool>(
                stream: signupBloc.isValidBasicController,
                builder: (context, snapshot) {
                  return Button(
                      enabled: snapshot.hasData && snapshot.data,
                      color: orange,
                      onTap: () {
                        signupBloc.pageController.nextPage(
                            curve: Curves.easeIn,
                            duration: Duration(milliseconds: 100));
                      },
                      context: context,
                      text: "Continuar");
                }),
          ],
        ),
      ),
    );
  }
}
