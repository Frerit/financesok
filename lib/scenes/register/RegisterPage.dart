import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:financesok/model/User.dart';
import 'package:financesok/styles/theme_login.dart' as ThemeLog;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {

  User _currentUser = null;

  RegisterPage(this._currentUser);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with SingleTickerProviderStateMixin {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FocusNode myFocusNodePhone = FocusNode();
  final FocusNode myFocusNodePhoneConfirm = FocusNode();
  TextEditingController signupPhoneController = new TextEditingController();
  TextEditingController signupConfirmPhoneController = new TextEditingController();

  Country _selectedDialogCountry = CountryPickerUtils.getCountryByPhoneCode('57');

  final List<FocusNode> _listFocusNode = <FocusNode>[];
  final List<TextEditingController> _listControllerText = <TextEditingController>[];
  List<String> _code = List();
  int _currentIdex = 0;

  int itemSize = 50;

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: ThemeLog.Colors.loginGradientStart,
      duration: Duration(seconds: 3),
    ));


  }

  void _registerAttempNumberPhone() {
    print( widget._currentUser);
  }

  List<Widget> _buildListWidget() {
    List<Widget> listWidget = List();
    for (int index = 0; index < 4; index++) {
      double left = (index == 0) ? 0.0 : ( itemSize / 10);
      listWidget.add(Container(
          height: 20,
          width: 30,
          margin: EdgeInsets.only(left: left),
          child: _buildInputItem(index)));
    }
    return listWidget;
  }

  void _next(int index) {
    if (index != 4) {
      setState(() {
        _currentIdex = index + 1;
      });
      FocusScope.of(context).requestFocus(_listFocusNode[index + 1]);
    }
  }

  void _prev(int index) {
    if (index > 0) {
      setState(() {
        if (_listControllerText[index].text.isEmpty) {
          _listControllerText[index - 1].text = ' ';
        }
        _currentIdex = index - 1;
      });
      FocusScope.of(context).requestFocus(_listFocusNode[index - 1]);
    }
  }

  @override
  void initState() {
    if (_listFocusNode.isEmpty) {
      for (var i = 0; i < 4; i++) {
        _listFocusNode.add(new FocusNode());
        _listControllerText.add(new TextEditingController());
        _code.add(' ');
      }
    }
    super.initState();
  }

  void _openCountryPickerDialog() => showDialog(
    context: context,
    builder: (context) => Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.pink),
        child: CountryPickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: Text('Select your phone code'),
            onValuePicked: (Country country) =>
                setState(() => _selectedDialogCountry = country),
            itemBuilder: _buildDialogItem)),
  );

  Widget _buildDialogItem(Country country) => Row(
    children: <Widget>[
      CountryPickerUtils.getDefaultFlagImage(country),
      SizedBox(width: 8.0),
      Text("+${country.phoneCode}"),
      SizedBox(width: 8.0),
      Flexible(child: Text(country.name))
    ],
  );

  Widget _buildInputItem(int index) {
    bool border = true;
    return TextField(
      keyboardType: TextInputType.number,
      maxLines: 1,
      maxLength: 2,
      focusNode: _listFocusNode[index],
      decoration: InputDecoration(
          border: (border ? null : InputBorder.none),
          enabled: _currentIdex == index,
          counterText: "",
          contentPadding: EdgeInsets.all(((30 * 2) / 10)),
          errorMaxLines: 1,
          fillColor: Colors.black),
      onChanged: (String value) {
        if (value.length > 1 && index < 4 ||
            index == 0 && value.isNotEmpty) {
          if (index == 4 - 1) {
           setState(() {
             print(value);
           });
            return;
          }
          if (_listControllerText[index + 1].value.text.isEmpty) {
            _listControllerText[index + 1].value =
            new TextEditingValue(text: " ");
          }
          if (value.length == 2) {
            if (value[0] != _code[index]) {
              _code[index] = value[0];
            } else if (value[1] != _code[index]) {
              _code[index] = value[1];
            }
            if (value[0] == " ") {
              _code[index] = value[1];
            }
            _listControllerText[index].text = _code[index];
          }
          _next(index);

          return;
        }
        if (value.isEmpty && index >= 0) {
          if (_listControllerText[index - 1].value.text.isEmpty) {
            _listControllerText[index - 1].value =
            new TextEditingValue(text: " ");
          }
          _prev(index);
        }
      },
      controller: _listControllerText[index],
      maxLengthEnforced: true,
      autocorrect: false,
      textAlign: TextAlign.center,
      autofocus: true,
      style: TextStyle(
          fontFamily: "WorkSansSemiBold",
          fontSize: 16.0,
          color: Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeLog.Colors.loginGradientStart,
      appBar: AppBar(
        title: Text("Registro"),
        backgroundColor: Colors.transparent,
      ),
      key: _scaffoldKey,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (over) {
          over.disallowGlow();
      },
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height >= 775.0
                ? MediaQuery.of(context).size.height
                : 775.0,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    ThemeLog.Colors.loginGradientStart,
                    ThemeLog.Colors.loginGradientEnd
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 105.0),
                    child: Icon(
                      FontAwesomeIcons.phone,
                      size: 50,
                      color: Colors.white,
                    )
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Text(
                        "Ingresa tu numero celular",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),
                      )
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.topCenter,
                          overflow: Overflow.visible,
                          children: <Widget>[
                            Card(
                              elevation: 2.0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                width: 300.0,
                                height: 330.0,
                                child: Column(
                                  children: <Widget>[ ////// Validacion de Usuario
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 20.0, bottom: 20.0, left: 5.0, right: 25.0),
                                      child: ListTile(
                                        onTap: _openCountryPickerDialog,
                                        title: _buildDialogItem(_selectedDialogCountry),
                                      ),
                                    ),
                                    Container(
                                      width: 250.0,
                                      height: 1.0,
                                      color: Colors.grey[400],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                                      child: TextField(
                                        focusNode: myFocusNodePhone,
                                        controller: signupPhoneController,
                                        keyboardType: TextInputType.phone,
                                        style: TextStyle(
                                            fontFamily: "WorkSansSemiBold",
                                            fontSize: 16.0,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          icon: Icon(
                                            FontAwesomeIcons.envelope,
                                            color: Colors.black,
                                            size: 22.0,
                                          ),
                                          hintText: "Numero Celular",
                                          hintStyle: TextStyle(
                                              fontFamily: "WorkSansSemiBold", fontSize: 17.0),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 250.0,
                                      height: 1.0,
                                      color: Colors.grey[400],
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 20.0, bottom: 5.0, left: 25.0, right: 25.0),
                                      child: Row(
                                          children: <Widget>[
                                            Icon(
                                                FontAwesomeIcons.bell
                                            ),
                                            SizedBox(width: 12.0),
                                            Text("Codigo de Confirmacion",
                                              style: TextStyle(
                                                  fontFamily: "WorkSansSemiBold",
                                                  fontSize: 17.0
                                              ),
                                            ),
                                          ]
                                      )
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 20.0, bottom: 20.0, left: 20.0, right: 25.0),
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: _buildListWidget(),
                                        )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 300.0),
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: ThemeLog.Colors.loginGradientStart,
                                    offset: Offset(1.0, 6.0),
                                    blurRadius: 20.0,
                                  ),
                                  BoxShadow(
                                    color: ThemeLog.Colors.loginGradientEnd,
                                    offset: Offset(1.0, 6.0),
                                    blurRadius: 20.0,
                                  ),
                                ],
                                gradient: new LinearGradient(
                                    colors: [
                                      ThemeLog.Colors.loginGradientEnd,
                                      ThemeLog.Colors.loginGradientStart
                                    ],
                                    begin: const FractionalOffset(0.2, 0.2),
                                    end: const FractionalOffset(1.0, 1.0),
                                    stops: [0.0, 1.0],
                                    tileMode: TileMode.clamp),
                              ),
                              child: MaterialButton(
                                  highlightColor: Colors.transparent,
                                  splashColor: ThemeLog.Colors.loginGradientEnd,
                                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 42.0),
                                    child: Text(
                                      "CONTINUAR",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontFamily: "WorkSansBold"),
                                    ),
                                  ),
                                  onPressed: () =>
                                      _registerAttempNumberPhone()
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }



}

