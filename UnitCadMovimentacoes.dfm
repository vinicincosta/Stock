object CadMovimentacoes: TCadMovimentacoes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Movimenta'#231#245'es'
  ClientHeight = 639
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 21
  object Label1: TLabel
    Left = 32
    Top = 32
    Width = 335
    Height = 37
    Caption = 'Gerenciar Movimenta'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 179
    Width = 176
    Height = 21
    Caption = 'Tipo da Movimenta'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 32
    Top = 261
    Width = 90
    Height = 21
    Caption = 'Data e Hora'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 32
    Top = 413
    Width = 97
    Height = 21
    Caption = 'Observa'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 32
    Top = 333
    Width = 95
    Height = 21
    Caption = 'Respons'#225'vel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 775
    Top = 71
    Width = 204
    Height = 32
    Caption = 'Produtos da Mov.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 776
    Top = 172
    Width = 138
    Height = 21
    Caption = 'Escolha o Produto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 1071
    Top = 172
    Width = 32
    Height = 21
    Caption = 'Qtd.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 776
    Top = 586
    Width = 158
    Height = 25
    Caption = 'Total de Produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTotaisProdutos: TLabel
    Left = 957
    Top = 586
    Width = 22
    Height = 25
    Caption = '00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBComboBox1: TDBComboBox
    Left = 32
    Top = 206
    Width = 313
    Height = 29
    Style = csDropDownList
    DataField = 'tipo_movimentacao'
    DataSource = Dm.dsMovimentacao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ImeName = 'Portuguese (Brazilian ABNT)'
    Items.Strings = (
      'Entrada no Estoque'
      'Saida do Estoque')
    ParentFont = False
    TabOrder = 0
    StyleName = 'Windows'
  end
  object DBEdit1: TDBEdit
    Left = 32
    Top = 288
    Width = 169
    Height = 29
    DataField = 'data_hora_movimentacao'
    DataSource = Dm.dsMovimentacao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object DBMemo1: TDBMemo
    Left = 32
    Top = 440
    Width = 329
    Height = 171
    DataField = 'observacoes'
    DataSource = Dm.dsMovimentacao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object DBNavigator1: TDBNavigator
    Left = 32
    Top = 88
    Width = 392
    Height = 65
    DataSource = Dm.dsMovimentacao
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
    TabOrder = 3
    OnClick = DBNavigator1Click
  end
  object DBEdit2: TDBEdit
    Left = 32
    Top = 360
    Width = 169
    Height = 29
    DataField = 'responsavel'
    DataSource = Dm.dsMovimentacao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object DBNavigator2: TDBNavigator
    Left = 775
    Top = 121
    Width = 336
    Height = 25
    DataSource = Dm.dsMovimentacoesProdutos
    VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel]
    TabOrder = 5
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 775
    Top = 199
    Width = 210
    Height = 29
    DataField = 'idProduto'
    DataSource = Dm.dsMovimentacoesProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    KeyField = 'id_produto'
    ListField = 'nome_produto'
    ListSource = Dm.dsProdutos
    ParentFont = False
    TabOrder = 6
  end
  object DBEdit3: TDBEdit
    Left = 1071
    Top = 199
    Width = 65
    Height = 29
    DataField = 'qtd_produtos'
    DataSource = Dm.dsMovimentacoesProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object DBGrid2: TDBGrid
    Left = 776
    Top = 248
    Width = 386
    Height = 332
    DataSource = Dm.dsMovimentacoesProdutos
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nome_produto'
        Title.Caption = 'Nome do Produto'
        Width = 211
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtd_produtos'
        Title.Caption = 'Quantidade'
        Width = 115
        Visible = True
      end>
  end
  object DBGrid3: TDBGrid
    Left = 378
    Top = 193
    Width = 375
    Height = 418
    DataSource = Dm.dsMovimentacao
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'tipo_movimentacao'
        Title.Caption = 'TIPO MOV'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_hora_movimentacao'
        Title.Caption = 'DATA/HORA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'responsavel'
        Title.Caption = 'RESPONSAVEL'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 134
        Visible = True
      end>
  end
end
