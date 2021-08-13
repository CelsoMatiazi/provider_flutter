import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/provider/increment_provider.dart';

import 'Screen2.dart';



void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

  runApp(ChangeNotifierProvider(
      create: (_) => SetDataProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Provider example')
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



void atualizaDados(context){
  var state = Provider.of<SetDataProvider>(context, listen: false);
  state.incrementNumber();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    //var state = Provider.of<SetDataProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Provider - Gerencia de Estado',
            ),

            SizedBox(height: 10,),

            Consumer<SetDataProvider>(
              builder: (_, value, __) {
                return value.isLoading ? CircularProgressIndicator() :
                Text(value.number.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),

          ],
        ),
      ),


      bottomNavigationBar: Container(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                    child: Text('Atualiza'),
                    onPressed:(){
                      atualizaDados(context);
                    } ,
                  )
              ),

              SizedBox(width: 8,),
              Expanded(
                  child: ElevatedButton(
                    child: Text('Navega'),
                    onPressed: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Screen2()));
                    },
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
