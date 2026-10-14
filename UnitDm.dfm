object Dm: TDm
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=estoque'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 128
    Top = 144
  end
  object tbProdutos: TFDTable
    Active = True
    IndexFieldNames = 'id_produto'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'estoque.produtos'
    Left = 336
    Top = 136
    object tbProdutosid_produto: TFDAutoIncField
      FieldName = 'id_produto'
      Origin = 'id_produto'
      ReadOnly = False
    end
    object tbProdutosnome_produto: TStringField
      FieldName = 'nome_produto'
      Origin = 'nome_produto'
      Required = True
      Size = 50
    end
    object tbProdutosfabricante: TStringField
      FieldName = 'fabricante'
      Origin = 'fabricante'
      Required = True
      Size = 30
    end
    object tbProdutosvalidade_produto: TDateField
      FieldName = 'validade_produto'
      Origin = 'validade_produto'
      Required = True
      EditMask = '##/##/####;1;_'
    end
    object tbProdutosestoque_atual: TIntegerField
      FieldName = 'estoque_atual'
      Origin = 'estoque_atual'
    end
  end
  object dsProdutos: TDataSource
    DataSet = tbProdutos
    Left = 336
    Top = 256
  end
  object dsMovimentacao: TDataSource
    DataSet = tbMovimentacao
    Left = 488
    Top = 256
  end
  object dsMovimentacoesProdutos: TDataSource
    DataSet = tbMovimentacoesProdutos
    Left = 704
    Top = 272
  end
  object tbMovimentacao: TFDTable
    Active = True
    BeforeDelete = tbMovimentacaoBeforeDelete
    AfterScroll = tbMovimentacaoAfterScroll
    IndexFieldNames = 'id_movimentacao'
    DetailFields = 
      'data_hora_movimentacao;id_movimentacao;observacoes;responsavel;t' +
      'ipo_movimentacao'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'estoque.movimentacoes'
    Left = 496
    Top = 136
    object tbMovimentacaoid_movimentacao: TFDAutoIncField
      FieldName = 'id_movimentacao'
      Origin = 'id_movimentacao'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object A: TDateTimeField
      FieldName = 'data_hora_movimentacao'
      Origin = 'data_hora_movimentacao'
      Required = True
    end
    object tbMovimentacaoobservacoes: TMemoField
      FieldName = 'observacoes'
      Origin = 'observacoes'
      Required = True
      BlobType = ftMemo
    end
    object tbMovimentacaoresponsavel: TStringField
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Required = True
      Size = 30
    end
    object tbMovimentacaotipo_movimentacao: TStringField
      FieldName = 'tipo_movimentacao'
      Origin = 'tipo_movimentacao'
      Required = True
    end
  end
  object tbMovimentacoesProdutos: TFDTable
    Active = True
    AfterPost = tbMovimentacoesProdutosAfterPost
    BeforeDelete = tbMovimentacoesProdutosBeforeDelete
    AfterDelete = tbMovimentacoesProdutosAfterDelete
    IndexName = 'idMovimentacao'
    MasterSource = dsMovimentacao
    MasterFields = 'id_movimentacao'
    DetailFields = 'id_movimentacoes_produtos;idMovimentacao;idProduto;qtd_produtos'
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'estoque.movimentacoes_produtos'
    Left = 712
    Top = 136
    object tbMovimentacoesProdutosid_movimentacoes_produtos: TFDAutoIncField
      FieldName = 'id_movimentacoes_produtos'
      Origin = 'id_movimentacoes_produtos'
      ReadOnly = False
    end
    object tbMovimentacoesProdutosidMovimentacao: TIntegerField
      FieldName = 'idMovimentacao'
      Origin = 'idMovimentacao'
      Required = True
    end
    object tbMovimentacoesProdutosidProduto: TIntegerField
      FieldName = 'idProduto'
      Origin = 'idProduto'
      Required = True
    end
    object tbMovimentacoesProdutosqtd_produtos: TIntegerField
      FieldName = 'qtd_produtos'
      Origin = 'qtd_produtos'
      Required = True
    end
    object tbMovimentacoesProdutosnome_produto: TStringField
      FieldKind = fkLookup
      FieldName = 'nome_produto'
      LookupDataSet = tbProdutos
      LookupKeyFields = 'id_produto'
      LookupResultField = 'nome_produto'
      KeyFields = 'idProduto'
      Size = 50
      Lookup = True
    end
  end
  object sqlAumentaEstoque: TFDCommand
    Connection = Conexao
    CommandText.Strings = (
      
        'UPDATE produtos SET estoque_atual = estoque_atual + :pQtd WHERE ' +
        'id_produto = :pId')
    ParamData = <
      item
        Name = 'pQtd'
        ParamType = ptInput
      end
      item
        Name = 'pId'
        ParamType = ptInput
      end>
    Left = 112
    Top = 472
  end
  object sqlDiminuiEstoque: TFDCommand
    Connection = Conexao
    CommandText.Strings = (
      
        'UPDATE produtos SET estoque_atual = estoque_atual - :pQtd WHERE ' +
        'id_produto = :pId')
    ParamData = <
      item
        Name = 'pQtd'
        ParamType = ptInput
      end
      item
        Name = 'pId'
        ParamType = ptInput
      end>
    Left = 272
    Top = 472
  end
  object sqlMovimentacoes: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM movimentacoes')
    Left = 536
    Top = 472
    ParamData = <
      item
        Name = 'pDataInicial'
        ParamType = ptInput
      end
      item
        Name = 'pDataFinal'
        ParamType = ptInput
      end>
  end
  object dsSqlMovimentacoes: TDataSource
    DataSet = sqlMovimentacoes
    Left = 536
    Top = 576
  end
  object sqlMovProdutos: TFDQuery
    Active = True
    IndexFieldNames = 'idMovimentacao'
    MasterSource = dsSqlMovimentacoes
    MasterFields = 'id_movimentacao'
    Connection = Conexao
    SQL.Strings = (
      'SELECT * FROM movimentacoes_produtos')
    Left = 728
    Top = 472
    object sqlMovProdutosid_movimentacoes_produtos: TFDAutoIncField
      FieldName = 'id_movimentacoes_produtos'
      Origin = 'id_movimentacoes_produtos'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object sqlMovProdutosidMovimentacao: TIntegerField
      FieldName = 'idMovimentacao'
      Origin = 'idMovimentacao'
      Required = True
    end
    object sqlMovProdutosidProduto: TIntegerField
      FieldName = 'idProduto'
      Origin = 'idProduto'
      Required = True
    end
    object sqlMovProdutosqtd_produtos: TIntegerField
      FieldName = 'qtd_produtos'
      Origin = 'qtd_produtos'
      Required = True
    end
    object sqlMovProdutosnome_produto: TStringField
      FieldKind = fkLookup
      FieldName = 'nome_produto'
      LookupDataSet = tbProdutos
      LookupKeyFields = 'id_produto'
      LookupResultField = 'nome_produto'
      KeyFields = 'idProduto'
      Size = 50
      Lookup = True
    end
  end
  object dsSqlMovProdutos: TDataSource
    DataSet = sqlMovProdutos
    Left = 736
    Top = 576
  end
end
