import 'package:flutter/material.dart';
import 'package:pokeman_app/screens/splashscreen.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pokeman_app/screens/auth/helper.dart';

class createAccount extends StatelessWidget {
  createAccount({Key? key}) : super(key: key);

 final _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
  final _passFieldKey = GlobalKey<FormBuilderFieldState>();
   TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
  return FormBuilder(
      key: _formKey,
    child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      FormBuilderTextField(
                    controller: emailcontroller ,
    key: _emailFieldKey,
    name: 'email',
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.email_sharp),
      hintText: 'Enter email',
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
      ),
    ),
    keyboardType: TextInputType.emailAddress,
    validator: FormBuilderValidators.compose([
     (val) {
      return val == null ? "Field is empty" : null;
    },
    FormBuilderValidators.required(), 
    FormBuilderValidators.email(), 
  
    ]),
  ),
                    const SizedBox(height: 30),
                    FormBuilderTextField(
                        controller: passcontroller,
                        obscureText: true,
                        key: _passFieldKey,
                        name: 'Password',
                        decoration: InputDecoration(
                          hintText: 'Enter password',
                          prefixIcon: Icon(Icons.key),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
    
                          ),
                          suffixIcon: Icon(Icons.visibility_off_outlined,
                              size: 20,
                              color: Colors.grey),
                        ),
                              validator: FormBuilderValidators.compose([
     (val) {
      return val == null ? "Field is empty" : null;
    },
   FormBuilderValidators.required(),
    FormBuilderValidators.minLength(8),
  
  
    ]),
                      ),
                    const SizedBox(height: 5,),
                    TextButton(
                        onPressed: (){
  
                        },
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF009946),
                              fontSize: 15),
                        )),
                    SizedBox(height: 30),
  
                    Center(
                      child: Container(
                        width: 220,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: ()  {
                              if (_formKey.currentState!.validate())  {
             AccountCreate(emailcontroller.text , passcontroller.text , context);
                  
                }
  
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF009946),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )
                            ),
                            child: Text("Create Account",
                            )),
                      ),
                    )
  
                  ],
                ),
  
  
  
      ),
  );
  }


}
