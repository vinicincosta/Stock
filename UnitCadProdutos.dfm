object CadProdutos: TCadProdutos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produtos'
  ClientHeight = 558
  ClientWidth = 934
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = [fsBold]
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 21
  object Label1: TLabel
    Left = 40
    Top = 64
    Width = 279
    Height = 37
    Caption = 'Cadastro de Produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 176
    Width = 139
    Height = 21
    Caption = 'Nome Do Produto'
  end
  object Label3: TLabel
    Left = 40
    Top = 264
    Width = 80
    Height = 21
    Caption = 'Fabricante'
  end
  object Label4: TLabel
    Left = 40
    Top = 352
    Width = 67
    Height = 21
    Caption = 'Validade'
  end
  object Label5: TLabel
    Left = 40
    Top = 440
    Width = 106
    Height = 21
    Caption = 'Estoque Atual'
  end
  object DBEdit1: TDBEdit
    Left = 40
    Top = 203
    Width = 231
    Height = 29
    DataField = 'nome_produto'
    DataSource = Dm.dsProdutos
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 40
    Top = 467
    Width = 233
    Height = 29
    DataField = 'estoque_atual'
    DataSource = Dm.dsProdutos
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 40
    Top = 379
    Width = 233
    Height = 29
    DataField = 'validade_produto'
    DataSource = Dm.dsProdutos
    MaxLength = 10
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 40
    Top = 291
    Width = 231
    Height = 29
    DataField = 'fabricante'
    DataSource = Dm.dsProdutos
    TabOrder = 3
  end
  object DBNavigator1: TDBNavigator
    Left = 400
    Top = 51
    Width = 456
    Height = 73
    DataSource = Dm.dsProdutos
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 392
    Top = 184
    Width = 457
    Height = 320
    DataSource = Dm.dsProdutos
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'id_produto'
        Title.Caption = 'Id'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome_produto'
        Title.Caption = 'Nome do Produto'
        Width = 257
        Visible = True
      end>
  end
end
