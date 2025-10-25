import 'package:flutter/material.dart';
import 'package:iithgalaxy/opinions.dart';
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
            label: Text("Type"),
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
            },
          ),
          SizedBox(height: 10),
          DropdownMenu(
            requestFocusOnTap: true,
            label: Text("Type"),
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
          ),
          SizedBox(height: 10),

          TextField(
            controller: textfield,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
          SizedBox(height: 10),

          TextField(
            controller: textfield2,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Author",
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
            var vl = Event(name: data.getName(), duration: end?.difference(start??DateTime.now())??Duration(), start: start??DateTime.now(), authorDetails: data.getAuthor());
              Calender.addData(vl);
              NavDrawer.setThePage(context,  MaterialPageRoute<void>(builder: (context){return MyPage(body:  CalenderWidget());}));
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
