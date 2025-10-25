import 'package:flutter/material.dart';
import 'package:iithgalaxy/opinions.dart';
import 'navdrawer.dart';
import 'edit_widget.dart';
import 'myPage.dart';

class OpinionsWidget extends StatefulWidget {
  const OpinionsWidget({super.key});

  @override
  State<OpinionsWidget> createState() => _OpinionsWidget();
}

class _OpinionsWidget extends State<OpinionsWidget> {



  @override
  void initState() {
     Opinions.listenToOpinions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var c = Opinions();
    Opinions.listenToOpinions();

    return Container(
      margin: EdgeInsets.all(10),
      child: ListView(
        children:
            <Widget>[
              Text(
                "Opinions",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
              children: [ElevatedButton(onPressed: (){
                NavDrawer.setThePage(context, MaterialPageRoute<void>(builder: (context){return MyPage(body:  EditWidget());}));
              }, child: Text("Add")),]
              ),
            ] +
            c.getListCard(context),
      ),
    );
  }
}