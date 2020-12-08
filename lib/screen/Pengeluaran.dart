import 'package:finacash/Helper/Sqflite.dart';
import 'package:finacash/Widgets/TimeLineItem.dart';
import 'package:flutter/material.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class DespesasResumo extends StatefulWidget {
  @override
  _DespesasResumoState createState() => _DespesasResumoState();
}

class _DespesasResumoState extends State<DespesasResumo> {
  MovimentacoesHelper movimentacoesHelper = MovimentacoesHelper();
  List<Movimentacoes> listmovimentacoes = List();

  _allMovPortipo() {
    movimentacoesHelper.getAllMovimentacoesPortipo("d").then((list) {
      setState(() {
        listmovimentacoes = list;
      });
      print("All Mov: $listmovimentacoes");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _allMovPortipo();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.redAccent.withOpacity(0.8),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
            backgroundColor: Colors.lightBlue,
            content: Text('Tap back again to leave',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                ))),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: width * 0.26, top: width * 0.10),
                child: Text(
                  "Pengeluaran",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white, //Colors.grey[400],
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.08),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.03, top: width * 0.08),
                child: SizedBox(
                  width: width,
                  height: height * 0.74,
                  child: ListView.builder(
                    itemCount: listmovimentacoes.length,
                    itemBuilder: (context, index) {
                      List movReverse = listmovimentacoes.reversed.toList();
                      Movimentacoes mov = movReverse[index];

                      if (movReverse[index] == movReverse.last) {
                        return TimeLineItem(
                          mov: mov,
                          colorItem: Colors.red[900],
                          isLast: true,
                        );
                      } else {
                        return TimeLineItem(
                          mov: mov,
                          colorItem: Colors.red[900],
                          isLast: false,
                        );
                      }
                    },
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
