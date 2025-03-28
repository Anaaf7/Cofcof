import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

//Telas 
import 'package:projeto_ana/home.dart';

//Telas

class Suporte extends StatefulWidget {
  const Suporte({super.key});

  @override
  State<Suporte> createState() => _SuporteState();
}

class _SuporteState extends State<Suporte> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Voltar para a tela home
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                children: [
                  Transform.translate(
                    offset: Offset(0, -100),
                    child: Image.network(
                      'https://i.pinimg.com/736x/67/b4/90/67b49080383bce19ff09d4e782be237d.jpg',
                      height: 450,
                    ),
                  ),
            
                  SizedBox(height: 30), //espaçamento
            
                  Transform.translate(
                    offset: Offset(0, -300),
                    child: Text(
                      'Algo deu errado?',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
            
                  Transform.translate(
                    offset: Offset(0, -300),
                    child: Text(
                      'por favor, nos fale mais sobre',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
            
                  SizedBox(height: 5), //espaçamento
            
                  Transform.translate(
                    offset: Offset(0, -280),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'E-mail...',
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
            
                  Transform.translate(
                    offset: Offset(0, -250),
                    child: TextFormField(
                      minLines: 5,
                      maxLines: 5,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Faça uma breve descrição...',
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
            
                  Transform.translate(
                    offset: Offset(0, -240),
                    child: ElevatedButton(
                      onPressed: () {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.confirm,
                          title: 'Obrigada pelo feedback',
                          text: 'a equipe Cofcof agradece!',
                          confirmBtnText: ';)',
                          confirmBtnColor: Colors.green,
                          customAsset:
                              'assets/alerta.jpg',
                    
                          // customAsset: '',
                          onConfirmBtnTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(100, 20),
                        backgroundColor:
                            Colors.grey[400],
                      ),
                      child: Text(
                        'Enviar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
