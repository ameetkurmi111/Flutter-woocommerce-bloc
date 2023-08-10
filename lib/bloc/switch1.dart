import 'package:flutter/material.dart';
import 'package:cocoliebe/bloc/switchbloc.dart';
//import 'package:woocommerce/bloc/switchbloc.dart';
import 'package:rxdart/rxdart.dart';

class Switch1 extends StatefulWidget {
  @override
  __SwitchState createState() => __SwitchState();
}

class __SwitchState extends State<Switch1> {
  SwitchBloc bloc = SwitchBloc();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: bloc.getSwitch,
          builder: (context, snapshot) {
            return Switch(
              value: snapshot.data ?? false,
              activeColor: Color(0xFF902326),
              onChanged: (b) {
                bloc.setSwitch(b);
              },
            );
          }),
    );
  }
}
