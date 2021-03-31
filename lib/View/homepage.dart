import 'dart:js';
import 'package:cursoweb/Controller/course_controller.dart';
import 'package:cursoweb/Controller/nivel_controller.dart';
import 'package:cursoweb/Model/course_model.dart';
import 'package:cursoweb/Model/nivel_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CourseModel> courses = [];
  List<NivelModel> niveis = [];
  CourseModel selectedCourse = CourseModel();
  NivelModel nivelModel = NivelModel();
  List<DropdownMenuItem<String>> dropDownMenuItems = List();
  String selected = '1';
  CourseController courseController = new CourseController();
  NivelController nivelController = new NivelController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final descricao = new TextEditingController();
  final nivel = new TextEditingController();
  final ordem = new TextEditingController();
  final livro = new TextEditingController();
  final editora = new TextEditingController();
  final edicao = new TextEditingController();
  final isbn = new TextEditingController();
  final ativo = new TextEditingController();
  final geraCertificado = new TextEditingController();
  final cargaHoraria = new TextEditingController();
  final iniciante = new TextEditingController();
  final idadeInicial = new TextEditingController();
  final idadeFinal = new TextEditingController();
  final idade = new TextEditingController();
  final faltaReprova = new TextEditingController();
  final notaReprova = new TextEditingController();
  final modalidade = new TextEditingController();
  final curso = new TextEditingController();
  final corFonte = new TextEditingController();
  final corFundo = new TextEditingController();

  Future<List<DropdownMenuItem<String>>> getDropDownItems() async {
    dropDownMenuItems.clear();
    await courseController.getAllCourses().then((cursos) {
      courses = cursos;
      cursos.forEach((element) {
        dropDownMenuItems.add(DropdownMenuItem(
            value: element.idcurso,
            child: Text(element.descricao == null ? '' : element.descricao)));
      });
      return dropDownMenuItems;
    });
  }

  Future<List<NivelModel>> getNiveis(String idcurso) async {
    if (idcurso == null) {
      return null;
    } else {
      List<NivelModel> list = new List();
      await nivelController.getAllNiveisById(idcurso).then((niveis) {
        niveis.forEach((element) {
          list.add(element);
        });
      });
      return list;
    }
  }

  List<DataRow> getListData() {
    List<DataRow> list = new List();
    for (var i = 0; i < niveis.length; i++) {
      list.add(DataRow(
          selected: false,
          onSelectChanged: (bool isSelected) => loadForm(niveis[i], isSelected),
          cells: [
            DataCell(Text(niveis[i].status == null ? '' : niveis[i].status)),
            DataCell(Text(niveis[i].idcurso == null ? '' : niveis[i].idcurso)),
            DataCell(
                Text(niveis[i].descricao == null ? '' : niveis[i].descricao)),
            DataCell(Text(
                niveis[i].proximonivel == null ? '' : niveis[i].proximonivel)),
            DataCell(Text(niveis[i].nivelequivalente == null
                ? ''
                : niveis[i].nivelequivalente)),
            DataCell(Text(niveis[i].nivelequivalente2 == null
                ? ''
                : niveis[i].nivelequivalente2)),
            DataCell(Text(niveis[i].nivelequivalente3 == null
                ? ''
                : niveis[i].nivelequivalente3)),
            DataCell(Text(niveis[i].nivelequivalente4 == null
                ? ''
                : niveis[i].nivelequivalente4))
          ]));
    }
    return list;
  }

  NivelModel setNewModel() {
    return NivelModel(
      descricao: descricao.text == '' ? 'null' : descricao.text,
      nivel: nivel.text == '' ? 'null' : nivel.text,
      ordem: ordem.text == '' ? 'null' : ordem.text,
      livro: livro.text == '' ? 'null' : livro.text,
      livroeditora: editora.text == '' ? 'null' : editora.text,
      livroedicao: edicao.text == '' ? 'null' : edicao.text,
      isbn: isbn.text == '' ? 'null' : isbn.text,
      status: ativo.text == '' ? 'null' : ativo.text,
      geracertificado:
          geraCertificado.text == '' ? 'null' : geraCertificado.text,
      cargahoraria: cargaHoraria.text == '' ? 'null' : cargaHoraria.text,
      iniciante: iniciante.text == '' ? 'null' : iniciante.text,
      idadeinicial: idadeInicial.text == '' ? 'null' : idadeInicial.text,
      idadefinal: idadeFinal.text == '' ? 'null' : idadeFinal.text,
      idadeindicativa: idade.text == '' ? 'null' : idade.text,
      reprovaporfalta: faltaReprova.text == '' ? 'null' : faltaReprova.text,
      reprovapornota: notaReprova.text == '' ? 'null' : notaReprova.text,
      onlinepresencial: modalidade.text == '' ? 'null' : modalidade.text,
      idcurso: selected,
      fontcolor: corFonte.text == '' ? 'null' : corFonte.text,
      labelcolor: corFundo.text == '' ? 'null' : corFundo.text,
    );
  }

  NivelModel updateModel(NivelModel model) {
    model.descricao = descricao.text;
    model.nivel = nivel.text;
    model.ordem = ordem.text;
    model.livro = livro.text;
    model.livroeditora = editora.text;
    model.livroedicao = edicao.text;
    model.isbn = isbn.text;
    model.status = ativo.text;
    model.geracertificado = geraCertificado.text;
    model.cargahoraria = cargaHoraria.text;
    model.iniciante = iniciante.text;
    model.idadeinicial = idadeInicial.text;
    model.idadefinal = idadeFinal.text;
    model.idadeindicativa = idade.text;
    model.reprovaporfalta = faltaReprova.text;
    model.reprovapornota = notaReprova.text;
    model.onlinepresencial = modalidade.text;
    model.idcurso = curso.text;
    model.fontcolor = corFonte.text;
    model.labelcolor = corFundo.text;
    return model;
  }

  void loadForm(NivelModel model, bool isSelected) {
    if (isSelected) {
      descricao.text = model.descricao;
      nivel.text = model.nivel;
      ordem.text = model.ordem;
      livro.text = model.livro;
      editora.text = model.livroeditora;
      edicao.text = model.livroedicao;
      isbn.text = model.isbn;
      ativo.text = model.status;
      geraCertificado.text = model.geracertificado;
      cargaHoraria.text = model.cargahoraria;
      iniciante.text = model.iniciante;
      idadeInicial.text = model.idadeinicial;
      idadeFinal.text = model.idadefinal;
      idade.text = model.idadeindicativa;
      faltaReprova.text = model.reprovaporfalta;
      notaReprova.text = model.reprovapornota;
      modalidade.text = model.onlinepresencial;
      curso.text = model.idcurso;
      corFonte.text = model.fontcolor;
      corFundo.text = model.labelcolor;
      setState(() {
        nivelModel = model;
        nivelController.changeNivel(model);
      });
    }
  }

  void clearForm(bool stateful) {
    nivelModel = new NivelModel();
    descricao.clear();
    nivel.clear();
    ordem.clear();
    livro.clear();
    editora.clear();
    edicao.clear();
    isbn.clear();
    ativo.clear();
    geraCertificado.clear();
    cargaHoraria.clear();
    iniciante.clear();
    idadeInicial.clear();
    idadeFinal.clear();
    idade.clear();
    faltaReprova.clear();
    notaReprova.clear();
    modalidade.clear();
    curso.clear();
    corFonte.clear();
    corFundo.clear();
    if (stateful) {
      setState(() {});
    }
  }

  void atualizaTabelaNiveis() async {
    niveis = await getNiveis(selected);
    nivelController.changeNiveis(niveis);
    clearForm(false);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[200],
      body: StreamBuilder<Object>(
          stream: nivelController.outNivelStream,
          builder: (context, snapshot) {
            //if (snapshot.hasData) {
            return FutureBuilder(
                future: getDropDownItems(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView(
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
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.05),
                          margin: EdgeInsets.symmetric(
                              horizontal: width * 0.05,
                              vertical: heigth * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'SELECIONE O CURSO: ',
                                style: TextStyle(fontSize: 25),
                              ),
                              Expanded(
                                  child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
                                      items: dropDownMenuItems,
                                      value: selected,
                                      onChanged: (item) async {
                                        print('Curso selecionado: $item');
                                        selected = item;
                                        niveis = await getNiveis(item);
                                        nivelController.changeNiveis(niveis);
                                      })),
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
                              horizontal: width * 0.05,
                              vertical: heigth * 0.05),
                          margin:
                              EdgeInsets.symmetric(horizontal: width * 0.05),
                          child: StreamBuilder(
                              stream: nivelController.outNivel,
                              builder: (context, snapshot) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 8,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: TextFormField(
                                                controller: descricao,
                                                decoration: InputDecoration(
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .auto,
                                                    labelText: 'Nome do nível',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)))),
                                              ),
                                            )),
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: nivel,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Nível',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        )),
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: ordem,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Ordem',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: TextFormField(
                                                controller: livro,
                                                decoration: InputDecoration(
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .auto,
                                                    labelText: 'Livro',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)))),
                                              ),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 8,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: TextFormField(
                                                controller: editora,
                                                decoration: InputDecoration(
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .auto,
                                                    labelText: 'Editora',
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)))),
                                              ),
                                            )),
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: edicao,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Edição',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        )),
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: isbn,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'ISBN',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: ativo,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Ativo',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        )),
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: geraCertificado,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Gera certificado',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        )),
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: cargaHoraria,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Carga horária',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        )),
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: iniciante,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Iniciante',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: idadeInicial,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Idade inicial',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        )),
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: idadeFinal,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Idade final',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        )),
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: idade,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Idade',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: faltaReprova,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Falta reprova',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        )),
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: notaReprova,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Nota reprova',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        )),
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: modalidade,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Modalidade',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        )),
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: curso,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Curso',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: corFundo,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Cor da fonte',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        )),
                                        Flexible(
                                            child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: TextFormField(
                                            controller: corFundo,
                                            decoration: InputDecoration(
                                                floatingLabelBehavior:
                                                    FloatingLabelBehavior.auto,
                                                labelText: 'Cor do fundo',
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)))),
                                          ),
                                        )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.green),
                                              onPressed: () async {
                                                if (nivelModel.sId == null) {
                                                  print('Passou pelo IF');
                                                  bool res =
                                                      await nivelController
                                                          .insertNivel(
                                                              setNewModel());
                                                  if (res) {
                                                    atualizaTabelaNiveis();
                                                    nivelController
                                                        .changeBool(res);
                                                    return ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.lightGreen,
                                                      content: Text(
                                                          'Registro inserido com sucesso!'),
                                                    ));
                                                  } else {
                                                    clearForm(false);
                                                    return ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      content: Text(
                                                          'Erro ao inserir registro'),
                                                    ));
                                                  }
                                                } else {
                                                  print(
                                                      'Atualizando id -> ${nivelModel.sId}');
                                                  print(
                                                      'Valor campo descricao -> ${descricao.value}');
                                                  bool res =
                                                      await nivelController
                                                          .updateNivel(
                                                              updateModel(
                                                                  nivelModel));
                                                  if (res) {
                                                    atualizaTabelaNiveis();
                                                    return ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.lightGreen,
                                                      content: Text(
                                                          'Registro atualizado com sucesso!'),
                                                    ));
                                                  } else {
                                                    clearForm(false);
                                                    return ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      content: Text(
                                                          'Erro ao atualizar registro'),
                                                    ));
                                                  }
                                                }
                                              },
                                              child: Text('Salvar')),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.blueGrey),
                                              onPressed: () => clearForm(true),
                                              child: Text('Limpar Campos')),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.red),
                                              onPressed: () async {
                                                // ignore: await_only_futures
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext
                                                                context) =>
                                                            AlertDialog(
                                                              title: Text(
                                                                  "Atenção!"),
                                                              content: Text(
                                                                  "Tem certeza que deseja excluir este nível?"),
                                                              actions: [
                                                                ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                          primary:
                                                                              Colors.grey),
                                                                  child: Text(
                                                                      "Cancelar"),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                ),
                                                                ElevatedButton(
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                          primary:
                                                                              Colors.red),
                                                                  child: Text(
                                                                      "Continuar"),
                                                                  onPressed:
                                                                      () async {
                                                                    await nivelController
                                                                        .removeNivel(
                                                                            nivelModel.sId);
                                                                    niveis =
                                                                        await getNiveis(
                                                                            selected);
                                                                    nivelController
                                                                        .changeNiveis(
                                                                            niveis);
                                                                    clearForm(
                                                                        false);
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                )
                                                              ],
                                                            ));
                                              },
                                              child: Text('Excluir')),
                                        ),
                                      ),
                                    ])
                                  ],
                                );
                              }),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.05,
                                vertical: heigth * 0.05),
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: StreamBuilder<Object>(
                                stream: nivelController.boolStream,
                                builder: (context, snapshot) {
                                  return Column(children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: DataTable(
                                        showCheckboxColumn: false,
                                        columns: [
                                          DataColumn(label: Text('Ativo')),
                                          DataColumn(label: Text('Curso ID')),
                                          DataColumn(label: Text('Descrição')),
                                          DataColumn(
                                              label: Text('Próximo nível')),
                                          DataColumn(label: Text('Equiv 1')),
                                          DataColumn(label: Text('Equiv 2')),
                                          DataColumn(label: Text('Equiv 3')),
                                          DataColumn(label: Text('Equiv 4'))
                                        ],
                                        rows: getListData(),
                                      ),
                                    ),
                                    ElevatedButton(
                                        child: Text(
                                            'Parametrizar Avaliações do Nível'),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.grey),
                                        onPressed: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (BuildContext bc) {
                                                return Container(
                                                  padding: EdgeInsets.all(10),
                                                  child: Column(
                                                    children: [
                                                      Center(
                                                          child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 20),
                                                        child: Text(
                                                          'PARAMETRIZAÇÃO',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 25,
                                                          ),
                                                        ),
                                                      )),
                                                      Expanded(
                                                          flex: 8,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  descricao,
                                                              decoration: InputDecoration(
                                                                  floatingLabelBehavior:
                                                                      FloatingLabelBehavior
                                                                          .auto,
                                                                  labelText:
                                                                      'Parâmetro 1',
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(10)))),
                                                            ),
                                                          )),
                                                      Expanded(
                                                          flex: 8,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  descricao,
                                                              decoration: InputDecoration(
                                                                  floatingLabelBehavior:
                                                                      FloatingLabelBehavior
                                                                          .auto,
                                                                  labelText:
                                                                      'Parâmetro 2',
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(10)))),
                                                            ),
                                                          )),
                                                      Expanded(
                                                          flex: 8,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  descricao,
                                                              decoration: InputDecoration(
                                                                  floatingLabelBehavior:
                                                                      FloatingLabelBehavior
                                                                          .auto,
                                                                  labelText:
                                                                      'Parâmetro 3',
                                                                  border: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(10)))),
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                );
                                              });
                                        })
                                  ]);
                                })),
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                });
            // } else {
            //   return CircularProgressIndicator();
            // }
          }),
    );
  }
}
