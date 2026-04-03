class Postmodel{

  final String email;
  final String password;
  Postmodel({required this.email,required this.password});


  Map<String,dynamic>toJson(){

    return{
      "email":email,
      "password":password,
    };
  }

}