class WSConstantes {

  static const String URLBASE = "http://localhost:8080/";
  static const String URL = "https://hubbrasil.tec.br/";
  static const String URL_VIACEP = "https://viacep.com.br/ws/";
  static const String URL_AVATAR_USER = URL + "usuarios/atualizar_avatar";
  static const String URL_AVATAR = URL + "uploads/avatar/";
  static const String URL_ORCAMENTO = URL + "uploads/avatar/";
  static const String URL_PRODUTOS = URL + "uploads/produtos/";
  static const String URL_CHAT = URL + "uploads/chat/";
  static const String URL_AD = URL + "uploads/anuncios/";
  static const String URL_BANNER = URL + "uploads/banners/";
  static const String URL_CHAT_IMAGE = URL + "uploads/chat/imagens/";
  static const String URL_CHAT_AUDIO = URL + "uploads/chat/audios/";


  static const String FCM_TYPE_ANDROID = "1";
  static const String FCM_TYPE_IOS = "2";
  static const String TOKEN = "biblia";
  //:::Requests::://
  static const String LOGIN = "usuarios/login";
  static const String VERSOS_ALEATORIO = "verse_of_the_day";
  static const String DOIS_FATORES = "usuarios/doisFatores";
  static const String CNPJ_DETAIL = "usuarios/listCnpj/";
  static const String REGISTRER = "usuarios/cadastroapp";
  static const String REGISTREREMPRESA = "usuarios/cadastroEmpresa";
  static const String LIST_CATEGORY = "dashboard/listCategorias/";
  static const String LIST_BOOKS_BY_CATEOGRY = "books_by_category";
  static const String PESQUISAR_BOOKS = "pesquisar";
  static const String LIST_CAPITULOS = "capitulos";
  static const String LIST_BOOKS = "books";
  static const String LIST_CATEGORY_COTACAO = "cotacoes/listCategorias";
  static const String LIST_DETAIL_PEDIDO = "cotacoes/detalhesPedido";
  static const String LIST_DETAIL_ORCAMENTO = "cotacoes/detalhesOrcamento";
  static const String REJEITAR_ORCAMENTO = "cotacoes/rejeitarOrcamento";
  static const String REJEITAR_PEDIDO = "cotacoes/rejeitarPedido";
  static const String BATER_MARTELO = "cotacoes/baterMartelo";
  static const String LIST_DETAIL_COMPRA = "cotacoes/detalhesCompra";
  static const String LIST_ORCAMENTO = "cotacoes/listOrcamentos";
  static const String LIST_CITY = "dashboard/buscarCidades/";
  static const String LIST_SEXO = "usuarios/listGeneros/";
  static const String LIST_CONFIG = "usuarios/listConfig/";
  static const String LIST_SEGMENTO = "usuarios/listSegmentos/";
  static const String PRICE_TURBINAR = "usuarios/valorTurbinar/";
  static const String LIST_FORNECEDORES = "produtos/listAllFornecedores/";
  static const String SAVE_FORNECEDORES = "produtos/saveFornecedores/";
  static const String SAVE_FABRICANTE = "produtos/saveFabricantes/";
  static const String SAVE_SERVICE = "servicos/save/";
  static const String SAVE_PACOTE = "pacotes/save/";
  static const String SAVE_AGENDA = "agenda/save/";
  static const String SAVE_PROFISSIONAL = "profissionais/save/";
  static const String SAVE_PRODUTO = "produtos/save/";
  static const String SAVE_DESPESAS = "despesas/save/";
  static const String EDITAR_DESPESAS = "despesas/editar/";
  static const String PAGO_STATUS = "despesas/changeStatus/";
  static const String SAVE_META = "despesas/metaMensal/";
  static const String SAVE_META_PROFISSIONAL = "usuarios/updateConfigProfissional/";
  static const String SAVE_RECEITAS = "despesas/saveReceita/";
  static const String UPDATE_RECEITAS = "despesas/editarReceita/";
  static const String SAVE_CATEGORY_PRODUTO = "produtos/saveCategs/";
  static const String SAVE_TIPO_PAYMENT = "despesas/savePagamentos/";
  static const String SAVE_CATEGORY_SERVICE = "servicos/saveCategs/";
  static const String SAVE_CATEGORY_PACOTE = "pacotes/saveCategs/";
  static const String SAVE_MENSALISTA = "mensalistas/save/";
  static const String SAVE_VINCULAR = "mensalistas/vincularCliente/";
  static const String UPDATE_MENSALISTA = "mensalistas/editar/";
  static const String SAVE_CLIENT = "clientes/save/";
  static const String UPDATE_FORNECEDORES = "produtos/editarFornecedores/";
  static const String UPDATE_FABRICANTE = "produtos/editarFabricantes/";
  static const String UPDATE_SERVICE = "servicos/editar/";
  static const String UPDATE_CONFIG = "usuarios/updateConfig/";
  static const String UPDATE_PACOTE = "pacotes/editar/";
  static const String UPDATE_PROFISSIONAL = "profissionais/editar/";
  static const String UPDATE_PRODUTO = "produtos/editar/";
  static const String UPDATE_CATEGORY_PRODUTO = "produtos/editarCategs/";
  static const String UPDATE_TIPO_PAYMENT = "despesas/editarPagamentos/";
  static const String UPDATE_CATEGORY_SERVICE = "servicos/editarCategs/";
  static const String UPDATE_CATEGORY_PACOTE = "pacotes/editarCategs/";
  static const String UPDATE_CLIENT = "clientes/editar/";
  static const String DELETAR_FORNECEDORES = "produtos/excluirFornecedores/";
  static const String DELETAR_FABRICANTES = "produtos/excluirFabricantes/";
  static const String DELETAR_SERVICE = "servicos/excluir/";
  static const String DELETAR_PACOTE = "pacotes/excluirPacotes/";
  static const String CHANGE_STATUS = "horarios/changeStatus";
  static const String SAVE_HORARIO = "horarios/savehorarios";
  static const String UPDATE_HORARIO = "horarios/updatehorarios";
  static const String DELETAR_HORARIO = "horarios/deleteHorario";
  static const String DELETAR_PROFISSIONAIS = "profissionais/excluir/";
  static const String TROCA_STATUS_AGENDA = "agenda/changeStatus/";
  static const String DELETAR_RECEITA_DESPESA = "despesas/deletar/";
  static const String DELETAR_PRODUTO = "produtos/excluirProduto/";
  static const String DELETAR_ADREESS = "usuarios/deleteEndereco/";
  static const String FAVORITAR_ADREESS = "usuarios/favoritarEndereco/";
  static const String DELETAR_CATEGORY_PRODUTO = "produtos/excluirCategs/";
  static const String DELETAR_TIPO_PAYMENT = "despesas/excluirPagamentos/";
  static const String DELETAR_CATEGORY_SERVICE = "servicos/excluirCategs/";
  static const String DELETAR_CATEGORY_PACOTE = "pacotes/excluirCategs/";
  static const String DELETAR_MENSALIDADE = "mensalistas/excluir/";
  static const String DESVINCULAR_CLIENTE = "mensalistas/desvincularCliente/";
  static const String DELETAR_CLIENT = "clientes/excluir/";
  static const String LIST_FABRICANTES = "produtos/listAllFabricantes/";
  static const String LIST_PACOTE = "pacotes/listAll/";
  static const String LIST_DIA = "horarios/listDias";
  static const String LIST_HORARIO = "horarios/listhorarios";
  static const String LIST_AGENDA = "agenda/listAll/";
  static const String LIST_PROFISSIONAIS = "profissionais/listAll/";
  static const String LIST_RECEITA_ID = "despesas/listId/";
  static const String LIST_PROFISSIONAIS_ID = "profissionais/listId/";
  static const String LIST_SERVICE = "servicos/listAll/";
  static const String LIST_MESNALISTA_ID = "mensalistas/listId/";
  static const String LIST_PRODUCT = "produtos/listAll/";
  static const String LIST_CLIENT = "clientes/listAll/";
  static const String LIST_RESUMO = "despesas/listResumo/";
  static const String LIST_RESUMO_PROFISSIONAL = "profissionais/listResumo/";
  static const String LIST_DESPESA_RECEITA = "despesas/listAll/";
  static const String LIST_TAG = "despesas/listTags/";
  static const String LIST_CATEGORY_ANUNCIO_T = "anuncios/listCategorias/";
  static const String LIST_CATEGORY_SERVICO= "servicos/listAllcategs/";
  static const String LIST_CATEGORY_PRODUTO= "produtos/listAllcategs/";
  static const String LIST_TIPO_PAGAMENTO= "despesas/listPagamentos/";
  static const String LIST_CATEGORY_SERVICE= "servicos/listAllcategs/";
  static const String LIST_CATEGORY_PACOTE= "pacotes/listAllcategs/";

  static const String LIST_CATEGORY_SHOP= "produtos/listCategShop";
  static const String LIST_SUB_CATEGORY_SHOP= "produtos/listSubcategShop";
  static const String ADD_FAVORITO = "favoritos/add_favoritos";
  static const String LIST_ADREESS = "usuarios/listAllEnderecos/";
  static const String LIST_PLAN = "usuarios/listPlanos/";
  static const String LIST_PLAN_HISTORIC = "usuarios/planosHistorico";
  static const String LIST_INDICACAO = "usuarios/minhasIndicacoes/";
  static const String SAQUE = "usuarios/pedirSaque/";
  static const String FIND_ADREESS = "usuarios/findEndereco/";
  static const String DELETER_ITEM_CART = "carrinho/delete_item_carrinho";
  static const String FRETE = "frete/calcular_frete";
  static const String DELETAR_FAVORITO = "favoritos/delete_favoritos";
  static const String LIST_PRODUTO_DESTAQUE_SHOP= "produtos/listDestaque";
  static const String LIST_ITENS_CARRINHO = "carrinho/itenscarrinho";
  static const String CART_OPEN = "carrinho/carrinho_aberto";
  static const String CART_ADD_ITEM = "carrinho/add_item_carrinho";
  static const String LIST_PRODUTO_FAVORITO= "favoritos/list_favoritos";
  static const String LIST_PEDIDO = "pedidos/listAll";
  static const String LIST_PRODUTO_ALL_SHOP= "produtos/listAllShop";
  static const String LIST_MENSALISTA= "mensalistas/listAll/";
  static const String LIST_MENSALISTA_CARD= "mensalistas/cardsResumo/";
  static const String LIST_MENSALISTA_CLIENT = "mensalistas/listMensalistas/";
  static const String LIST_HISTORY_CLIENT = "mensalistas/historicoCliente/";
  static const String LIST_SUGEST = "mensalistas/sugestaoMensalista/";
  static const String LIST_SUB_CATEGORY = "anuncios/listSubCategorias/";
  static const String LIST_SUB_CATEGORY_ANUNCIO = "anuncios/listSubCategoriasAdd/";
  static const String LIST_BANNER = "anuncios/listBanners/";
  static const String LIST_CONSERVACAO = "anuncios/listConservacao/";
  static const String LIST_CONSERVACAO_ANUNCIO = "anuncios/listConservacaoAdd/";
  static const String LIST_ENTREGA = "anuncios/listEntrega/";
  static const String LIST_ENTREGA_ANUNCIO = "anuncios/listEntregaAdd/";
  static const String LIST_ENTREGA_FAVORITE = "anuncios/listEnderecoFavorito/";
  static const String SAVE_ADRESS = "usuarios/saveendereco/";
  static const String SAVE_COTACAO = "dashboard/iniciarCotacao";
  static const String UPDATE_STATUS_AD = "anuncios/editarStatusAnuncio/";
  static const String DELETE_AD = "anuncios/deletarAnuncio/";
  static const String SEARCH_CITY = "anuncios/buscarCidades/";
  static const String SEARCH = "pesquisa";
  static const String SAVE_PHOTO_AD = "anuncios/saveFotosAnuncio/";
  static const String UPDATE_PHOTO_AD = "anuncios/updateFotosAnuncio/";
  static const String SAVE_AD = "anuncios/saveAnuncio/";
  static const String SAVE_PIX = "usuarios/savePix/";
  static const String UPDATE_AD = "anuncios/editarAnuncio/";
  static const String SEND_ORCAMENTO = "cotacoes/enviarOrcamento/";
  static const String UPDATE_ADRESS = "usuarios/updateEndereco/";
  static const String UPDATE_LOCATION = "usuarios/updateLocation/";
  static const String LIST_REDES = "usuarios/listRedesSociais/";
  static const String PERFIL_USER = "usuarios/perfil/";
  static const String REGRAS_SAQUE = "usuarios/saqueRegras/";
  static const String LIST_SALDO = "usuarios/listSaldo/";
  static const String UPDATE_USER = "usuarios/updateUser";
  static const String UPDATE_TIMER = "usuarios/updateTempoResposta";
  static const String SAVE_PAYMENT = "usuarios/saveTipoPagamento";
  static const String DELETAR_PAYMENT = "usuarios/retirarTipoPagamento";
  static const String UPDATE_PASSWORD = "usuarios/updatepassword/";
  static const String UPDATE_CATEGORY = "usuarios/updateInteresses";
  static const String RECOVERRY_PASSWORD = "usuarios/recuperarsenha/";
  static const String SAVE_FCM = "usuarios/savefcm";
  static const String STATISTICS = "cruzadas/estatisticas";
  static const String LISTNIVEIS = "cruzadas/listNiveis";
  static const String NOTIFICATION = "usuarios/notificacoes/";
  static const String LIST_AD = "anuncios/listAnunciosFiltro";
  static const String LIST_DASHBOARD = "dashboard/listDashboard";
  static const String LIST_LIVROS = "books";
  static const String LIST_FINANCEIRO = "cotacoes/listFinanceiro";
  static const String LIST_COTACAO = "cotacoes/listCotacoes";
  static const String LIST_AD_NEXT = "anuncios/listAnunciosProximos/";
  static const String LIST_WORDS = "anuncios/buscarPalavra";
  static const String ZERA_CRUZADA = "cruzadas/zerar";
  static const String CONCLUDE_CRUZADA = "cruzadas/concluir";
  static const String DESATIVE_ACCOUNT = "usuarios/desativarconta";
  static const String LIST_FAVORITE = "favoritos/listFavoritos/";
  static const String LIST_PAYMENT = "pagamentos/listar";
  static const String ADD_FAVORITE = "favoritos/addFavorito/";
  static const String ANUNCIO_DETAIL = "anuncios/anuncioDetalhes/";
  static const String DELETE_FAVORITE = "favoritos/deleteFavoritos/";
  static const String LIST_CHAT = "chat/listchat";
  static const String LIST_CHAT_CONVERSA = "chat/listchatID/";
  static const String UPDATE_CHAT = "chat/updatechat/";
  static const String SAVE_CHAT = "chat/savechat/";
  static const String N_LIDA = "chat/mensagemNLida";
  static const String LIST_ENTREGAS = "entregas/listEntregas";
  static const String LIST_INTERESS = "entregas/listInteressados";
  static const String CONFIRM_DELIVERY = "entregas/confirmarEntrega";
  static const String DELETE_PHOTO = "anuncios/deletarFotos/";
  static const String AVALIAR_RECEBIMENTO = "relatorios/avaliarRecebimento";
  static const String RELATAR_PROBLEM = "relatorios/relatarProblemas";
  static const String LIST_MOTIVATION = "entregas/motivos";
  static const String STATUS_AVALIAR = "relatorios/listAvaliacaoPendente";
  static const String OPEN_AD = "relatorios/entrouNoAnuncio";
  static const String REMOVER_INTERSS = "entregas/retirarInteresse";



  //:::PLAN::://
  static const String PLAN_USER = "usuarios/planoUser/";
  static const String REMOVE_PLAN = "pagamentos/removerPlano";

  //:::TURBINAR::://
  static const String VALUE_TURBINADO = "usuarios/valorTurbinado/";
  static const String PAYMENT = "pagamentos/adicionar";
  static const String PAYMENT_CARD_TOKEN = "pagamentos/criarTokenCartao";
  static const String PAYMENT_CARD_TOKEN_ASS = "pagamentos/criarTokenCartaoAssinatura";
  static const String LIMPAR_CARRINHO = "carrinho/limparCarrinho";

  //:::Body::://
  static const String EMAIL = "email";
  static const String PASSWORD = "password";
  static const String PALAVRA_CHAVE = "palavra_chave";
  static const String PALAVRA = "palavra";
  static const String PHONE = "celular";
  static const String WHATSAPP = "whatsapp";
  static const String PHONE_EMPRESA = "celular_estabelecimento";
  static const String NAME = "nome";
  static const String NAME_RESPONSAVEL = "nome_responsavel";
  static const String FIXA = "fixa";
  static const String REPETIR = "repetir";
  static const String VENDA_AVULSO = "venda_avulsa";
  static const String PRE_VENDA = "pre_venda";
  static const String QTD = "qtd";
  static const String ITENS = "itens";
  static const String MARCA = "marca";
  static const String DESTINADO = "destinado";
  static const String CODIGO = "codigo";
  static const String ESTOQUE_I = "estoque_inicial";
  static const String ESTOQUE_M = "estoque_minimo";
  static const String CUSTO = "custo";
  static const String VALOR = "valor";
  static const String VALORUNI = "valor_uni";
  static const String VIGENCIA = "vigencia";
  static const String RECORRENCIA = "recorrencia";
  static const String META = "meta";
  static const String N_PEDIDO = "n_pedido";
  static const String META_MENSAL = "meta_mensal";
  static const String NAME_FANTASIA = "nome_fantasia";
  static const String DATE_INAGURACAO = "data_inauguracao";
  static const String DATE_IN = "data_inicio";
  static const String DATE_IN_COTACAO = "data_in";
  static const String DATE_OUT = "data_fim";
  static const String DATE_OUT_COTACAO = "data_out";
  static const String DATE = "data";
  static const String DATE_ENG = "date";
  static const String RECEITA_DESPESA = "receita_despesa";
  static const String HOUR = "hora";
  static const String HOUR_IN = "horario_in";
  static const String HOUR_OUT = "horario_out";
  static const String FORMACAO_ACADEMICA = "formacao_academica";
  static const String FUNCAO = "funcao";
  static const String POSSUI_AGENDA = "possui_agenda";
  static const String COMMENT = "comentario";
  static const String ACESSO = "acesso";
  static const String SEGMENTO = "segmento";
  static const String CUPOM = "cupom";
  static const String GENERO = "genero";
  static const String SEXO = "sexo";
  static const String BIRTH = "data_nascimento";
  static const String INCRICAO_ESTADUAL = "ie";
  static const String ID_USER = "id_user";
  static const String ID_EMPRESA = "id_empresa";
  static const String ID_ADREESS = "id_endereco";
  static const String METODO_PAYMENT = "metodo_pagamento";
  static const String TAG = "tag";
  static const String ID_FORNECEDOR = "id_fornecedor";
  static const String ID_PRODUCTOR = "id_produto";
  static const String valor_uni = "valor_uni";
  static const String ID_CART = "id_carrinho";
  static const String ID_PACOTE = "id_pacote";
  static const String ID_PROFISSIONAL = "id_profissional";
  static const String ID_PEDIDO = "id_pedido";
  static const String ID_FABRICANTE = "id_fabricante";
  static const String ID_SERVICE = "id_servico";
  static const String ID_CLIENT = "id_cliente";
  static const String USER_ID = "user_id";
  static const String TYPE = "type";
  static const String TIPO = "tipo";
  static const String REGIST_ID = "registration_id";
  static const String ID = "id";
  static const String ID_CATEGORYY = "id_category";
  static const String ID_BOOK = "id_book";
  static const String ID_DAY = "id_day";
  static const String ID_HORARIO = "id_horario";
  static const String ID_DE = "id_de";
  static const String ID_PARA = "id_para";
  static const String ID_MOTIVACAO = "id_motivo";
  static const String ID_USERS = "id_usuario";
  static const String TYPER_CHAVE = "tipo_chave";
  static const String CHAVE = "chave";
  static const String CATEGORY_ID = "id_categoria";
  static const String PEDIDO = "pedido";
  static const String CATEGORY = "categoria";
  static const String CATEGORYS = "categories";
  static const String ENTREGA = "entrega";
  static const String PRIVACIDADE = "privacidade";
  static const String SUBCATEGORY = "subcategoria";
  static const String CONSERVACAO = "conservacao";
  static const String VALUE_MIN = "valor_min";
  static const String VALUE_MAX = "valor_max";
  static const String CODE_USER = "codigo_user";
  static const String CODE_IND = "cod_indicador";
  static const String CODE = "codigo";
  static const String ID_NIVEL = "id_nivel";
  static const String AD_ID = "anuncio_id";
  static const String ID_AD = "id_anuncio";
  static const String ID_PHOTO = "id_foto";
  static const String LATITUDE = "latitude";
  static const String LONGITUDE = "longitude";
  static const String INTERESSES = "interesses";
  static const String INTERVALO = "intervalo";
  static const String SUGERIR_MENSALIDADE = "sugerir_mensalista";
  static const String CITY = "cidade";
  static const String ORDENAR = "ordenar";
  static const String TIMER_RESPOSTA = "tempo_resposta";
  static const String ADRESS = "endereco";
  static const String APELIDO = "apelido";
  static const String BAIRRO = "bairro";
  static const String NUMERO = "numero";
  static const String COMPLEMENTO = "complemento";
  static const String STATES = "estado";
  static const String CEP = "cep";
  static const String DESCRIPTION = "descricao";
  static const String SERVICES = "servicos";
  static const String PARCELAS = "parcelas";
  static const String PRODUCTOS = "produtos";
  static const String DURATION = "duracao";
  static const String VALOR_CLIENTE = "valor_cliente";
  static const String VALOR_FRETE = "valor_frete";
  static const String VALOR_TOTAL = "valor_total";
  static const String VALOR_PROFISSIONAL = "valor_profissional";
  static const String COMISSAO = "comissao";
  static const String COMISSAO_EXTRA = "comissao_extra";
  static const String CARGA_HORARIA = "carga_horaria";
  static const String MES = "mes";
  static const String TOKENID = "token";
  static const String STATUS = "status";
  static const String STAR = "estrelas";
  static const String DISTANCIA_IN = "distancia_in";
  static const String DISTANCIA_OUT = "distancia_out";
  static const String DOCUMENT = "documento";
  static const String BANCO = "banco";
  static const String AGENCIA = "agencia";
  static const String CONTA = "conta";
  static const String VISUALIZACAO = "visualizacao";
  static const String RAZAO_SOCIAL = "razao_social";
  static const String OBS = "obs";



 //:: Pagamentos :://
  static const String ID_PLAN_AD = "id_plano_anuncio";
  static const String ID_PLAN = "id_plano";
  static const String CPF = "cpf";
  static const String PERMITIR_CONTATO = "permitir_contato";
  static const String PAYMENT_ID = "payment_id";
  static const String TYPER_PAYMENT = "tipo_pagamento";
  static const String CARD = "card";
  static const String CNPJ = "cnpj";
  static const String CARD_NUMBER = "card_number";
  static const String EXPIRATION_MONTH = "expiration_month";
  static const String EXPIRATION_YEAR = "expiration_year";
  static const String SECURITY_CODE = "security_code";
  static const String STATUS_ORDEN = "status_order";
  static const String ID_ORDER = "id_order";
  static const String ID_ORCAMENTO = "id_orcamento";

  //:::Validações::://
  static const String MSG_NOME_INVALIDO = 'Preencha o campo Nome';
  static const String MSG_CPF_INVALIDO = 'Preencha o campo CPF';
  static const String MSG_EMAIL_EMPTY = 'Preencha o campo E-mail';
  static const String MSG_NAME_ESTABELECIMENTO_EMPTY = 'Preencha o campo Nome do Estabelecimento';
  static const String MSG_DATA_INAUGURACAO_EMPTY = 'Preencha o campo Data da Inauguração';
  static const String MSG_TELEFONE_ESTABELECIMENTO_EMPTY = 'Preencha o campo Telefone';
  static const String MSG_APELIDO_EMPTY = 'Preencha o campo Apelido';
  static const String MSG_BRITH_EMPTY = 'Preencha o campo Data nascimento';
  static const String MSG_USUARIO_EMPTY = 'Preencha o campo Usuário';
  static const String MSG_EMAIL_INVALIDO = 'Email inválido, tente novamente';
  static const String MSG_ORGAN_INVALIDO = 'Selecione o Orgão';
  static const String MSG_PASSWORD_INVALIDO = 'Senha inválida, tente novamente';
  static const String MSG_PASSWORD_EMPTY = 'Preencha o campo Senha';
  static const String MSG_PHONE_INVALIDO = 'Celular inválido, tente novamente';
  static const String MSG_PHONE_EMPTY = 'Preencha o campo Whatsapp';
  static const String MSG_CO_PASSWORD_INVALIDO = 'As senhas fornecidas não são idênticas, por favor, verifique-as e tente novamente';
  static const String MSG_CO_PASSWORD_EMPTY = 'Preencha o campo Confirmar Senha';


  static const String MSG_CATEGORIA_EMPTY = 'Selecione uma categoria';
  static const String MSG_STATUS_EMPTY = 'Selecione um status';
  static const String MSG_SEGMENTO_EMPTY = 'Selecione um Segmento';
  static const String MSG_SEXO_EMPTY = 'Selecione o sexo';
  static const String MSG_MOTIVO_EMPTY = 'Selecione um motivo para seu problema';
  static const String MSG_SUBCATEGORIA_EMPTY = 'Selecione uma Subcategoria';
  static const String MSG_TITLE = 'Preencha o campo titulo';
  static const String MSG_DESCRIPTION = 'Preencha o campo descrição';
  static const String MSG_CONSERVACAO_EMPTY = 'Selecione o estado de conservação';


  static const String MSG_CEP_EMPTY = 'Preencha o campo CEP';
  static const String MSG_RUA_EMPTY = 'Preencha o campo Logradouro';
  static const String MSG_NUMERO_EMPTY = 'Preencha o campo Número';
  static const String MSG_BAIRRO_EMPTY = 'Preencha o campo Bairro';
  static const String MSG_CIDADE_EMPTY = 'Preencha o campo Cidade';
  static const String MSG_ESTADO_EMPTY = 'Preencha o campo Estado';
  static const String MSG_TIPO_ENTREGA_EMPTY = 'Selecione o tipo de entrega';
  static const String MSG_INTERESS = 'Selecione um interessado';

  //:::INICIA FIREBASE NO IOS::://
  static const String API_KEY = 'AIzaSyC29OHcYG-evZDs1_POKS7yjI_eZlWCsDk';
  static const String APP_ID = '1:85702348718:android:b34cc14ebc3330a05d823f';
  static const String MESSGING_SENDER_ID = '85702348718';
  static const String PROJECT_ID = 'cruzadista-eb3ab';

}