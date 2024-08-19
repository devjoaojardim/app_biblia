class UserModelFull {
  int? id;
  int? tipo;
  String? tempoResposta;
  String? documento;
  String? nome;
  String? nomeFantasia;
  String? email;
  String? celular;
  String? avatar;
  List<Endereco>? endereco;
  List<TiposPagamentos>? tiposPagamentos;
  String? dataCadastro;
  String? uLogin;

  UserModelFull(
      {this.id,
        this.tipo,
        this.tempoResposta,
        this.documento,
        this.nome,
        this.nomeFantasia,
        this.email,
        this.celular,
        this.avatar,
        this.endereco,
        this.tiposPagamentos,
        this.dataCadastro,
        this.uLogin});

  UserModelFull.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tipo = json['tipo'];
    tempoResposta = json['tempo_resposta'];
    documento = json['documento'];
    nome = json['nome'];
    nomeFantasia = json['nome_fantasia'];
    email = json['email'];
    celular = json['celular'];
    avatar = json['avatar'];
    if (json['endereco'] != null) {
      endereco = <Endereco>[];
      json['endereco'].forEach((v) {
        endereco!.add(new Endereco.fromJson(v));
      });
    }
    if (json['tipos_pagamentos'] != null) {
      tiposPagamentos = <TiposPagamentos>[];
      json['tipos_pagamentos'].forEach((v) {
        tiposPagamentos!.add(new TiposPagamentos.fromJson(v));
      });
    }
    dataCadastro = json['data_cadastro'];
    uLogin = json['u_login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tipo'] = this.tipo;
    data['tempo_resposta'] = this.tempoResposta;
    data['documento'] = this.documento;
    data['nome'] = this.nome;
    data['nome_fantasia'] = this.nomeFantasia;
    data['email'] = this.email;
    data['celular'] = this.celular;
    data['avatar'] = this.avatar;
    if (this.endereco != null) {
      data['endereco'] = this.endereco!.map((v) => v.toJson()).toList();
    }
    if (this.tiposPagamentos != null) {
      data['tipos_pagamentos'] =
          this.tiposPagamentos!.map((v) => v.toJson()).toList();
    }
    data['data_cadastro'] = this.dataCadastro;
    data['u_login'] = this.uLogin;
    return data;
  }
}

class Endereco {
  int? id;
  Null? nome;
  String? cep;
  String? estado;
  String? cidade;
  String? endereco;
  String? bairro;
  String? latitude;
  String? longitude;
  int? rows;

  Endereco(
      {this.id,
        this.nome,
        this.cep,
        this.estado,
        this.cidade,
        this.endereco,
        this.bairro,
        this.latitude,
        this.longitude,
        this.rows});

  Endereco.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    cep = json['cep'];
    estado = json['estado'];
    cidade = json['cidade'];
    endereco = json['endereco'];
    bairro = json['bairro'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    rows = json['rows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['cep'] = this.cep;
    data['estado'] = this.estado;
    data['cidade'] = this.cidade;
    data['endereco'] = this.endereco;
    data['bairro'] = this.bairro;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['rows'] = this.rows;
    return data;
  }
}

class TiposPagamentos {
  int? tipoPagamento;
  int? parcelas;
  int? rows;

  TiposPagamentos({this.tipoPagamento, this.parcelas, this.rows});

  TiposPagamentos.fromJson(Map<String, dynamic> json) {
    tipoPagamento = json['tipo_pagamento'];
    parcelas = json['parcelas'];
    rows = json['rows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipo_pagamento'] = this.tipoPagamento;
    data['parcelas'] = this.parcelas;
    data['rows'] = this.rows;
    return data;
  }
}