import 'package:blood_donation_app/common_widgets/async_value_ui.dart';
import 'package:blood_donation_app/common_widgets/common_button.dart';
import 'package:blood_donation_app/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:blood_donation_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/common_text_field.dart';
import '../../../../util/appstyles.dart';
import '../../../../util/size_config.dart';

class SignInScreen extends ConsumerStatefulWidget{
  const SignInScreen({super.key});

  @override
ConsumerState createState()=> _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen>{

  final _emailController= TextEditingController();
  final _passwordController= TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

  }

  @override
Widget build(BuildContext context){
    SizeConfig.init(context);

    final state =ref.watch(authControllerProvider);

    ref.listen<AsyncValue>(authControllerProvider, (_, state){
      state.showAlertDialogOnError(context);
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyles.mainColor,
        body: Padding(
          padding: EdgeInsets.fromLTRB(SizeConfig.getProportionateWidth(10), SizeConfig.getProportionateHeight(50), SizeConfig.getProportionateWidth(10), 0),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
                Image.asset('assets/logo.png',
                  height: SizeConfig.getProportionateHeight(100),
                  width: SizeConfig.getProportionateWidth(100),
                  fit:BoxFit.cover,
                ),
                Text('Sign In to your account',style: AppStyles.titleTextStyle.copyWith(color: Colors.black),
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(25)),
                CommonTextField(hintText: 'Enter Email...', textInputType:TextInputType.emailAddress, controller: _emailController
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(10)),
                CommonTextField(hintText: 'Enter Password...', textInputType:TextInputType.text, controller: _passwordController
                ),
      
                SizedBox(height: SizeConfig.getProportionateHeight(10)),
                CommonButton(onTap: () {
                  final email= _emailController.text.toString();
                  final password= _passwordController.text.toString();

                  ref.read(authControllerProvider.notifier)
                  .signInWithEmailAndPassword(email: email, password: password);


                }, title: 'Sign In', isLoading: state.isLoading),
                SizedBox(height: SizeConfig.getProportionateHeight(15)),
                Text('OR',style: AppStyles.titleTextStyle.copyWith(color: Colors.black),),
                SizedBox(height: SizeConfig.getProportionateHeight(15)),
                GestureDetector(
                  onTap: (){
                    context.goNamed(AppRoutes.register.name,extra:'Recipient');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: SizeConfig.screenWidth,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color:Colors.black,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Text('Register as Recipient',style: AppStyles.normalTextStyle.copyWith(color:Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(10)),
                GestureDetector(
                  onTap: (){
                    context.goNamed(AppRoutes.register.name,extra:'Donor');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: SizeConfig.screenWidth,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color:Colors.black,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Text('Register as Donor',style: AppStyles.normalTextStyle.copyWith(color:Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(10)),
              ],),
            ),
          ),
        ),
      ),
    );
}
}
