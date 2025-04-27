import 'package:flutter/material.dart';

import '../../core/constant/color.dart';


class customButton extends StatelessWidget{
  final Function () onPressed;
  const customButton({super.key, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,width: 150,
      decoration:BoxDecoration(
        color: AppColor.secondColor,
        borderRadius:BorderRadius.circular(100),
      ),
      child:  MaterialButton(
      onPressed:onPressed,),);
  }
}

class customTextform extends StatelessWidget {
  final String Texthint ;
  final TextEditingController Textcontroll;
  final String? Function(String? val)? validator;
  const customTextform({super.key, required this.Texthint, required this.Textcontroll, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:Textcontroll ,validator:validator ,
      decoration: InputDecoration(filled: true,fillColor: Colors.grey[200],contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal: 15),
          border:OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide:const BorderSide(color: Colors.grey) ),hintText: Texthint,
          hintStyle:const TextStyle(fontSize: 14,color: Colors.grey) ),);
  }
}

class customCard extends StatelessWidget{
  final String text;
  const customCard({super.key,required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            color: AppColor.primaryColor,
            child: Container(width: 350,alignment: Alignment.center,
            child: Text(text,style: const TextStyle(color:Colors.white,fontSize: 30),textAlign: TextAlign.center,))),
        const SizedBox(height: 40,)
      ],
    );
  }

}