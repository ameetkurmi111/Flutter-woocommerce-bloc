import 'package:flutter/material.dart';
import 'package:cocoliebe/bloc/switchbloc.dart';
//import 'package:woocommerce/bloc/switchbloc.dart';

class SwitchAddress extends StatefulWidget {
  @override
  __SwitchAddressState createState() => __SwitchAddressState();
}

class __SwitchAddressState extends State<SwitchAddress> {
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
                onChanged: (e) {
                  bloc.setSwitch(e);
                },
              ),
            );
          }),
    );
  }
}
