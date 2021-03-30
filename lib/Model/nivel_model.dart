class NivelModel {
  String id;
  String idNivel;
  String idCurso;
  String permiteMatriculaAutomatica;
  String iniciante;
  String descricao;
  String labelColor;
  String valor;
  String status;
  String nivel;
  String livro;
  String livroEdicao;
  String livroEditora;
  String proximoNivel;
  String idadeInicial;
  String idadeFinal;
  String idadeIndicativa;
  String ordem;
  String dataNascimentoInicial;
  String dataNascimentoFinal;
  String idLabelNotas;
  String nivelEquivalente;
  String cargaHoraria;
  String geraCertificado;
  String nivelEquivalente2;
  String nivelEquivalente3;
  String nivelEquivalente4;
  String ano;
  String semestre;
  String idLabelNotas2;
  String rangeIdadeInicial;
  String rangeIdadeFinal;
  String reprovaPorNota;
  String reprovaPorFalta;
  String dTINC;
  String dTALT;
  String usuarioINC;
  String usuarioALT;
  String isbn;
  String fontColor;
  String onlinePresencial;

  NivelModel(
      {this.id,
      this.idNivel,
      this.idCurso,
      this.permiteMatriculaAutomatica,
      this.iniciante,
      this.descricao,
      this.labelColor,
      this.valor,
      this.status,
      this.nivel,
      this.livro,
      this.livroEdicao,
      this.livroEditora,
      this.proximoNivel,
      this.idadeInicial,
      this.idadeFinal,
      this.idadeIndicativa,
      this.ordem,
      this.dataNascimentoInicial,
      this.dataNascimentoFinal,
      this.idLabelNotas,
      this.nivelEquivalente,
      this.cargaHoraria,
      this.geraCertificado,
      this.nivelEquivalente2,
      this.nivelEquivalente3,
      this.nivelEquivalente4,
      this.ano,
      this.semestre,
      this.idLabelNotas2,
      this.rangeIdadeInicial,
      this.rangeIdadeFinal,
      this.reprovaPorNota,
      this.reprovaPorFalta,
      this.dTINC,
      this.dTALT,
      this.usuarioINC,
      this.usuarioALT,
      this.isbn,
      this.fontColor,
      this.onlinePresencial});

  NivelModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    idNivel = json['id_nivel'];
    idCurso = json['id_curso'];
    permiteMatriculaAutomatica = json['permite_matricula_automatica'];
    iniciante = json['INICIANTE'];
    descricao = json['descricao'];
    labelColor = json['label_color'];
    valor = json['valor'];
    status = json['status'];
    nivel = json['nivel'];
    livro = json['livro'];
    livroEdicao = json['livro_edicao'];
    livroEditora = json['livro_editora'];
    proximoNivel = json['proximo_nivel'];
    idadeInicial = json['idade_inicial'];
    idadeFinal = json['idade_final'];
    idadeIndicativa = json['idade_indicativa'];
    ordem = json['ordem'];
    dataNascimentoInicial = json['data_nascimento_inicial'];
    dataNascimentoFinal = json['data_nascimento_final'];
    idLabelNotas = json['id_label_notas'];
    nivelEquivalente = json['nivel_equivalente'];
    cargaHoraria = json['CargaHoraria'];
    geraCertificado = json['GeraCertificado'];
    nivelEquivalente2 = json['nivel_equivalente2'];
    nivelEquivalente3 = json['nivel_equivalente3'];
    nivelEquivalente4 = json['nivel_equivalente4'];
    ano = json['ano'];
    semestre = json['semestre'];
    idLabelNotas2 = json['id_label_notas2'];
    rangeIdadeInicial = json['range_idade_inicial'];
    rangeIdadeFinal = json['range_idade_final'];
    reprovaPorNota = json['ReprovaPorNota'];
    reprovaPorFalta = json['ReprovaPorFalta'];
    dTINC = json['DT_INC'];
    dTALT = json['DT_ALT'];
    usuarioINC = json['USUARIO_INC'];
    usuarioALT = json['USUARIO_ALT'];
    isbn = json['ISBN'];
    fontColor = json['font_color'];
    onlinePresencial = json['ONLINE_PRESENCIAL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['id_nivel'] = this.idNivel;
    data['id_curso'] = this.idCurso;
    data['permite_matricula_automatica'] = this.permiteMatriculaAutomatica;
    data['INICIANTE'] = this.iniciante;
    data['descricao'] = this.descricao;
    data['label_color'] = this.labelColor;
    data['valor'] = this.valor;
    data['status'] = this.status;
    data['nivel'] = this.nivel;
    data['livro'] = this.livro;
    data['livro_edicao'] = this.livroEdicao;
    data['livro_editora'] = this.livroEditora;
    data['proximo_nivel'] = this.proximoNivel;
    data['idade_inicial'] = this.idadeInicial;
    data['idade_final'] = this.idadeFinal;
    data['idade_indicativa'] = this.idadeIndicativa;
    data['ordem'] = this.ordem;
    data['data_nascimento_inicial'] = this.dataNascimentoInicial;
    data['data_nascimento_final'] = this.dataNascimentoFinal;
    data['id_label_notas'] = this.idLabelNotas;
    data['nivel_equivalente'] = this.nivelEquivalente;
    data['CargaHoraria'] = this.cargaHoraria;
    data['GeraCertificado'] = this.geraCertificado;
    data['nivel_equivalente2'] = this.nivelEquivalente2;
    data['nivel_equivalente3'] = this.nivelEquivalente3;
    data['nivel_equivalente4'] = this.nivelEquivalente4;
    data['ano'] = this.ano;
    data['semestre'] = this.semestre;
    data['id_label_notas2'] = this.idLabelNotas2;
    data['range_idade_inicial'] = this.rangeIdadeInicial;
    data['range_idade_final'] = this.rangeIdadeFinal;
    data['ReprovaPorNota'] = this.reprovaPorNota;
    data['ReprovaPorFalta'] = this.reprovaPorFalta;
    data['DT_INC'] = this.dTINC;
    data['DT_ALT'] = this.dTALT;
    data['USUARIO_INC'] = this.usuarioINC;
    data['USUARIO_ALT'] = this.usuarioALT;
    data['ISBN'] = this.isbn;
    data['font_color'] = this.fontColor;
    data['ONLINE_PRESENCIAL'] = this.onlinePresencial;
    return data;
  }
}
