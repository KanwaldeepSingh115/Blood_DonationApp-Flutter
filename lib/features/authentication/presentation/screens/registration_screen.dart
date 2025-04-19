import 'package:blood_donation_app/common_widgets/async_value_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/common_button.dart';
import '../../../../common_widgets/common_text_field.dart';
import '../../../../routes/routes.dart';
import '../../../../util/appstyles.dart';
import '../../../../util/size_config.dart';
import '../controllers/auth_controller.dart';

class RegistrationScreen extends ConsumerStatefulWidget{
const RegistrationScreen(this.type, {super.key});

final String type;

@override
ConsumerState createState()=> _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen>{
  final _emailController= TextEditingController();
  final _passwordController= TextEditingController();
  final _nameController= TextEditingController();
  final _phoneNumberController= TextEditingController();

  String? _selectedBloodGroup;

  final List<String> _bloodGroups=[
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
  ];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();

    super.dispose();
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
                Text('${widget.type} Registration',style: AppStyles.titleTextStyle.copyWith(color: Colors.black),
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(25)),
                CommonTextField(hintText: 'Enter Name...', textInputType:TextInputType.text, controller: _nameController
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(10)),
                CommonTextField(hintText: 'Enter Phone Number...', textInputType:TextInputType.number, controller: _phoneNumberController
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(10)),


                DropdownButtonFormField<String>(
                    value: _selectedBloodGroup,
                    decoration: InputDecoration(
                      labelText: 'Select Blood Group',
                      labelStyle: AppStyles.normalTextStyle.copyWith(color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  items: _bloodGroups.map((String group){
                    return DropdownMenuItem<String>(
                      value: group,
                        child: Text(
                          group,
                          style: AppStyles.normalTextStyle.copyWith(
                            color: Colors.black,
                          ),
                        ));
                  }).toList(),
                  onChanged: (String? newValue){
                      setState(() {
                        _selectedBloodGroup = newValue;
                      });
                  },
                ),


                SizedBox(height: SizeConfig.getProportionateHeight(10)),
                CommonTextField(hintText: 'Enter Email...', textInputType:TextInputType.emailAddress, controller: _emailController
                ),
                SizedBox(height: SizeConfig.getProportionateHeight(10)),
                CommonTextField(hintText: 'Enter Password...', textInputType:TextInputType.text, controller: _passwordController
                ),

                SizedBox(height: SizeConfig.getProportionateHeight(10)),
                CommonButton(onTap: () {
                  final email=_emailController.text.toString();
                  final password=_passwordController.text.toString();
                  final name=_nameController.text.toString();
                  final phoneNumber=_phoneNumberController.text.toString();

                  ref.read(authControllerProvider.notifier)
                  .createUserWithEmailAndPassword(email: email, password: password, name: name, bloodGroup: _selectedBloodGroup!, phoneNumber: phoneNumber, type: widget.type);

                }, title: 'Register Me Now', isLoading: state.isLoading),
                SizedBox(height: SizeConfig.getProportionateHeight(15)),
                Text('OR',style: AppStyles.titleTextStyle.copyWith(color: Colors.black),),
                SizedBox(height: SizeConfig.getProportionateHeight(15)),


                GestureDetector(
                  onTap: (){
                    context.goNamed(AppRoutes.signIn.name,);
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
                    child: Text('Sign In to my Account',style: AppStyles.normalTextStyle.copyWith(color:Colors.black),
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
