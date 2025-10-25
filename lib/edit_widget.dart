import 'package:flutter/material.dart';
import 'package:iithgalaxy/iithspecials.dart';
import 'package:iithgalaxy/iithspecials_widget.dart';
import 'package:iithgalaxy/opinions.dart';
import 'package:iithgalaxy/opinions_widget.dart';
import 'opinions.dart';
import 'navdrawer.dart';
import 'myPage.dart';
import 'calender.dart';
import 'calendar_widget.dart';
import 'view_widget.dart';

class EditWidget extends StatefulWidget {
  EditWidget();

  @override
  State<EditWidget> createState() => _EditWidget();
}

class _EditWidget extends State<EditWidget> {
  DataView data=Event(  name: "Event1",
        duration: Duration(days: 0, hours: 1, minutes: 30),
        start: DateTime(2025, 9, 7, 17, 30),authorDetails:"hike");
  _EditWidget();

  final textfield = TextEditingController();
  final textfield2 = TextEditingController();
  final textfield3 = TextEditingController();
  DataType val = DataType.calenderType;
  DateTime? start, end;
  TimeOfDay? startt, endt;

  @override
  void dispose() {
    textfield.dispose();
    textfield2.dispose();
    textfield3.dispose();
    super.dispose();
  }
 var x = [""];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Text(
            "Editing Space",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 50),
          DropdownMenu(
            requestFocusOnTap: true,
            label: Text("Type",style: TextStyle(
              color: const Color.fromARGB(255, 255, 155, 191)
            ),),
            textStyle: TextStyle(
              color: const Color.fromARGB(255, 255, 155, 191)
            ),
            dropdownMenuEntries: [
              DropdownMenuEntry(
                value: DataType.calenderType,
                label: "Calendar",
              ),
              DropdownMenuEntry(
                value: DataType.iith_SpecialType,
                label: "IITH_Special",
              ),
              DropdownMenuEntry(
                value: DataType.opinionsType,
                label: "Opinions.IITH",
              ),
            ],
            onSelected: (value) {
              val = value ?? DataType.calenderType;
              switch (val) {
                case DataType.calenderType:
                  x=strEvent;
                  break;
                case DataType.iith_SpecialType:
                x=strItems;
                case DataType.opinionsType:
                x=strOpinion;
                default:
                x=[""];

              }
              setState(() {
                
              });
            },
          ),
          SizedBox(height: 10),
          DropdownMenu(
            requestFocusOnTap: true,
            label: Text("Type",style: TextStyle(
              color: const Color.fromARGB(255, 255, 155, 191)
            ),),
            textStyle: TextStyle(
              color: const Color.fromARGB(255, 255, 155, 191)
            ),
            dropdownMenuEntries: x.map((i){
              return DropdownMenuEntry(
                value: x.indexOf(i),
                label: i,
              );}).toList(),
          
          ),
          SizedBox(height: 10),

          TextField(
            controller: textfield,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
              iconColor: Colors.amber,
              labelStyle: TextStyle(
              color: const Color.fromARGB(255, 255, 155, 191)
            ),floatingLabelStyle: TextStyle(
              color: const Color.fromARGB(255, 255, 155, 191)
            ),
            ),
          ),
          SizedBox(height: 10),

          TextField(
            controller: textfield2,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Author",
              labelStyle: TextStyle(
              color: const Color.fromARGB(255, 255, 155, 191)
            ),floatingLabelStyle: TextStyle(
              color: const Color.fromARGB(255, 255, 155, 191)
            ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () async {
              start = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2050),
              );
            },
            icon: Icon(Icons.calendar_month),
            label: Text("pick starting date"),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              startt = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
            },
            icon: Icon(Icons.alarm),
            label: Text("pick starting time"),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              end = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2050),
              );
            },
            icon: Icon(Icons.calendar_month),
            label: Text("pick ending date"),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              endt = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
            },
            icon: Icon(Icons.alarm),
            label: Text("pick ending time"),
          ),
          SizedBox(height: 10),

          TextField(
            controller: textfield3,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              labelText: "Add description",
              border: OutlineInputBorder(),
              labelStyle: TextStyle(
              color: const Color.fromARGB(255, 255, 155, 191)
            ),floatingLabelStyle: TextStyle(
              color: const Color.fromARGB(255, 255, 155, 191)
              
            ),
            ),
          ),
          ElevatedButton(onPressed: () {

data.setName(textfield.text);
data.setAuthor(textfield2.text);
data.setDesc(textfield3.text);
start=DateTime(
          start?.year??0,
          start?.month??0,
          start?.day??0,
          startt?.hour??0,
          startt?.minute??0,
        );
        end=DateTime(
          end?.year??0,
          end?.month??0,
          end?.day??0,
          endt?.hour??0,
          endt?.minute??0,
        );
data.setTime(start??DateTime.now(), end??DateTime.now());

          switch (val) {
            case DataType.calenderType:
            var vl = Event(name: data.getName(), duration: (end?.difference(start??DateTime.now()))??Duration(hours: 1), start: start??DateTime.now(), authorDetails: data.getAuthor());
              Calender.addEvent(vl);
              NavDrawer.setThePage(context,  MaterialPageRoute<void>(builder: (context){return MyPage(body:  CalenderWidget());}));
              break;
            case DataType.iith_SpecialType:
            var vl = Item(name: data.getName(),type: ItemType.ideas,  authorDetails: data.getAuthor(),detail: data.getDesc());
              IITHSpecial.addItem(vl);
              NavDrawer.setThePage(context,  MaterialPageRoute<void>(builder: (context){return MyPage(body:  IITHSpecialWidget());}));
              break;
            case DataType.opinionsType:
            var vl = Opinion(name: data.getName(),type: OpinionType.compliants, authorDetails: data.getAuthor(),detail: data.getDesc());
              Opinions.addOpinion(vl);
              NavDrawer.setThePage(context,  MaterialPageRoute<void>(builder: (context){return MyPage(body:  OpinionsWidget());}));
              break;
            default:
          }
          }, child: Text("Submit")),

          //FloatingActionButton(onPressed: (){})
        ],
      ),
    );
  }
}
