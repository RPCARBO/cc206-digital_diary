import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override  
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {  
  final _formKey = GlobalKey<FormState>();  
  final TextEditingController _emailController = TextEditingController();  
  final TextEditingController _passwordController = TextEditingController();  
  final String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';  
  final String passwordPattern = r'^(?=.*[A-Z])(?=.*\d).{6,}$'; // Requires 1 capital letter, 1 number, and at least 6 characters  

  void _login() {    
    if (_formKey.currentState!.validate()) {      
      Navigator.pushNamed(context, '/diaryLog');    
    }  
  }

  @override  
  Widget build(BuildContext context) {    
    return Scaffold(      
      appBar: AppBar(        
        title: const Text('Home Page'),      
      ),      
      body: Padding(        
        padding: const EdgeInsets.all(16.0),        
        child: Form(          
          key: _formKey,          
          child: Column(            
            mainAxisAlignment: MainAxisAlignment.center,            
            children: [              
              TextFormField(                
                controller: _emailController,                
                decoration: const InputDecoration(labelText: 'Email'),                
                keyboardType: TextInputType.emailAddress,                
                validator: (value) {                  
                  if (value == null || !RegExp(emailPattern).hasMatch(value)) {                    
                    return 'Enter a valid email';                  
                  }                  
                  return null;                
                },              
              ),              
              const SizedBox(height: 16.0),              
              TextFormField(                
                controller: _passwordController,                
                decoration: const InputDecoration(labelText: 'Password'),                
                obscureText: true,                
                validator: (value) {                  
                  if (value == null || !RegExp(passwordPattern).hasMatch(value)) {                    
                    return 'Password must contain a total of 6 characters, 1 capital letter ,and 1 number';                  
                  }                  
                  return null;                
                },              
              ),              
              const SizedBox(height: 32.0),              
              ElevatedButton(                
                onPressed: _login,                
                child: const Text('Log In'),              
              ),            
            ],          
          ),        
        ),      
      ),    
    );  
  }
}
