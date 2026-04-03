

import 'package:flutter/material.dart';
import 'package:flutter_application_1/gets.dart';
import 'package:flutter_application_1/models.dart';
import 'package:flutter_application_1/service.dart';

class Ui extends StatefulWidget {
 
   Ui({super.key,});

  @override
  State<Ui> createState() => _UiState();
}

class _UiState extends State<Ui> {
 ApiPost apiPost=ApiPost();
 

  final Emailcontroller =TextEditingController();

  final PasswordController=TextEditingController();

   void sumit()async{
       
  
    final posts=Postmodel(email: Emailcontroller.text, password: PasswordController.text);
    final tokens=await apiPost.createpost(posts);
    
    

  if (tokens != null) {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Gets(token: tokens),  
      ),
    );

  }
      
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Center(
          child: Container(
            height:  200,
            width: 200,
        child:  Column(
          children: [
            TextField(controller: Emailcontroller,decoration: InputDecoration(
              hintText: "email",
              border: OutlineInputBorder(),
            
            ),),
              SizedBox(height: 10,),

                  TextField(controller: PasswordController,decoration: InputDecoration(
              hintText: "password",
              border: OutlineInputBorder(),
            
            ),),ElevatedButton(onPressed: ()async{
               sumit();
          
            }, child: Text("click"))
          ],
        ),
        
      
          ),
        ),
      ),
    );
  }
}