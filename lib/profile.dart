import 'package:flutter/material.dart';


class ProfileApp extends StatelessWidget {
  const ProfileApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    Image(image: NetworkImage("https://images.unsplash.com/photo-1639949691772-1d8c2fb3a09b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80")
    )
    
    );
        
       
  }
}