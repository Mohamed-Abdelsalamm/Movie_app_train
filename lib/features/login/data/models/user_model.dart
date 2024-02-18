import 'package:sql_train/core/database_provider.dart';

class User {
   int? id;
   String? email;
   String? password;

  User({
    required this.email,
    required this.password,
  });

  User.fromMap(Map<String, dynamic> data){
    if (data[columnId] != null) id = data[columnId];
    email = data[columnUserEmail];
    password = data[columnUserPassword];
  }

   Map<String, dynamic> toMap() {
     Map <String , dynamic> data = {};
     if (id != null) data[columnId] = id;
     data[columnUserEmail] = email;
     data[columnUserPassword] = password;
     return data;
   }
}
