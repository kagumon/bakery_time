import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  int _currentStep = 1;
  String _explanText = "이름을 입력해주세요.";
  final TextEditingController _idTextController      = TextEditingController();
  final TextEditingController _pwTextController      = TextEditingController();
  final TextEditingController _pwCheckTextController = TextEditingController();
  final TextEditingController _hpnoTextController    = TextEditingController();
  final TextEditingController _nameTextController    = TextEditingController();
  final FocusNode _idTextFocusNode      = FocusNode();
  final FocusNode _pwTextFocusNode      = FocusNode();
  final FocusNode _pwCheckTextFocusNode = FocusNode();
  final FocusNode _hpnoTextFocusNode    = FocusNode();
  final FocusNode _nameTextFocusNode    = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("회원가입"),),
      body: Container(
        padding: const EdgeInsets.only(left: 50, right: 50),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_explanText, style: explanTextStyle()),
            Visibility(
              visible: _currentStep >= 1,
              child: TextField(
                autofocus: true,
                focusNode: _nameTextFocusNode,
                controller: _nameTextController,
                decoration: textInputStyle(Icons.people),
                onSubmitted: (value) => {setState(() => (nextInputStep(context, _idTextFocusNode)))},
              )
            ),
            const SizedBox(height: 5,),
            Visibility(
              visible: _currentStep >= 2,
              child: TextField(
                controller: _idTextController,
                focusNode: _idTextFocusNode,
                decoration: textInputStyle(Icons.people),
                onSubmitted: (value) => {setState(() => (nextInputStep(context, _pwTextFocusNode)))},
              )
            ),
            const SizedBox(height: 5,),
            Visibility(
              visible: _currentStep >= 3,
              child: TextField(
                controller: _pwTextController,
                focusNode: _pwTextFocusNode,
                decoration: textInputStyle(Icons.people),
                onSubmitted: (value) => {setState(() => (nextInputStep(context, _pwCheckTextFocusNode)))},
              )
            ),
            const SizedBox(height: 5,),
            Visibility(
              visible: _currentStep >= 4,
              child: TextField(
                controller: _pwCheckTextController,
                focusNode: _pwCheckTextFocusNode,
                decoration: textInputStyle(Icons.people),
                onSubmitted: (value) => {setState(() => (nextInputStep(context, null)))},
              )
            ),
            const Expanded(child: SizedBox.shrink()),
            GestureDetector(
              onTap: ()=>{
                Navigator.of(context).pushNamedAndRemoveUntil("/success", (route) => false)
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                width: double.infinity,
                height: 50,
                decoration: _currentStep <5 ? utabVerifyButtonStyle() : tabVerifyButtonStyle(),
                child: const Center(child: Text("인증하기")),
              ),
            ),
            const SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }

  void nextInputStep(context, focusNode) {
    if(focusNode==null) {
      FocusScope.of(context).unfocus();
    } else {
      FocusScope.of(context).requestFocus(focusNode);
    }
    if(_currentStep==1) {_explanText="아이디를 입력해주세요.";}
    else if(_currentStep==2) {_explanText="비밀번호를 입력해주세요.";}
    else if(_currentStep==3) {_explanText="비밀번호를 한 번 더 입력해주세요.";}
    else if(_currentStep==4) {_explanText="알맞게 입력하셨다면 인증하기 버튼을 눌러주세요.";}
    else {return;}
    _currentStep+=1;
    return;
  }
}

InputDecoration textInputStyle(IconData icon) {
  return InputDecoration(
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    fillColor:  Color.fromARGB(255, 255, 255, 255),
    filled: true,
    prefixIcon: Icon(icon),
  );
}

BoxDecoration tabVerifyButtonStyle() {
  return const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    color: Color.fromRGBO(201, 114, 92, 1),
  );
}

BoxDecoration utabVerifyButtonStyle() {
  return const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    color: Color.fromRGBO(210, 203, 201, 1),
  );
}

TextStyle explanTextStyle() {
  return const TextStyle(
    color: Color.fromRGBO(158, 78, 28, 1),
    fontSize: 24,
  );
}