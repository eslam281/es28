import 'package:flutter/material.dart';


class customButton extends StatelessWidget{
  final IconData iconName;
  final Function () onPressed;
  const customButton({super.key, required this.iconName, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return  IconButton(icon:
      Container(
        decoration:BoxDecoration(
          borderRadius:BorderRadius.circular(80),
          border:Border.all(color: Color(0xFFFFE700) )
        ),
        child:  Icon(iconName ,size: 50, color: const Color(0xFFFFE700)),),
      iconSize: 60, onPressed:onPressed,);
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
        Card(child: Container(width: 350,alignment: Alignment.center,
            child: Text(text,style: const TextStyle(color: Colors.teal,fontSize: 30),textAlign: TextAlign.center,))),
        const SizedBox(height: 40,)
      ],
    );
  }

}