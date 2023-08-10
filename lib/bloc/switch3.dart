import 'package:flutter/material.dart';
import 'package:cocoliebe/bloc/switchbloc.dart';
//import 'package:woocommerce/bloc/switchbloc.dart';

class Switch3 extends StatefulWidget {
  @override
  __Switch3State createState() => __Switch3State();
}

class __Switch3State extends State<Switch3> {
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
                onChanged: (c) {
                  bloc.setSwitch(c);
                },
              ),
            );
          }),
    );
  }
}
