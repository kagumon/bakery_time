import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  int _currentStep = 1;
  String _explanText = "이름을 입력해주세요.";
  final _idTextController = TextEditingController();
  final _pwTextController = TextEditingController();
  final _pwCheckTextController = TextEditingController();
  final _hpnoTextController = TextEditingController();
  final _nameTextController = TextEditingController();

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
                controller: _nameTextController,
                decoration: textInputStyle(Icons.people),
                onSubmitted: (value) => {setState(() => (nextInputStep()))},
              )
            ),
            Visibility(
              visible: _currentStep >= 2,
              child: TextField(
                controller: _idTextController,
                decoration: textInputStyle(Icons.people),
                onSubmitted: (value) => {setState(() => (nextInputStep()))},
              )
            ),
            Visibility(
              visible: _currentStep >= 3,
              child: TextField(
                controller: _pwTextController,
                decoration: textInputStyle(Icons.people),
                onSubmitted: (value) => {setState(() => (nextInputStep()))},
              )
            ),
            Visibility(
              visible: _currentStep >= 4,
              child: TextField(
                controller: _pwCheckTextController,
                decoration: textInputStyle(Icons.people),
                onSubmitted: (value) => {setState(() => (nextInputStep()))},
              )
            ),
            const Expanded(child: SizedBox.shrink()),
            GestureDetector(
              onTap: ()=>{print("login")},
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                width: double.infinity,
                height: 50,
                decoration: verifyButtonStyle(),
                child: const Center(child: Text("인증하기")),
              ),
            ),
            const SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }

  void nextInputStep() {
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

BoxDecoration verifyButtonStyle() {
  return const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    color: Color.fromRGBO(165, 161, 160, 1),
  );
}

TextStyle explanTextStyle() {
  return const TextStyle(
    color: Color.fromRGBO(158, 78, 28, 1),
    fontSize: 24,
  );
}