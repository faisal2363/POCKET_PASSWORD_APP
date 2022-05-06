
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_generate_strong_random/custom.dart';

class GeneratePassword extends StatefulWidget {
  @override
  _GeneratePasswordState createState() => _GeneratePasswordState();
}

class _GeneratePasswordState extends State<GeneratePassword> {

  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      Scaffold(
  backgroundColor: Colors.brown,
  appBar: AppBar(
  automaticallyImplyLeading: false,
  backgroundColor: Colors.teal,
  title: Text('Create Simple Password'),
  ),body: Container(
  padding: EdgeInsets.all(32),
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
  Row(
  children: [
  Text("Create Simple Password",style: TextStyle(color: Colors.white,
  fontSize: 18, fontWeight: FontWeight.bold
  ),),
  ],
  ),