import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
class SelectLanguage extends StatefulWidget {
  String r;
  SelectLanguage(this.r);
  @override
  _SelectLanguageState createState() => _SelectLanguageState(this.r);
}

class _SelectLanguageState extends State<SelectLanguage> {
    String r;
  _SelectLanguageState(this.r);
  Color selectedColor = Colors.yellow;
  dynamic newValue;
 
  int _radioValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(r=="English"){
      _radioValue=0;
    }
    else if(r=="German"){
      _radioValue=1;
    }
  }

  void _handleRadioValueChange(int value) {

    setState(() {
      _radioValue = value;
    });

    if(_radioValue==0){
      Navigator.pop(context,"English");
    } else if(_radioValue==1){
       Navigator.pop(context,"German");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            if(_radioValue==0){
               Navigator.pop(context,"English");
            }else if(_radioValue==1){
              Navigator.pop(context,"German");
            }
           
          },
        ),
        title: Text(
          "Select Language",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 58,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {
                 setState(() {
                   _radioValue=0;
                 });
                  Navigator.pop(context,"English");
                },
                child: Center(
                  child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 5),
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: 
                            CircleAvatar(
                                radius: 18.0,
                                 backgroundColor: Colors.black,
                                child: CircleAvatar(
                                    radius: 16.5,
                                  backgroundColor: Colors.white,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.0),
                                    child: Container(
                                      child: Flag(
                                        'gb', 
                                       height: 27.5, 
                                        width: 27.5,
                                        fit: BoxFit.fill,
                                        )))),
                            ),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "English",
                        style: TextStyle(
                           fontSize: 14,
                      
                            color: Colors.black,
                        
                        ),
                      ),
                      Expanded(
                          child: SizedBox(
                          width: 70,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Radio(
                          groupValue: _radioValue,
                          value: 0,
                          onChanged: _handleRadioValueChange
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.5,
            ),
            Container(
              height: 58,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    _radioValue=1;
                  });
                   Navigator.pop(context,"German");
                },
                child: Center(
                  child: Row(
                    children: [
                     Container(
                          padding: EdgeInsets.only(left: 5),
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: 
                            CircleAvatar(
                                radius: 18.0,
                                 backgroundColor: Colors.black,
                                child: CircleAvatar(
                                radius: 16.5,
                                  backgroundColor: Colors.white,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.0),
                                    child: Container(
                                     
                                      child: Flag(
                                        'de', 
                                        height: 27.5, 
                                        width: 27.5,
                                        fit: BoxFit.fill,
                                        )))),
                            ),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "German",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                          child: SizedBox(
                          width: 70,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Radio(
                          
                          groupValue: _radioValue,
                          value: 1,
                          onChanged: _handleRadioValueChange
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
