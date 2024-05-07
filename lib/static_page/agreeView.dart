import 'package:bakery_time/util/UtilWidgets.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/material.dart';

class AgreeView extends StatefulWidget {
  const AgreeView({super.key});

  @override
  State<AgreeView> createState() => _AgreeViewState();
}

class _AgreeViewState extends State<AgreeView> {
  bool _agree1 = false;
  bool _agree2 = false;
  bool _agree3 = false;

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
              color: signupStepIconDisableColor,
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
            emptyExpanded(),
            const Text(
              "베이커리 타임",
              style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF4B2615),
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "서비스 이용에 동의해주세요.",
              style: TextStyle(fontSize: 20),
            ),
            heightSizeBox(70),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Color(0xFFFAF5EB),
              ),
              child: ListTile(
                leading: GestureDetector(
                  child: Icon(
                    Icons.verified,
                    color: allCheck() ? agreeCheckButtonActiveColor : themeGrey,
                    size: 25,
                  ),
                  onTap: () => {
                    setState(() {
                      if (!allCheck()) {
                        _agree1 = true;
                        _agree2 = true;
                        _agree3 = true;
                      } else {
                        _agree1 = false;
                        _agree2 = false;
                        _agree3 = false;
                      }
                    })
                  },
                ),
                title: const Text('필수 약관 모두 동의'),
                onTap: () {
                  setState(() {
                    if (!allCheck()) {
                      _agree1 = true;
                      _agree2 = true;
                      _agree3 = true;
                    } else {
                      _agree1 = false;
                      _agree2 = false;
                      _agree3 = false;
                    }
                  });
                },
              ),
            ),
            heightSizeBox(10),
            ListTile(
              leading: GestureDetector(
                child: Icon(
                  Icons.verified,
                  color: _agree1 ? agreeCheckButtonActiveColor : themeGrey,
                  size: 25,
                ),
                onTap: () => {
                  setState(() {
                    _agree1 = !_agree1;
                  })
                },
              ),
              title: const Text('(필수) 이용약관'),
              onTap: () {
                print('Q&A is clicked !');
              },
              trailing: const Icon(Icons.chevron_right),
            ),
            heightSizeBox(5),
            ListTile(
              leading: GestureDetector(
                child: Icon(
                  Icons.verified,
                  color: _agree2 ? agreeCheckButtonActiveColor : themeGrey,
                  size: 25,
                ),
                onTap: () => {
                  setState(() {
                    _agree2 = !_agree2;
                  })
                },
              ),
              title: const Text('(필수) 개인정보 수집 및 이용'),
              onTap: () {
                print('Q&A is clicked !');
              },
              trailing: const Icon(Icons.chevron_right),
            ),
            heightSizeBox(5),
            ListTile(
              leading: GestureDetector(
                child: Icon(
                  Icons.verified,
                  color: _agree3 ? agreeCheckButtonActiveColor : themeGrey,
                  size: 25,
                ),
                onTap: () => {
                  setState(() {
                    _agree3 = !_agree3;
                  })
                },
              ),
              title: const Text('(필수) 결제 약관'),
              onTap: () {
                print('Q&A is clicked !');
              },
              trailing: const Icon(Icons.chevron_right),
            ),
            emptyExpanded(),
            GestureDetector(
              onTap: () => {
                if (allCheck()) {Navigator.of(context).pushNamed('/signup')}
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                width: double.infinity,
                height: 50,
                decoration: nextButtonStyle(allCheck()),
                child: const Center(
                    child: Text("모두 동의합니다.",
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w800))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool allCheck() {
    if (_agree1 && _agree2 && _agree3) return true;
    return false;
  }
}

InputDecoration textInputStyle(IconData icon) {
  return InputDecoration(
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    fillColor: themeWhite,
    filled: true,
    prefixIcon: Icon(icon),
  );
}

BoxDecoration nextButtonStyle(bool agreeState) {
  return BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    color: agreeState ? agreeCheckButtonActiveColor : themeGrey,
  );
}
