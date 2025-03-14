// Package
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:quickalert/quickalert.dart';

// Telas
import 'package:projeto_ana/compra/preferencias.dart';
import 'package:projeto_ana/carrinho/produto.dart';
import 'package:projeto_ana/carrinho/provider.dart';
import 'package:projeto_ana/loja.dart';

class Carrinho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carrinho = Provider.of<CarrinhoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Loja()));
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.brown),
        ),
        actions: [
          IconButton(
            onPressed: () {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.confirm,
                title: 'Apagar todos os itens do carrinho?',
                confirmBtnText: 'Sim',
                cancelBtnText: 'Não',
                confirmBtnColor: Colors.green,
                 customAsset:
                            'assets/alerta.jpg',

                // customAsset: '',
                onConfirmBtnTap: () {
                  carrinho.limparCarrinho();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Carrinho()));
                },

                onCancelBtnTap: () {
                  Navigator.pop(context);
                },
              );
            },
            icon: Icon(Icons.delete, color: Colors.brown),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child:
            carrinho.itens.isEmpty
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DelayedDisplay(
                              delay: const Duration(seconds: 2),
                              child: Text(
                                'Aqui só tem um gatinho :(',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            DelayedDisplay(
                              delay: const Duration(seconds: 1),
                              child: Image.network(
                                'https://i.pinimg.com/736x/6e/d0/e1/6ed0e169cb41457c391a660dbdfcc31b.jpg',
                                height: 200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
                : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: carrinho.itens.length,
                        itemBuilder: (context, index) {
                          final Produto produto = carrinho.itens[index];
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(width: 1),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.brown,
                                      blurRadius: 3, // Desfoque
                                      offset: Offset(4, 10), // Direção
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        produto.imagem,
                                        height: 100,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            produto.nome,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.brown,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            produto.descricao,
                                            style: TextStyle(
                                              color: Colors.brown,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            carrinho.removerDoCarrinho(produto);
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text("Item excluído!"),
                                              ),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.remove_circle,
                                            size: 30,
                                            color: Colors.brown,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "R\$ ${produto.preco.toInt()}",
                                          style: TextStyle(color: Colors.green),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 25),
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Image.network(
                            'https://i.pinimg.com/736x/f2/de/25/f2de25f8dd7d382f5b8432c7d126b328.jpg',
                            height: 65,
                            width: 65,
                          ),
                          Text(
                            "Total do carrinho: ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${carrinho.total.toInt()} reais",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.confirm,
                                title: 'Você deseja finalizar a compra?',
                                confirmBtnText: 'Sim',
                                cancelBtnText: 'Não',
                                confirmBtnColor: Colors.green,
                                 customAsset:
                            'assets/alerta.jpg',

                                onConfirmBtnTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Preferencias(),
                                    ),
                                  );
                                },

                                onCancelBtnTap: () {
                                  Navigator.pop(context);
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            child: Text(
                              "Finalizar Compra",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
