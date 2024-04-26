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
      body: Column(
        children: [
          Image.asset('assets/images/login_background.png'),
          const Text("BAKERY TIME"),
          const Text("bake time warmly"),
          Container(
            padding: const EdgeInsets.all(50),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _agree1,
                      onChanged: (value)=>{
                        setState((){
                          allCheck(); 
                          _agree1=value!;
                        })
                      }
                    ),
                    const Text("개인정보 동의"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _agree2,
                      onChanged: (value)=>{
                        setState((){
                          allCheck(); 
                          _agree2=value!;
                        })
                      }
                    ),
                    const Text("개인정보 동의"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _agree3,
                      onChanged: (value)=>{
                        setState((){
                          allCheck(); 
                          _agree3=value!;
                        })
                      }
                    ),
                    const Text("개인정보 동의"),
                  ],
                ),
                GestureDetector(
                  onTap: ()=>{Navigator.of(context).pushNamed('/signup')},
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    width: double.infinity,
                    height: 50,
                    decoration: allCheck() ? touchableButtonStyle() : untouchableButtonStyle(),
                    child: const Center(child: Text("모두 동의합니다.")),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox.shrink()),
        ],
      ),
    );
  }

  bool allCheck() {
    if(_agree1 && _agree2 && _agree3) return true;
    return false;
  }
}

InputDecoration textInputStyle(IconData icon) {
  return InputDecoration(
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    fillColor:  const Color.fromRGBO(231, 212, 200, 1),
    filled: true,
    prefixIcon: Icon(icon),
  );
}

BoxDecoration touchableButtonStyle() {
  return const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    color: Color.fromRGBO(221, 83, 48, 1),
  );
}
BoxDecoration untouchableButtonStyle() {
  return const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    color: Color.fromRGBO(165, 161, 160, 1),
  );
}