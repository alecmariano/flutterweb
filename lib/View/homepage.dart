import 'dart:html';

import 'package:cursoweb/Controller/course_controller.dart';
import 'package:cursoweb/Model/course_model.dart';
import 'package:cursoweb/View/Widgets/custom_flex_field.dart';
import 'package:cursoweb/View/Widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CourseModel> courses = [];
  CourseModel selectedCourse = CourseModel();
  List<DropdownMenuItem<String>> dropDownMenuItems = List();
  String selected;
  CourseController courseController = new CourseController();

  Future<List<DropdownMenuItem<String>>> getDropDownItems() async {
    await courseController.getAllCourses().then((cursos) {
      courses = cursos;
      cursos.forEach((element) {
        dropDownMenuItems.add(DropdownMenuItem(
            value: element.idcurso, child: Text(element.descricao)));
        print('Adicionou -> ${element.descricao}');
      });
      return dropDownMenuItems;
    });
  }

  void changedDropDownItem(String item) {
    print("Selecionado -> $item");
    setState(() {
      selected = item;
    });
  }

  @override
  void initState() {
    //selected = _dropDownMenuItems[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.green,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            height: heigth * 0.15,
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: heigth * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'SELECIONE O CURSO: ',
                  style: TextStyle(fontSize: 25),
                ),
                Expanded(
                  child: FutureBuilder(
                      future: getDropDownItems(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          print('Snap size -> ${dropDownMenuItems.length}');
                          return DropdownButtonFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              items: dropDownMenuItems,
                              value: selected,
                              onChanged: (item) {
                                selectedCourse = courses[int.parse(item)];
                                //courses.forEach((element) {});
                              } //,
                              );
                        } else {
                          return LinearProgressIndicator();
                        }
                      }),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.green,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: heigth * 0.05),
            margin: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomFormField(8, 'Nome do nível'),
                    CustomFlexField('Nível'),
                    CustomFlexField('Ordem'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormField(1, 'Livro'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomFormField(8, 'Editora'),
                    CustomFlexField('Edição'),
                    CustomFlexField('ISBN'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomFlexField('Ativo'),
                    CustomFlexField('Gera certificado'),
                    CustomFlexField('Carga horária'),
                    CustomFlexField('Iniciante'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomFlexField('Idade inicial'),
                    CustomFlexField('Idade final'),
                    CustomFlexField('Idade'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomFlexField('Falta reprova'),
                    CustomFlexField('Nota reprova'),
                    CustomFlexField('Modalidade'),
                    CustomFlexField('Curso'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomFlexField('Cor da fonte'),
                    CustomFlexField('Cor do fundo'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.green,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: heigth * 0.05),
            margin: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(columns: [
                DataColumn(label: Text('Nome')),
                DataColumn(label: Text('Sobrenome'))
              ], rows: [
                DataRow(
                    cells: [DataCell(Text('Alec')), DataCell(Text('Mariano'))]),
                DataRow(cells: [
                  DataCell(Text('Arthur')),
                  DataCell(Text('Mariano'))
                ]),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
