import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/increment_provider.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var state = Provider.of<SetDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Valor atualizado consumido pelo provider"),
            SizedBox(height: 10,),
            Text('${state.number}', style: Theme.of(context).textTheme.headline4,),
          ],
        ),
      ),
    );
  }
}
