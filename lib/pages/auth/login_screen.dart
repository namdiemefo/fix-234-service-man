import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_man/core/login/login_bloc.dart';
import 'package:service_man/helpers/assets/colors.dart';
import 'package:service_man/helpers/reusable_screens/app_button.dart';
import 'package:service_man/helpers/reusable_screens/app_loader.dart';
import 'package:service_man/helpers/utils/app_utils.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: _LoginScreen(),
    );
  }
}


class _LoginScreen extends StatefulWidget {
  @override
  __LoginScreenState createState() => __LoginScreenState();
}

class __LoginScreenState extends State<_LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  String _id;
  String _password;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(

      listenWhen: (prevState, nextState) {
        if (prevState is OnLoading) {
          Load.dismiss(context);
        }
        return null;
      },

     listener: (context, state) {
       if (state is OnFailure) {
         AppUtils.showErrorFlushBar(context, state.error);
       }

       if (state is OnSuccess) {
         Navigator.pushNamedAndRemoveUntil(context, 'navigation/home', (route) => false);
       }

       if (state is OnLoading) {
         Load.show(context);
       }
    },
      child: BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {



    return Scaffold(
      backgroundColor: bMilk,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Padding(
                  padding: EdgeInsets.only(top: 150.0),
                  child: Text(
                    'Welcome to',
                    style: AppUtils.adaptableTextStyle(size: 14.0, color: bPurple, fontWeight: FontWeight.bold),
                  ),
              ),
              AppUtils.verticalSpacing(height: 3.0),
              Text(
                'Smooth Repairs',
                style: AppUtils.adaptableTextStyle(size: 35.0, color: bPurple, fontWeight: FontWeight.bold),
              ),
              AppUtils.verticalSpacing(height: 10.0),

              //FORM
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter valid ID';
                                    }
                                    return null;
                                  },
                                onSaved: (value) {
                                  _id = value.trim();
                                },
                                decoration: InputDecoration(
                                  hintText: 'Fix-234 Valid ID',
                                  helperText: 'FX-1234',
                                  hintStyle: AppUtils.adaptableTextStyle(size: 14.0, color: bHintColor, fontWeight: FontWeight.w400),
                                ),
                              )
                          )
                        ],
                      ),

                      AppUtils.verticalSpacing(height: 10.0),

                      Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter valid password';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _password = value.trim();
                                },
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: AppUtils.adaptableTextStyle(size: 14.0, color: bHintColor, fontWeight: FontWeight.w400),
                                ),
                              )
                          )
                        ],
                      ),
                    ],
                  )
              ),

              AppUtils.verticalSpacing(height: AppUtils.screenAwareSize(100.0, context)),
              
              Row(
                children: [
                  Expanded(
                      child: AppButton(
                        enabled: true,
                        enabledColor: bPurple,
                        buttonText: 'Log in',
                        voidCallback: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            BlocProvider.of<LoginBloc>(context).add(SubmitForm(_id, _password));
                          }

                        },
                      )
                  )
                ],
              ),
              AppUtils.verticalSpacing(height: 10.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        // final route = MaterialPageRoute(builder: (context) => RegisterPage());
                        // Navigator.push(context, route);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap
                      ),
                      child: Text('Forgot Password?', style: TextStyle(fontSize: 12.0 ,color: bPurple) )
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  },
),
);
  }
}
