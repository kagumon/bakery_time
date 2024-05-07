import 'package:bakery_time/util/UtilWidgets.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  String _explanText = "이름을 입력해주세요.";
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _jumin1TextController = TextEditingController();
  final TextEditingController _jumin2TextController = TextEditingController();
  final TextEditingController _hpnoTextController = TextEditingController();
  final FocusNode _jumin2FocusNode = FocusNode();
  final List<String> _mvnmArray = [
    "SKT",
    "KT",
    "LGU+",
    "알뜰SKT",
    "알뜰KT",
    "알뜰LGU+"
  ];
  String _mvnmValue = "SKT";
  bool _visiableJumin = false;
  bool _visiableHpno = false;
  bool _visiableMvnm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            emptyExpanded(),
            Icon(
              Icons.looks_one,
              color: signupStepIconActiveColor,
            ),
            Icon(
              Icons.looks_two,
              color: signupStepIconActiveColor,
            ),
            Icon(
              Icons.looks_3,
              color: signupStepIconDisableColor,
            ),
            Icon(
              Icons.looks_4,
              color: signupStepIconDisableColor,
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_explanText, style: explanTextStyle()),
            heightSizeBox(40),
            /*********************************/
            /* 전화번호 입력                 */
            /*********************************/
            Visibility(
                visible: _visiableHpno,
                child: Column(
                  children: [
                    TextField(
                      maxLength: 11,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      style: const TextStyle(fontSize: 18),
                      decoration: textInputStyle(hint: "전화번호"),
                      controller: _hpnoTextController,
                      onSubmitted: (_) => {
                        setState(() {
                          FocusScope.of(context).unfocus();
                          _explanText = "본인인증을 진행해주세요.";
                        })
                      },
                    ),
                    heightSizeBox(20),
                  ],
                )),
            /*********************************/
            /* 통신사 입력                   */
            /*********************************/
            Visibility(
                visible: _visiableMvnm,
                child: Column(
                  children: [
                    DropdownButton(
                        underline: Container(
                          height: 1,
                          color: signupDropdownButtonBorderColor,
                        ),
                        isExpanded: true,
                        value: _mvnmValue,
                        items: _mvnmArray.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(value),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) => {
                              setState(() {
                                _visiableHpno = true;
                                _explanText = "전화번호를 입력해주세요.";
                                _mvnmValue = value!;
                              })
                            }),
                    heightSizeBox(20),
                  ],
                )),
            /*********************************/
            /* 주민번호 입력                 */
            /*********************************/
            Visibility(
                visible: _visiableJumin,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: const TextStyle(fontSize: 18),
                            decoration: textInputStyle(hint: "생년월일"),
                            maxLength: 6,
                            controller: _jumin1TextController,
                            onChanged: (value) => {
                              if (value.length == 6)
                                {
                                  FocusScope.of(context)
                                      .requestFocus(_jumin2FocusNode)
                                }
                            },
                          ),
                        ),
                        const Text(
                          "  -  ",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 38,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: const TextStyle(fontSize: 18),
                            decoration: textInputStyle(hint: ""),
                            maxLength: 1,
                            focusNode: _jumin2FocusNode,
                            controller: _jumin2TextController,
                            onChanged: (value) => {
                              if (value.length == 1)
                                {
                                  setState(() {
                                    _visiableMvnm = true;
                                    _explanText = "통신사를 선택해주세요.";
                                  })
                                }
                            },
                          ),
                        ),
                        widthSizeBox(3),
                        for (int i = 0; i < 6; i++)
                          circleContainer(r: 18, right: 3),
                      ],
                    ),
                    heightSizeBox(20),
                  ],
                )),
            /*********************************/
            /* 이름 입력                     */
            /*********************************/
            TextField(
              maxLength: 30,
              style: const TextStyle(fontSize: 18),
              decoration: textInputStyle(hint: "이름"),
              autofocus: true,
              controller: _nameTextController,
              onSubmitted: (_) => {
                setState(() {
                  _visiableJumin = true;
                  _explanText = "주민번호를 입력해주세요.";
                })
              },
            ),
            emptyExpanded(),
            GestureDetector(
              onTap: () => {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/success", (route) => false)
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                width: double.infinity,
                height: 50,
                decoration: nextButtonStyle(allInput()),
                child: const Center(
                    child: Text(
                  "인증하기",
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool allInput() {
    if (_nameTextController.text.isNotEmpty &&
        _jumin1TextController.text.isNotEmpty &&
        _jumin2TextController.text.isNotEmpty &&
        _hpnoTextController.text.isNotEmpty &&
        _mvnmValue != "") {
      return true;
    } else {
      return false;
    }
  }
}

InputDecoration textInputStyle({required String hint}) {
  return InputDecoration(
    counterText: '',
    hintText: hint,
    contentPadding: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: signupTextInputBorderColor),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: signupTextInputBorderColor),
    ),
  );
}

BoxDecoration nextButtonStyle(bool status) {
  return BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    color: status ? signupNextButtonTouchableColor : signupNextButtonUntouchableColor,
  );
}

TextStyle explanTextStyle() {
  return TextStyle(
    color: signupExplanTextColor,
    fontSize: 24,
  );
}
