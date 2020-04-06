import 'package:eventos_unaspht/app/pages/login/signup/components/card_gender.dart';
import 'package:eventos_unaspht/app/pages/login/signup/login_module.dart';
import 'package:eventos_unaspht/app/pages/login/signup/signup_bloc.dart';
import 'package:eventos_unaspht/app/shared/components/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class GenderStep extends StatefulWidget {
  @override
  _GenderStepState createState() => _GenderStepState();
}

class _GenderStepState extends State<GenderStep> {
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    Color orange = Theme.of(context).secondaryHeaderColor;
    SignupBloc signupBloc = LoginModule.to.getBloc<SignupBloc>();

    selectGender(String g) {
      signupBloc.genderController.add(g);
    }

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Informe seu gênero".toUpperCase(),
                style: TextStyle(color: Theme.of(context).primaryColor)),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<String>(
                stream: signupBloc.genderController,
                builder: (context, snapshot) {
                  return Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => selectGender("m"),
                        child: CardGender(
                          icon: FontAwesomeIcons.male,
                          title: "Masculino",
                          isSelected: snapshot.hasData && snapshot.data == "m",
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => selectGender("f"),
                        child: CardGender(
                          icon: FontAwesomeIcons.female,
                          title: "Feminino",
                          isSelected: snapshot.hasData && snapshot.data == "f",
                        ),
                      ),
                    ],
                  );
                }),
            SizedBox(height: 20),
            StreamBuilder<bool>(
                stream: signupBloc.isValidGenderController,
                builder: (context, snapshot) {
                  return Button(
                      enabled: snapshot.hasData && snapshot.data,
                      color: orange,
                      onTap: () => signupBloc.pageController.nextPage(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.easeIn),
                      context: context,
                      text: "Continuar");
                })
          ],
        ),
      ),
    );
  }
}
