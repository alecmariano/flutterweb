class NivelModel {
  String sId;
  String idnivel;
  String idcurso;
  String permitematriculaautomatica;
  String iniciante;
  String descricao;
  String labelcolor;
  String valor;
  String status;
  String nivel;
  String livro;
  String livroedicao;
  String livroeditora;
  String proximonivel;
  String idadeinicial;
  String idadefinal;
  String idadeindicativa;
  String ordem;
  String datanascimentoinicial;
  String datanascimentofinal;
  String idlabelnotas;
  String nivelequivalente;
  String cargahoraria;
  String geracertificado;
  String nivelequivalente2;
  String nivelequivalente3;
  String nivelequivalente4;
  String ano;
  String semestre;
  String idlabelnotas2;
  String rangeidadeinicial;
  String rangeidadefinal;
  String reprovapornota;
  String reprovaporfalta;
  String datainc;
  String dataalt;
  String usuarioinc;
  String usuarioalt;
  String isbn;
  String fontcolor;
  String onlinepresencial;

  NivelModel(
      {this.sId,
      this.idnivel,
      this.idcurso,
      this.permitematriculaautomatica,
      this.iniciante,
      this.descricao,
      this.labelcolor,
      this.valor,
      this.status,
      this.nivel,
      this.livro,
      this.livroedicao,
      this.livroeditora,
      this.proximonivel,
      this.idadeinicial,
      this.idadefinal,
      this.idadeindicativa,
      this.ordem,
      this.datanascimentoinicial,
      this.datanascimentofinal,
      this.idlabelnotas,
      this.nivelequivalente,
      this.cargahoraria,
      this.geracertificado,
      this.nivelequivalente2,
      this.nivelequivalente3,
      this.nivelequivalente4,
      this.ano,
      this.semestre,
      this.idlabelnotas2,
      this.rangeidadeinicial,
      this.rangeidadefinal,
      this.reprovapornota,
      this.reprovaporfalta,
      this.datainc,
      this.dataalt,
      this.usuarioinc,
      this.usuarioalt,
      this.isbn,
      this.fontcolor,
      this.onlinepresencial});

  NivelModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    idnivel = json['idnivel'];
    idcurso = json['idcurso'];
    permitematriculaautomatica = json['permitematriculaautomatica'];
    iniciante = json['iniciante'];
    descricao = json['descricao'];
    labelcolor = json['labelcolor'];
    valor = json['valor'];
    status = json['status'];
    nivel = json['nivel'];
    livro = json['livro'];
    livroedicao = json['livroedicao'];
    livroeditora = json['livroeditora'];
    proximonivel = json['proximonivel'];
    idadeinicial = json['idadeinicial'];
    idadefinal = json['idadefinal'];
    idadeindicativa = json['idadeindicativa'];
    ordem = json['ordem'];
    datanascimentoinicial = json['datanascimentoinicial'];
    datanascimentofinal = json['datanascimentofinal'];
    idlabelnotas = json['idlabelnotas'];
    nivelequivalente = json['nivelequivalente'];
    cargahoraria = json['cargahoraria'];
    geracertificado = json['geracertificado'];
    nivelequivalente2 = json['nivelequivalente2'];
    nivelequivalente3 = json['nivelequivalente3'];
    nivelequivalente4 = json['nivelequivalente4'];
    ano = json['ano'];
    semestre = json['semestre'];
    idlabelnotas2 = json['idlabelnotas2'];
    rangeidadeinicial = json['rangeidadeinicial'];
    rangeidadefinal = json['rangeidadefinal'];
    reprovapornota = json['reprovapornota'];
    reprovaporfalta = json['reprovaporfalta'];
    datainc = json['datainc'];
    dataalt = json['dataalt'];
    usuarioinc = json['usuarioinc'];
    usuarioalt = json['usuarioalt'];
    isbn = json['isbn'];
    fontcolor = json['fontcolor'];
    onlinepresencial = json['onlinepresencial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['idnivel'] = this.idnivel;
    data['idcurso'] = this.idcurso;
    data['permitematriculaautomatica'] = this.permitematriculaautomatica;
    data['iniciante'] = this.iniciante;
    data['descricao'] = this.descricao;
    data['labelcolor'] = this.labelcolor;
    data['valor'] = this.valor;
    data['status'] = this.status;
    data['nivel'] = this.nivel;
    data['livro'] = this.livro;
    data['livroedicao'] = this.livroedicao;
    data['livroeditora'] = this.livroeditora;
    data['proximonivel'] = this.proximonivel;
    data['idadeinicial'] = this.idadeinicial;
    data['idadefinal'] = this.idadefinal;
    data['idadeindicativa'] = this.idadeindicativa;
    data['ordem'] = this.ordem;
    data['datanascimentoinicial'] = this.datanascimentoinicial;
    data['datanascimentofinal'] = this.datanascimentofinal;
    data['idlabelnotas'] = this.idlabelnotas;
    data['nivelequivalente'] = this.nivelequivalente;
    data['cargahoraria'] = this.cargahoraria;
    data['geracertificado'] = this.geracertificado;
    data['nivelequivalente2'] = this.nivelequivalente2;
    data['nivelequivalente3'] = this.nivelequivalente3;
    data['nivelequivalente4'] = this.nivelequivalente4;
    data['ano'] = this.ano;
    data['semestre'] = this.semestre;
    data['idlabelnotas2'] = this.idlabelnotas2;
    data['rangeidadeinicial'] = this.rangeidadeinicial;
    data['rangeidadefinal'] = this.rangeidadefinal;
    data['reprovapornota'] = this.reprovapornota;
    data['reprovaporfalta'] = this.reprovaporfalta;
    data['datainc'] = this.datainc;
    data['dataalt'] = this.dataalt;
    data['usuarioinc'] = this.usuarioinc;
    data['usuarioalt'] = this.usuarioalt;
    data['isbn'] = this.isbn;
    data['fontcolor'] = this.fontcolor;
    data['onlinepresencial'] = this.onlinepresencial;
    return data;
  }

  Map<String, dynamic> toJsonForInsert() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idcurso'] = this.idcurso;
    data['iniciante'] = this.iniciante;
    data['descricao'] = this.descricao;
    data['labelcolor'] = this.labelcolor;
    data['status'] = this.status;
    data['nivel'] = this.nivel;
    data['livro'] = this.livro;
    data['livroedicao'] = this.livroedicao;
    data['livroeditora'] = this.livroeditora;
    data['idadeinicial'] = this.idadeinicial;
    data['idadefinal'] = this.idadefinal;
    data['idadeindicativa'] = this.idadeindicativa;
    data['ordem'] = this.ordem;
    data['cargahoraria'] = this.cargahoraria;
    data['geracertificado'] = this.geracertificado;
    data['reprovapornota'] = this.reprovapornota;
    data['reprovaporfalta'] = this.reprovaporfalta;
    data['isbn'] = this.isbn;
    data['fontcolor'] = this.fontcolor;
    data['onlinepresencial'] = this.onlinepresencial;
    return data;
  }
}
