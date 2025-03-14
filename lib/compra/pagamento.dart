//Package
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

//Telas
import 'package:projeto_ana/home.dart';
import 'package:projeto_ana/widgets/checkBoxCompra.dart';

class Pagamento extends StatefulWidget {
  const Pagamento({super.key});

  @override
  State<Pagamento> createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.brown),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(30), child: Column(
          children: [
            Image.network(
                'https://i.pinimg.com/736x/80/95/d2/8095d23eb73fbb06741044ef66a67bb5.jpg',
                height: 300,
              ),

              Transform.translate(
                offset: Offset(0, -60),
                child: Text(
                  'Forma de pagamento:',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),

              Transform.translate(
                offset: Offset(0, -40),
                child: Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(154, 118, 92, 0.7),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.brown, width: 2),

                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(154, 118, 92, 0.7),
                          offset: Offset(10, 10),
                          blurRadius: 1,
                          spreadRadius: 0,
                        ),
                      ],
                    ),

                    child: Column(
                      children: [
                        Row(
                          children: [
                            CheckBoxCompra(
                              activeColor: Color.fromRGBO(154, 118, 92, 0.5),
                            ),
                            Text(
                              'Pix',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 160),
                            Text(
                              '*',
                              style: TextStyle(fontSize: 25, color: Colors.red),
                            ),
                          ],
                        ),
                        Divider(color: Colors.brown),
                        Row(
                          children: [
                            CheckBoxCompra(
                              activeColor: Color.fromRGBO(154, 118, 92, 0.5),
                            ),
                            Text(
                              'Dinheiro',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Divider(color: Colors.brown),
                        Row(
                          children: [
                            CheckBoxCompra(
                              activeColor: Color.fromRGBO(154, 118, 92, 0.5),
                            ),
                            Text(
                              'Cartão débito/crédito',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                   QuickAlert.show(
          context: context,
          type: QuickAlertType.confirm,
          title: 'Deseja finalizar a compra?',
          text: 'em breve entraremos em contato pelo whatsapp',
          confirmBtnText: 'Sim',
          cancelBtnText: 'Não',
          confirmBtnColor: Colors.green,
          customAsset: 'assets/alerta.jpg',

          // customAsset: '',
          onConfirmBtnTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },

          onCancelBtnTap: () {
            Navigator.pop(context);
          },
        );
                },
                child: Text(
                  'Finalizar pedido',
                  style: TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),),
      ),
    );
  }
}