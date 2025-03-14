import 'package:flutter/material.dart';
import 'package:projeto_ana/carrinho/produto.dart';

class CarrinhoProvider with ChangeNotifier {
  final List<Produto> _itens = [];

  List<Produto> get itens => _itens;

  void adicionarAoCarrinho(Produto produto) {
    _itens.add(produto);
    notifyListeners(); // Atualizar o estado
  }

//No arquivo do carrinho
  void removerDoCarrinho(Produto produto) {
    _itens.remove(produto);
    notifyListeners();
  }

//No icone de lixeira do carrinho
  void limparCarrinho() {
    _itens.clear();
    notifyListeners();
  }

  double get total {
    return _itens.fold(0, (total, item) => total + item.preco);
  }
}