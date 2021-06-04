import 'dart:core';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicare/Themes/size_config.dart';
import 'package:medicare/Themes/style.dart';
import 'package:medicare/bloc/register_bloc.dart';
import 'package:medicare/bloc/register_event.dart';
import 'package:medicare/model/user_data.dart';
import 'package:medicare/widgets/widgets.dart';
import 'package:signature/signature.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medicare/extensions/extensions.dart';



double h = SizeConfig.heightMultiplier;
double w = SizeConfig.widthMultiplier;

bool checkValue1 = false;
bool checkValue2 = false;

bool checkValue3 = false;
bool checkValue4 = false;
bool checkValue5 = false;
bool checkValue6 = false;

int radioValue1 = 0;
int _radioValue2 = 0;
int _radioValue3 = 0;

String chosenValue = 'Alabama';

final SignatureController _signatureController = SignatureController(
  penStrokeWidth: 5,
  penColor: Colors.red,
  exportBackgroundColor: Colors.blue,
);

//form 1

TextEditingController requesterFirstController = TextEditingController();
TextEditingController requesterLastController = TextEditingController();
TextEditingController instituteController = TextEditingController();
TextEditingController departController = TextEditingController();
TextEditingController instituteAddrController1 = TextEditingController();
TextEditingController instituteAddrController2 = TextEditingController();
TextEditingController stateController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController zipController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController faxController = TextEditingController();
TextEditingController emailController = TextEditingController();


// form 2
TextEditingController patientController = TextEditingController();
TextEditingController descController = TextEditingController();
TextEditingController dobController = TextEditingController();
TextEditingController dorController = TextEditingController();

//form 3

TextEditingController represNameController = TextEditingController();
TextEditingController represTypeController = TextEditingController();
TextEditingController represTerritoryController = TextEditingController();
TextEditingController countryCodeController = TextEditingController();
TextEditingController telePhoneController = TextEditingController();



class AppForm extends StatefulWidget {
  @override
  _AppFormState createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {

  final _formKey = GlobalKey<FormState>();

   late RegisterBloc _registerBloc;

  @override
  Widget build(BuildContext context) {

    _registerBloc = BlocProvider.of<RegisterBloc>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppForm1(),
          Divider(),
          AppForm2(),
          Divider(),
          AppForm3(),
          Center(
            child: Padding(
              padding:
              EdgeInsets.fromLTRB(3.89 * w, 1.95 * h, 3.89 * w, 1.95 * h),
              child: GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    if(checkValue1==false && checkValue2 == false){
                      Fluttertoast.showToast(msg: "Please choose any one product  :B form");
                    }else{
                      if(checkValue3==false && checkValue4 == false && checkValue5==false && checkValue6 == false){
                        Fluttertoast.showToast(msg: "Please select any one mode of response :B form");
                      }else{
                        if(_signatureController.isEmpty){
                          Fluttertoast.showToast(msg: "Please Sign the Signature column :B form");
                        }else {


                          String designation = getDesignation(radioValue1);
                          String desc = getDesignation(_radioValue2);
                          String gender = getDesignation(_radioValue3);
                          List<String> dose = getDoseList();
                          List<String> response = getMethodOfresponse();

                          UserData userData= UserData(
                            requestFirstName: requesterFirstController.text,
                            requestLastName: requesterLastController.text,
                            designation:designation,
                            institution: instituteController.text,
                            department: departController.text,
                            addr1: instituteAddrController1.text,
                            addr2: instituteAddrController2.text,
                            state: chosenValue,
                            city: cityController.text,
                            zip: zipController.text,
                            phonenumber: phoneController.text,
                            faxNumber: faxController.text,
                            email: emailController.text,
                            products:dose,
                            description: descController.text,
                            checkOne: desc,
                            patientName: patientController.text,
                            dob: dobController.text,
                            gender: gender,
                            dor: dorController.text,
                            methodOfResponse:response,
                            image:'image Storage reference',
                            representativeName: represNameController.text,
                            representativeType: represTypeController.text,
                            countryCode: countryCodeController.text,
                            represNumber:represTypeController.text,
                            telePhone: telePhoneController.text,

                          );

                          _registerBloc.add(RegisterUser(userData: userData));
                          _formKey.currentState!.reset();
                          Fluttertoast.showToast(msg: "User form submitted successfully");

                        }
                      }
                    }
                  }else{
                    Fluttertoast.showToast(msg: "Please fill mandatory fields");
                  }
                },
                child: Container(
                  height: 6.09 * h,
                  width: 72.01 * w,
                  decoration: BoxDecoration(
                      color: Style.inkBlueColor,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: Style.button2TextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





class AppForm1 extends StatefulWidget {
  @override
  _AppForm1State createState() => _AppForm1State();
}

class _AppForm1State extends State<AppForm1> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(
          title: 'A. Healthcare Professional Contact Information',
        ),
        HeaderWidget(
          desc: 'Requestor\'s First Name*',
        ),
        TextBoxWidget(requesterFirstController: requesterFirstController,
          validationMsg: 'Requestor\'s First Name',
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.86 * w, bottom: 1.21 * h),
          child: Text(
            'Requestor\'s Last Name*',
            style: Style.desc2TextStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.86 * w, bottom: 1.21 * h),
          child: Card(
            elevation: 1.0,
            child: Container(
              height: 5.67 * h,
              width: 87.59 * w,
              child: TextFormField(
                controller: requesterLastController,
                keyboardType: TextInputType.text,
                style: Style.input2TextStyle,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(17),
                ],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(
                      2.43 * w, 1.21 * h, 2.43 * w, 1.21 * h),
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty || value == '') {
                    return "Please enter Requestor's Last Name";
                  } else if (value.length < 3) {
                    return "Please enter a valid name";
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.86 * w, bottom: 1.21 * h),
          child: Text(
            'Designation:*',
            style: Style.desc2TextStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.86 * w, bottom: 1.21 * h),
          child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.68 * h),
                    child: Row(
                      children: [
                        Container(
                          height: 2.80 * h,
                          width: 5.55 * w,
                          child: Radio(
                            value: 0,
                            groupValue: radioValue1,
                            onChanged: (val) {
                              radioValue1 = 0;
                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          width: 4.16 * w,
                        ),
                        Text(
                          'MD',
                          style: Style.radioTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.68 * h),
                    child: Row(
                      children: [
                        Container(
                          height: 2.80 * h,
                          width: 5.55 * w,
                          child: Radio(
                            value: 1,
                            groupValue: radioValue1,
                            onChanged: (val) {
                              radioValue1 = 1;
                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          width: 4.16 * w,
                        ),
                        Text(
                          'DO',
                          style: Style.radioTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.68 * h),
                    child: Row(
                      children: [
                        Container(
                          height: 2.80 * h,
                          width: 5.55 * w,
                          child: Radio(
                            value: 2,
                            groupValue: radioValue1,
                            onChanged: (val) {
                              radioValue1 = 2;
                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          width: 4.16 * w,
                        ),
                        Text(
                          'NP',
                          style: Style.radioTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 1.68 * h),
                    child: Row(
                      children: [
                        Container(
                          height: 2.80 * h,
                          width: 5.55 * w,
                          child: Radio(
                            value: 3,
                            groupValue: radioValue1,
                            onChanged: (val) {
                              radioValue1 = 3;
                              setState(() {});
                            },
                          ),
                        ),
                        SizedBox(
                          width: 4.68 * w,
                        ),
                        Text(
                          'PA',
                          style: Style.radioTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
        Padding(
          padding:
          EdgeInsets.only(left: 4.86 * w, bottom: 1.21 * h, top: 1.21 * h),
          child: Text(
            'Institution/Office*',
            style: Style.desc2TextStyle,
          ),
        ),
        TextBoxWidget(requesterFirstController: instituteController,
          validationMsg: 'Institution/Office Name',
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.86 * w, bottom: 1.21 * h),
          child: Text(
            'Department*',
            style: Style.desc2TextStyle,
          ),
        ),
        TextBoxWidget(requesterFirstController: departController,
          validationMsg: 'Department Name',
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.86 * w, bottom: 1.21 * h),
          child: Text(
            'Institution/Office Address Line 1*',
            style: Style.desc2TextStyle,
          ),
        ),
        TextBoxWidget(requesterFirstController: instituteAddrController1,
          validationMsg: 'Institution address',
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.86 * w, bottom: 1.21 * h),
          child: Text(
            'Institution/Office Address Line 2*',
            style: Style.desc2TextStyle,
          ),
        ),
        TextBoxWidget(requesterFirstController: instituteAddrController2,
          validationMsg: 'Institution address',
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.86 * w, bottom: 1.21 * h),
          child: Text(
            'State*',
            style: Style.desc2TextStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 4.86 * w, bottom: 1.21 * h, right: 17.03 * w),
          child: DropdownButton<String>(
            focusColor: Colors.white,
            value: chosenValue,
            //elevation: 5,
            style: TextStyle(color: Colors.white),
            iconEnabledColor: Colors.black,
            items: <String>[
              'Alabama',
              'Andra Pradesh',
              'Kerala',
              'Tamil Nadu',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      1.94 * w, 0.97 * h, 1.94 * w, 0.97 * h),
                  child: Text(
                    value,
                    style: Style.dropdownTextStyle,
                  ),
                ),
              );
            }).toList(),
            hint: Padding(
              padding:
              EdgeInsets.fromLTRB(1.94 * w, 0.97 * h, 1.94 * w, 0.97 * h),
              child: Text(
                "Please select the state ",
                style: Style.dropdownTextStyle,
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                chosenValue = value!;
              });
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.86 * w, bottom: 1.21 * h),
          child: Text(
            'City*',
            style: Style.desc2TextStyle,
          ),
        ),
        TextBoxWidget(requesterFirstController: cityController,
          validationMsg: 'city name',
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.86 * w, bottom: 1.21 * h),
          child: Text(
            'Zip*',
            style: Style.desc2TextStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.86 * w, bottom: 1.21 * h),
          child: Card(
            elevation: 1.0,
            child: Container(
              height: 5.67 * h,
              width: 87.59 * w,
              child: TextFormField(
                controller: zipController,
                keyboardType: TextInputType.number,
                style: Style.input2TextStyle,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                ],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(
                      2.43 * w, 1.21 * h, 2.43 * w, 1.21 * h),
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty || value == '') {
                    return "Please enter zip code";
                  } else if (value.length < 3) {
                    return "Please enter a valid zip code";
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.86 * w, top: 1.21 * h),
          child: Text('Phone Number', style: Style.desc2TextStyle),
        ),
        TextBoxPhoneWidget(phoneController: phoneController,
          validMsg: 'Phone Number',
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.86 * w, top: 1.21 * h),
          child: Text('Fax Number', style: Style.desc2TextStyle),
        ),
        TextBoxPhoneWidget(phoneController: faxController,
          validMsg: 'Fax Number',
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.86 * w, bottom: 1.21 * h),
          child: Text(
            'Email',
            style: Style.desc2TextStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.86 * w, bottom: 1.21 * h),
          child: Card(
            elevation: 1.0,
            child: Container(
              height: 5.67 * h,
              width: 87.59 * w,
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.text,
                style: Style.input2TextStyle,
                inputFormatters: [],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(
                      2.43 * w, 1.21 * h, 2.43 * w, 1.21 * h),
                  border: InputBorder.none,
                ),
                validator: (input) => input!.isValidEmail()
                    ? null
                    : "Please enter a valid email address",
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2.43 * h,
        ),
      ],
    );
  }
}

class AppForm2 extends StatefulWidget {
  @override
  _AppForm2State createState() => _AppForm2State();
}

class _AppForm2State extends State<AppForm2> {



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(
          title: 'B. Unsolicited Information Request:',
        ),
        HeaderWidget(desc: 'Choose Products*:'),
        Row(
          children: [
            Checkbox(
                value: checkValue1,
                onChanged: (bool? value) {
                  setState(() {
                    checkValue1 = value!;
                  });
                }),
            Text(
              '10 MG - Roszet',
              style: Style.dropdownTextStyle,
            ),
            SizedBox(
              width: 2.77 * w,
            ),
            Checkbox(
                value: checkValue2,
                onChanged: (bool? value) {
                  setState(() {
                    checkValue2 = value!;
                  });
                }),
            Text(
              '20 MG - Roszet',
              style: Style.dropdownTextStyle,
            ),
          ],
        ),
        HeaderWidget(
          desc: 'Request Description:',
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.86 * w, bottom: 1.21 * h),
          child: Card(
            elevation: 1.0,
            child: Container(
              height: 16.67 * h,
              width: 87.59 * w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: TextFormField(
                  controller: descController,
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 6,
                style: Style.input2TextStyle,
                inputFormatters: [],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(
                      2.43 * w, 1.21 * h, 2.43 * w, 1.21 * h),
                  border: InputBorder.none,
                ),
                validator: (value){
                  if(value == '' || value == null){
                     return 'please enter request description';
                  }else if(value.length <6){
                    return 'please enter a valid request description';
                  }
                },
              ),
            ),
          ),
        ),
        Divider(),
        HeaderWidget(desc: 'Please Check One:'),
        Row(
          children: [
            Radio(
              value: 0,
              groupValue: _radioValue2,
              onChanged: (int? val) {
                setState(() {
                  _radioValue2 = val!;
                });
              },
            ),
            Expanded(
              child: Text(
                'This inquiry does not represent an adverse event experienced by a patient',
                style: Style.dropdownTextStyle,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: _radioValue2,
              onChanged: (int? val) {
                setState(() {
                  _radioValue2 = val!;
                });
              },
            ),
            Expanded(
              child: Text(
                'This inquiry represent an adverse event experienced by a patient',
                style: Style.dropdownTextStyle,
              ),
            ),
          ],
        ),
        HeaderWidget(desc: 'Patient Name*'),
        TextBoxWidget(
          requesterFirstController: patientController,
          validationMsg: 'Patient Name',
        ),
        HeaderWidget(desc: 'DOB*'),
        DatePicker(dateController: dobController,hintText: 'date of birth',validMsg: 'birth',),
        HeaderWidget(desc: 'Gender*'),
        Row(
          children: [
            Radio(
              value: 0,
              groupValue: _radioValue3,
              onChanged: (int? val) {
                setState(() {
                  _radioValue2 = val!;
                });
              },
            ),
            Expanded(
              child: Text(
                'Male',
                style: Style.dropdownTextStyle,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: _radioValue3,
              onChanged: (int? val) {
                setState(() {
                  _radioValue2 = val!;
                });
              },
            ),
            Expanded(
              child: Text(
                'Female',
                style: Style.dropdownTextStyle,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 3,
              groupValue: _radioValue3,
              onChanged: (int? val) {
                setState(() {
                  _radioValue2 = val!;
                });
              },
            ),
            Expanded(
              child: Text(
                'Others',
                style: Style.dropdownTextStyle,
              ),
            ),
          ],
        ),
        HeaderWidget(desc: 'Date of Request:*'),
        DatePicker(dateController: dorController,hintText: 'date of request',validMsg: 'request',),
        HeaderWidget(desc: 'Preferred Method of Response:'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                    value: checkValue3,
                    onChanged: (bool? value) {
                      setState(() {
                        checkValue3 = value!;
                      });
                    }),
                Text(
                  'Fax',
                  style: Style.dropdownTextStyle,
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: checkValue4,
                    onChanged: (bool? value) {
                      setState(() {
                        checkValue4 = value!;
                      });
                    }),
                Text(
                  'Mail',
                  style: Style.dropdownTextStyle,
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: checkValue5,
                    onChanged: (bool? value) {
                      setState(() {
                        checkValue5 = value!;
                      });
                    }),
                Text(
                  'Email',
                  style: Style.dropdownTextStyle,
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: checkValue6,
                    onChanged: (bool? value) {
                      setState(() {
                        checkValue6 = value!;
                      });
                    }),
                Text(
                  'Phone',
                  style: Style.dropdownTextStyle,
                ),

              ],
            ),
          ],
        ),
        HeaderWidget(desc: 'Health Care professional\'s Signature:*'),
        Padding(
          padding: EdgeInsets.only(left: 4.86 * w, top: 1.21 * h,right:3.86 *w),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: Colors.blueGrey
              ),
            ),
            child: Signature(
              width: 83.33*w,
              height: 28.08*h,
              controller: _signatureController,
              backgroundColor: Colors.white12,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding:
            EdgeInsets.fromLTRB(3.89 * w, 1.95 * h, 3.89 * w, 1.95 * h),
            child: GestureDetector(
              onTap: () {
                _signatureController.clear();
              },
              child: Container(
                height: 3.09 * h,
                width: 12.01 * w,
                decoration: BoxDecoration(
                    color: Style.inkBlueColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: Text(
                    'clear',
                    style: Style.button1TextStyle,
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}


class AppForm3 extends StatefulWidget {
  @override
  _AppForm3State createState() => _AppForm3State();
}

class _AppForm3State extends State<AppForm3> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            TitleWidget(
              title:
              'C. Representative Contact Information: (To BeCompleted By Representative)',
            ),
          ],
        ),
        Divider(),
        Wrap(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 5.55 * w,
                  right: 5.55 * w,
                  top: 1.40 * h,
                  bottom: 1.40 * h),
              child: Text(
                'By Submitting this form, I certify that is request for information was initiated by'
                    'Health Care Professional stated above, and was not solicited by me in any '
                    'manner.',
                style: Style.dropdownTextStyle,
              ),
            ),
          ],
        ),
        Divider(),
        HeaderWidget(desc: 'Representative Name*'),
        TextBoxWidget(
          requesterFirstController: represNameController,
          validationMsg: 'Representative Name',
        ),
        HeaderWidget(desc: 'Representative Type*'),
        TextBoxWidget(
          requesterFirstController: represTypeController,
          validationMsg: 'Representative Type',
        ),
        HeaderWidget(desc: 'Representative Territory Number*'),
        TextBoxPhoneWidget(
          phoneController: represTerritoryController,
          validMsg: 'Territory Number',
        ),
        HeaderWidget(desc: 'Country Code'),
        Padding(
          padding: EdgeInsets.only(left: 4.86 * w, top: 1.21 * h),
          child: Card(
            elevation: 1.0,
            child: Container(
              height: 5.67 * h,
              width: 87.59 * w,
              child: TextFormField(
                controller: countryCodeController,
                keyboardType: TextInputType.phone,
                style: Style.input2TextStyle,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(3),
                ],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(
                      2.43 * w, 1.21 * h, 2.43 * w, 1.21 * h),
                  border: InputBorder.none,
                  hintText: '1',
                  prefixText: '+',
                ),
                validator: (ph) {
                  if (ph == '') {
                    return "Please enter the country code";
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
        HeaderWidget(desc: 'Primary TelePhone Number'),
        TextBoxPhoneWidget(
          phoneController: telePhoneController,
          validMsg: 'Primary TelePhone Number',
        ),
      ],
    );
  }
}



getDesignation(int radioValue1){

  String designation='';

  switch (radioValue1){
    case 0:
      designation = 'MD';
      break;
    case 1:
      designation = 'MO';
      break;
    case 2:
      designation = 'NP';
      break;
    case 3:
      designation = 'PA';
      break;
  }

  return designation;
}

getDesc(int radioValue2){

  String desc='';

  switch (radioValue2){
    case 0:
      desc = 'This inquiry does not represent an adverse event experienced by a patient';
      break;
    case 1:
      desc = 'This inquiry represent an adverse event experienced by a patient';
      break;
  }

  return desc;


}

getGender(int radioValue3){

  String gender='';

  switch (radioValue3){
    case 0:
      gender = 'Male';
      break;
    case 1:
      gender = 'Female';
      break;
    case 2:
      gender = 'Other';
      break;
  }

  return gender;

}


getDoseList(){

  List<String> dose = [];

  if(checkValue1 && checkValue2){
    dose.add('10 MG - Roszet');
    dose.add('20 MG - Roszet');
  }else if(checkValue1){
    dose.add('10 MG - Roszet');
  }else if(checkValue2){
    dose.add('10 MG - Roszet');
  }

  return dose;
}


getMethodOfresponse(){

  List<String> response = [];
  List<bool> methodofResponse= [checkValue3, checkValue4, checkValue5,checkValue6];

  for(int i = 0;i<methodofResponse.length;i++){

    if(methodofResponse[0]){
      response.add('Fax');
    }else if(methodofResponse[1]){
      response.add('Mail');
    }else if(methodofResponse[2]){
      response.add('Email');
    }else if(methodofResponse[3]){
      response.add('Phone');
    }
  }
  return response;
}