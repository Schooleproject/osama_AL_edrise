import 'package:flutter/material.dart';

void main() {
  runApp(osama());
}

class osama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Validation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor:
        Colors.blue[50],
      ),
      home: ValidationPage(),
    );
  }
}

class ValidationPage extends StatefulWidget {
  @override
  _ValidationPageState createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController osama_username = TextEditingController();
  final TextEditingController osama_password = TextEditingController();
  final TextEditingController osama_email = TextEditingController();

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      // إذا كانت المدخلات صحيحة
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('كل المدخلات صحيحة!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحة التحقق'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize:
                  MainAxisSize.min,
                  children: <Widget>[
                    TextFormField(
                      controller: osama_username,
                      decoration: InputDecoration(
                        labelText: 'اسم المستخدم',
                        labelStyle: TextStyle(color: Colors.blue), // لون النص
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال اسم المستخدم';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: osama_password,
                      decoration: InputDecoration(
                        labelText: 'كلمة المرور',
                        labelStyle: TextStyle(color: Colors.blue), // لون النص
                      ),
                      obscureText: true, // إخفاء النص عند الإدخال
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال كلمة المرور';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: osama_email,
                      decoration: InputDecoration(
                        labelText: 'البريد الإلكتروني',
                        labelStyle: TextStyle(color: Colors.blue), // لون النص
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'يرجى إدخال البريد الإلكتروني';
                        }
                        // تحقق بسيط من صحة البريد الإلكتروني
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'يرجى إدخال بريد إلكتروني صحيح';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _validateInputs,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // لون زر التحقق
                      ),
                      child: Text('دخول'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
