import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicare/Themes/size_config.dart';
import 'package:medicare/Themes/style.dart';


double h = SizeConfig.heightMultiplier;
double w = SizeConfig.widthMultiplier;

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding:  EdgeInsets.only(top: 2.43*h, bottom: 3.41*h,left:5.55*w),
          child: Text(
            '$title',
            style: Style.subHeaderTextStyle,
          ),
        ));
  }
}


class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,required this.desc
  }) : super(key: key);

  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.86*w, bottom: 1.21*h),
      child: Text(
        '$desc',
        style: Style.desc2TextStyle,
      ),
    );
  }
}


class TextBoxWidget extends StatelessWidget {
  const TextBoxWidget({
    Key? key,
    required this.requesterFirstController,
    required this.validationMsg
  }) : super(key: key);

  final TextEditingController requesterFirstController;
  final String validationMsg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 4.86*w, bottom: 1.21*h),
      child: Card(
        elevation: 1.0,
        child: Container(
          height: 5.67*h,
          width: 87.59*w,
          child: TextFormField(
            controller: requesterFirstController,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.text,
            style: Style.input2TextStyle,
            inputFormatters: [
              LengthLimitingTextInputFormatter(17),
            ],
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(2.43*w,1.21*h,2.43*w,1.21*h),
              border: InputBorder.none,
            ),
            validator: (value) {
              if (value!.isEmpty || value == '') {
                return "Please enter $validationMsg";
              }else if(value.length < 3){
                return "Please enter a valid  $validationMsg";
              }
              return null;
            },

          ),
        ),
      ),
    );
  }
}

class TextBoxPhoneWidget extends StatelessWidget {
  const TextBoxPhoneWidget({
    Key? key,
    required this.phoneController,
    required this.validMsg
  }) : super(key: key);

  final TextEditingController phoneController;
  final String validMsg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:4.86*w, top: 1.21*h),
      child: Card(
        elevation: 1.0,
        child: Container(
          height: 5.67*h,
          width: 87.59*w,
          child: TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            style: Style.input2TextStyle,
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
            ],
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(2.43*w,1.21*h,2.43*w,1.21*h),
              border: InputBorder.none,
            ),
            validator: (ph) {
              if(ph ==''){
                return "Please enter the $validMsg";
              }else if (ph!.length != 10) {
                return "Please enter a valid $validMsg";
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}

class DatePicker extends StatefulWidget {

  final  TextEditingController dateController ;
  final String hintText;
  final String validMsg;

  const DatePicker({Key? key, required this.dateController,required this.hintText,required this.validMsg}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {


  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.only(left: 4.86 * w, bottom: 1.21 * h),
      child: Card(
        elevation: 1.0,
        child: Container(
          height: 5.67 * h,
          width: 87.59 * w,
          child: TextFormField(
            controller: widget.dateController,
            style: Style.input2TextStyle,
            readOnly: true,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(
                    2.43 * w, 1.21 * h, 2.43 * w, 1.21 * h),
                border: InputBorder.none,
                hintText:widget.hintText,
                hintStyle: Style.purpleHintTextStyle
            ),
            onTap: ()async{
              var date = await showDatePicker(
                  context: context,
                  initialDate:DateTime.now(),
                  firstDate:DateTime(1900),
                  lastDate: DateTime(2100));
              widget.dateController.text = date.toString().substring(0,10);
            },
            validator: (value){
              if(value ==''||value ==null){
                return 'please select the date of ${widget.validMsg}';
              }
            },
          ),
        ),
      ),
    );
  }
}


