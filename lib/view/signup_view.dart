import 'package:bakery_time/provider/signup_provider.dart';
import 'package:bakery_time/util/util_widget.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignupProvider>(
      create: (BuildContext context) => SignupProvider(),
      child: Scaffold(
        appBar: AppBar(),
        body: Consumer<SignupProvider>(builder: (context, provider, child) {
          return SafeArea(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(provider.explanText,
                      style: TextStyle(
                        color: textBlackColor,
                        fontSize: 24,
                      )),
                  heightSizeBox(40),
                  /*********************************/
                  /* 전화번호 입력                 */
                  /*********************************/
                  Visibility(
                      visible: provider.visiableHpno,
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
                            controller: provider.hpnoTextController,
                            onSubmitted: (_) {
                              if (!provider.checkPhoneNumber()) {
                                return;
                              } else {
                                provider.allInputCheck();
                              }
                            },
                          ),
                          heightSizeBox(40),
                        ],
                      )),
                  /*********************************/
                  /* 인증번호 입력                 */
                  /*********************************/
                  Visibility(
                      visible: provider.visiableVerify,
                      child: Column(
                        children: [
                          TextField(
                            maxLength: 6,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: const TextStyle(fontSize: 18),
                            decoration: textInputStyle(hint: "전화번호"),
                            controller: provider.verifyTextController,
                            onSubmitted: (_) {},
                          ),
                          heightSizeBox(40),
                        ],
                      )),
                  /*********************************/
                  /* 주민번호 입력                 */
                  /*********************************/
                  Visibility(
                      visible: provider.visiableJumin,
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
                                  controller: provider.jumin1TextController,
                                  onChanged: (value) => {
                                    if (value.length == 6)
                                      {
                                        FocusScope.of(context).requestFocus(
                                            provider.jumin2FocusNode)
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
                                  focusNode: provider.jumin2FocusNode,
                                  controller: provider.jumin2TextController,
                                  onChanged: (value) {
                                    provider.allInputCheck();
                                    provider.showHpnoInput();
                                  },
                                ),
                              ),
                              widthSizeBox(3),
                              for (int i = 0; i < 6; i++)
                                circleContainer(r: 18, right: 3),
                            ],
                          ),
                          heightSizeBox(40),
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
                    controller: provider.nameTextController,
                    onSubmitted: (_) {
                      provider.allInputCheck();
                      provider.showJuminnoInput();
                    },
                  ),
                  emptyExpanded(),
                  GestureDetector(
                    onTap: () {
                      if (!provider.allinput) {
                        return;
                      }

                      if (provider.visiableVerify) {
                        provider.checkVrifyNumber();
                      } else {
                        provider.sendVrifyNumber();
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        color: provider.allinput
                            ? buttonActiveColor
                            : buttonDisableColor,
                      ),
                      child: Center(
                          child: Text(
                        provider.visiableVerify ? "인증하기" : "인증번호 발송",
                        style: const TextStyle(color: Color(0xFFFFFFFF)),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

InputDecoration textInputStyle({required String hint}) {
  return InputDecoration(
    counterText: '',
    hintText: hint,
    contentPadding: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
    ),
  );
}
