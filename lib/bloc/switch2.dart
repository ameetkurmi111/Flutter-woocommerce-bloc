import 'package:flutter/material.dart';
import 'package:cocoliebe/bloc/switchbloc.dart';
//import 'package:woocommerce/bloc/switchbloc.dart';

class Switch2 extends StatefulWidget {
  @override
  __SwitchState createState() => __SwitchState();
}

class __SwitchState extends State<Switch2> {
  SwitchBloc bloc = SwitchBloc();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: bloc.getSwitch,
          builder: (context, snapshot) {
            return Container(
              child: Switch(
                value: snapshot.data ?? false,
                activeColor: Color(0xFF902326),
                onChanged: (b) {
                  bloc.setSwitch(b);
                },
              ),
            );
          }),
    );
  }
}
