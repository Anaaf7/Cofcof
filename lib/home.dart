//Packages
import 'package:flutter/material.dart';
import 'package:appbar_animated/appbar_animated.dart';
import 'package:delayed_display/delayed_display.dart';

//Telas
import 'package:projeto_ana/widgets/suporte.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaffoldLayoutBuilder(
        backgroundColorAppBar: const ColorBuilder(
          Colors.transparent,
          Colors.brown,
        ),
        textColorAppBar: const ColorBuilder(Colors.white),
        appBarBuilder: _AppBar,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.network(
                "https://i.pinimg.com/736x/e9/11/e6/e911e6b2f33d61b79bdd4dacc7642713.jpg",
              ),
              Container(
                margin: EdgeInsets.only(top: 380),
                height: 800,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 15, left: 30, right: 30),

                  child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DelayedDisplay(
                        delay: const Duration(seconds: 1),
                        child: Text.rich(
                          TextSpan(
                            text: "Encontre \nsua dose de ",
                            style: TextStyle(fontSize: 45),
                            children: [
                              TextSpan(
                                text: "energia ",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 0.5,
                                ),
                              ),
                              TextSpan(text: "aqui!\n"),
                              TextSpan(
                                text: "-Cofcof",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 30),
                      Divider(),

                       Text(
            'Nossos horários de atendimento:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
Text('9:00 12:00 | 13:30 18:30'),
          
          SizedBox(height: 20),

                       Text(
            'Localização',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),

Text('Rua Abraham Lincoln, 210 - Jardim América'),
          SizedBox(height: 20,),

              Text(
            'Redes sociais',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network('https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExYWprbHd3MTRudGN2bHg1czQxMDlpaHZ1NTRqcGtrd2U4bGlrcHp0cyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/YwNCU8P5jGMNKGG5Bq/giphy.gif',height: 25,), SizedBox(width: 10,),
              Image.network('https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExcjl2YjBmbzV5ZmRzZzdzNzE2c3N3b3A0MXo3bGllbGVmZmtkYXhtayZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/9FbLcp4NnluxdR6EyZ/giphy.gif',height: 25,), SizedBox(width: 10,),
              Image.network('https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExZnNhczJ1bmZ2cjN5aGRpbms1NTRuaXlzdGhiOHJnMmZmMm4wd2s1OCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/tuESmWudOHqZpYOJpp/giphy.gif',height: 25,), SizedBox(width: 10,),
            ],
          ),
              Divider()

          
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

Widget _AppBar(BuildContext context, ColorAnimated colorAnimated) {
  return AppBar(
    backgroundColor: colorAnimated.background,
    elevation: 0,
    leading: SizedBox(),

    actions: [
      PopupMenuButton(
        icon: Icon(Icons.menu, color: Colors.white),

        onSelected: (value) {
          //Verificar se o usuário clicou em suporte
          if (value == 'suporte') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Suporte()),
            );
          }
        },
        itemBuilder:
            (BuildContext context) => [
              PopupMenuItem(value: 'suporte', child: Text('Suporte')),
            ],
      ),
    ],
  );
}
