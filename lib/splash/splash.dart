
import 'package:flutter/material.dart';

import '../navigation/home.dart';
import '../util/colors.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      // Substitua 'NextScreen()' pela tela para a qual deseja navegar
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: MyColors.colorPrimary,
        ),
        child: Center(
          child: Image.network(
            'https://m.media-amazon.com/images/I/71ufJvztJUL._AC_UF1000,1000_QL80_.jpg',
            width: 225,
            height: 200,
            color: Colors.white,
          ), // Substitua 'assets/logo.png' pelo caminho da imagem do seu logo
        ),
      ),
    );
  }
}

