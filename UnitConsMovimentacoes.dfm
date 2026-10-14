object ConsMovimentacoes: TConsMovimentacoes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consultar Movimenta'#231#245'es'
  ClientHeight = 556
  ClientWidth = 981
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Label4: TLabel
    Left = 24
    Top = 515
    Width = 187
    Height = 21
    Caption = 'Total de Movimenta'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTotal: TLabel
    Left = 227
    Top = 515
    Width = 18
    Height = 21
    Caption = '00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 981
    Height = 89
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 979
    object Label1: TLabel
      Left = 32
      Top = 23
      Width = 291
      Height = 32
      Caption = 'Consultar Movimenta'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic, fsUnderline]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 981
    Height = 96
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 979
    object Label2: TLabel
      Left = 32
      Top = 14
      Width = 133
      Height = 20
      Caption = 'Digite a data inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 243
      Top = 14
      Width = 124
      Height = 20
      Caption = 'Digite a data final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object txtDataInicial: TMaskEdit
      Left = 32
      Top = 40
      Width = 169
      Height = 23
      EditMask = '##/##/####;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object txtDataFinal: TMaskEdit
      Left = 243
      Top = 40
      Width = 166
      Height = 23
      EditMask = '##/##/####;1;_'
      MaxLength = 10
      TabOrder = 1
      Text = '  /  /    '
    end
    object btnConsultar: TButton
      Left = 520
      Top = 16
      Width = 209
      Height = 57
      Caption = 'Consultar Movimenta'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnConsultarClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 191
    Width = 433
    Height = 310
    DataSource = Dm.dsSqlMovimentacoes
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'tipo_movimentacao'
        Title.Caption = 'TIPO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_hora_movimentacao'
        Title.Caption = 'DATA/HORA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'responsavel'
        Title.Caption = 'RESPONS'#193'VEL'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 151
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 520
    Top = 191
    Width = 433
    Height = 310
    DataSource = Dm.dsSqlMovProdutos
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nome_produto'
        Title.Caption = 'NOME DO PRODUTO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 227
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtd_produtos'
        Title.Caption = 'QUANTIDADE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 167
        Visible = True
      end>
  end
end
