class CourseModel {
  String sId;
  String idcurso;
  String descricao;
  String ordemrelatorio;
  String tipocurso;
  String idtipocurso;
  String grupofiltro;
  String valorcurso;
  String valorcursounidade2;
  String ordemaprendizado;
  String qtdeparcelas;
  String nivelcertificado;
  String reprovapornota;
  String reprovaporfalta;
  String lancanotaoral;
  String lancanotaescrita;
  String paginamapa;
  String idcondicaopagamento;
  String dataalt;
  String horaalt;
  String datainc;
  String horainc;
  String usuarioalt;
  String usuarioinc;
  String cursosemestral;
  String contratowebmostra;
  String contratowebnumeroniveis;
  String contratowebduracao;
  String contratowebordemlista;
  String idrubricafolha;
  String ativo;

  CourseModel(
      {this.sId,
      this.idcurso,
      this.descricao,
      this.ordemrelatorio,
      this.tipocurso,
      this.idtipocurso,
      this.grupofiltro,
      this.valorcurso,
      this.valorcursounidade2,
      this.ordemaprendizado,
      this.qtdeparcelas,
      this.nivelcertificado,
      this.reprovapornota,
      this.reprovaporfalta,
      this.lancanotaoral,
      this.lancanotaescrita,
      this.paginamapa,
      this.idcondicaopagamento,
      this.dataalt,
      this.horaalt,
      this.datainc,
      this.horainc,
      this.usuarioalt,
      this.usuarioinc,
      this.cursosemestral,
      this.contratowebmostra,
      this.contratowebnumeroniveis,
      this.contratowebduracao,
      this.contratowebordemlista,
      this.idrubricafolha,
      this.ativo});

  CourseModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    idcurso = json['idcurso'];
    descricao = json['descricao'];
    ordemrelatorio = json['ordemrelatorio'];
    tipocurso = json['tipocurso'];
    idtipocurso = json['idtipocurso'];
    grupofiltro = json['grupofiltro'];
    valorcurso = json['valorcurso'];
    valorcursounidade2 = json['valorcursounidade2'];
    ordemaprendizado = json['ordemaprendizado'];
    qtdeparcelas = json['qtdeparcelas'];
    nivelcertificado = json['nivelcertificado'];
    reprovapornota = json['reprovapornota'];
    reprovaporfalta = json['reprovaporfalta'];
    lancanotaoral = json['lancanotaoral'];
    lancanotaescrita = json['lancanotaescrita'];
    paginamapa = json['paginamapa'];
    idcondicaopagamento = json['idcondicaopagamento'];
    dataalt = json['dataalt'];
    horaalt = json['horaalt'];
    datainc = json['datainc'];
    horainc = json['horainc'];
    usuarioalt = json['usuarioalt'];
    usuarioinc = json['usuarioinc'];
    cursosemestral = json['cursosemestral'];
    contratowebmostra = json['contratowebmostra'];
    contratowebnumeroniveis = json['contratowebnumeroniveis'];
    contratowebduracao = json['contratowebduracao'];
    contratowebordemlista = json['contratowebordemlista'];
    idrubricafolha = json['idrubricafolha'];
    ativo = json['ativo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['idcurso'] = this.idcurso;
    data['descricao'] = this.descricao;
    data['ordemrelatorio'] = this.ordemrelatorio;
    data['tipocurso'] = this.tipocurso;
    data['idtipocurso'] = this.idtipocurso;
    data['grupofiltro'] = this.grupofiltro;
    data['valorcurso'] = this.valorcurso;
    data['valorcursounidade2'] = this.valorcursounidade2;
    data['ordemaprendizado'] = this.ordemaprendizado;
    data['qtdeparcelas'] = this.qtdeparcelas;
    data['nivelcertificado'] = this.nivelcertificado;
    data['reprovapornota'] = this.reprovapornota;
    data['reprovaporfalta'] = this.reprovaporfalta;
    data['lancanotaoral'] = this.lancanotaoral;
    data['lancanotaescrita'] = this.lancanotaescrita;
    data['paginamapa'] = this.paginamapa;
    data['idcondicaopagamento'] = this.idcondicaopagamento;
    data['dataalt'] = this.dataalt;
    data['horaalt'] = this.horaalt;
    data['datainc'] = this.datainc;
    data['horainc'] = this.horainc;
    data['usuarioalt'] = this.usuarioalt;
    data['usuarioinc'] = this.usuarioinc;
    data['cursosemestral'] = this.cursosemestral;
    data['contratowebmostra'] = this.contratowebmostra;
    data['contratowebnumeroniveis'] = this.contratowebnumeroniveis;
    data['contratowebduracao'] = this.contratowebduracao;
    data['contratowebordemlista'] = this.contratowebordemlista;
    data['idrubricafolha'] = this.idrubricafolha;
    data['ativo'] = this.ativo;
    return data;
  }
}
