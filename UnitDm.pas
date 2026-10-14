unit UnitDm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, Vcl.Dialogs;
// Vcl.Dialogs = Caixas de diálogos, no caso estamos importando essa biblioteca para exibir as mensagens

type
  TDm = class(TDataModule)
    Conexao: TFDConnection;
    tbProdutos: TFDTable;
    dsProdutos: TDataSource;
    dsMovimentacao: TDataSource;
    dsMovimentacoesProdutos: TDataSource;
    tbMovimentacao: TFDTable;
    tbMovimentacoesProdutos: TFDTable;
    sqlAumentaEstoque: TFDCommand;
    sqlDiminuiEstoque: TFDCommand;
    sqlMovimentacoes: TFDQuery;
    dsSqlMovimentacoes: TDataSource;
    tbProdutosid_produto: TFDAutoIncField;
    tbProdutosnome_produto: TStringField;
    tbProdutosfabricante: TStringField;
    tbProdutosvalidade_produto: TDateField;
    tbProdutosestoque_atual: TIntegerField;
    tbMovimentacaoid_movimentacao: TFDAutoIncField;
    A: TDateTimeField;
    tbMovimentacaoobservacoes: TMemoField;
    tbMovimentacaoresponsavel: TStringField;
    tbMovimentacaotipo_movimentacao: TStringField;
    tbMovimentacoesProdutosid_movimentacoes_produtos: TFDAutoIncField;
    tbMovimentacoesProdutosidMovimentacao: TIntegerField;
    tbMovimentacoesProdutosidProduto: TIntegerField;
    tbMovimentacoesProdutosqtd_produtos: TIntegerField;
    tbMovimentacoesProdutosnome_produto: TStringField;
    sqlMovProdutos: TFDQuery;
    dsSqlMovProdutos: TDataSource;
    sqlMovProdutosid_movimentacoes_produtos: TFDAutoIncField;
    sqlMovProdutosidMovimentacao: TIntegerField;
    sqlMovProdutosidProduto: TIntegerField;
    sqlMovProdutosqtd_produtos: TIntegerField;
    sqlMovProdutosnome_produto: TStringField;
    procedure tbMovimentacoesProdutosAfterPost(DataSet: TDataSet);
    procedure tbMovimentacoesProdutosAfterDelete(DataSet: TDataSet);
    procedure calcular_totais;

    procedure tbMovimentacaoAfterScroll(DataSet: TDataSet);
    procedure tbMovimentacoesProdutosBeforeDelete(DataSet: TDataSet);
    procedure tbMovimentacaoBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm: TDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitCadMovimentacoes;

{$R *.dfm}

procedure TDm.calcular_totais;
var
  totais_produtos: Integer;
begin
  // Se o estado dessa tabela estiver no estado de dsBrowse = estado de navegação
  if Dm.tbMovimentacoesProdutos.State in [dsBrowse] then
  begin
    Dm.tbMovimentacoesProdutos.First;
    While not Dm.tbMovimentacoesProdutos.Eof do
    begin
      totais_produtos := totais_produtos +
        Dm.tbMovimentacoesProdutos.FieldByName('qtd_produtos').Value;

      Dm.tbMovimentacoesProdutos.Next;

    end;

    CadMovimentacoes.lblTotaisProdutos.Caption := IntToStr(totais_produtos);
  end;
end;

procedure TDm.tbMovimentacaoAfterScroll(DataSet: TDataSet);
begin
  calcular_totais;
end;

procedure TDm.tbMovimentacaoBeforeDelete(DataSet: TDataSet);
begin
  if tbMovimentacoesProdutos.RecordCount > 0 then
    begin
      ShowMessage('Existem Produtos cadastrados nessa movimentação. Exclua-os primeiro');
      abort;
    end;

end;

procedure TDm.tbMovimentacoesProdutosAfterDelete(DataSet: TDataSet);
begin
  calcular_totais;


end;

procedure TDm.tbMovimentacoesProdutosAfterPost(DataSet: TDataSet);
begin
  calcular_totais;

  if (tbMovimentacaotipo_movimentacao.Value = 'Entrada no Estoque') then
  begin
    Dm.sqlAumentaEstoque.ParamByname('pId').Value := Dm.tbMovimentacoesProdutos.FieldByName('idProduto').Value;
    Dm.sqlAumentaEstoque.ParamByname('pQtd').Value := Dm.tbMovimentacoesProdutosqtd_produtos.Value;
    Dm.sqlAumentaEstoque.Execute;
  end;

  if (tbMovimentacaotipo_movimentacao.Value = 'Saida do Estoque') then
  begin
    Dm.sqlDiminuiEstoque.ParamByname('pId').Value := Dm.tbMovimentacoesProdutos.FieldByName('idProduto').Value;
    Dm.sqlDiminuiEstoque.ParamByname('pQtd').Value := Dm.tbMovimentacoesProdutosqtd_produtos.Value;
    Dm.sqlDiminuiEstoque.Execute;
  end;

end;

procedure TDm.tbMovimentacoesProdutosBeforeDelete(DataSet: TDataSet);
begin

//       Mudando os Sql's para o Delete
  if (tbMovimentacaotipo_movimentacao.Value = 'Entrada no Estoque') then
  begin
    Dm.sqlDiminuiEstoque.ParamByname('pId').Value := Dm.tbMovimentacoesProdutos.FieldByName('idProduto').Value;
    Dm.sqlDiminuiEstoque.ParamByname('pQtd').Value := Dm.tbMovimentacoesProdutosqtd_produtos.Value;
    Dm.sqlDiminuiEstoque.Execute;
  end;

  if (tbMovimentacaotipo_movimentacao.Value = 'Saida do Estoque') then
  begin
    Dm.sqlAumentaEstoque.ParamByname('pId').Value := Dm.tbMovimentacoesProdutos.FieldByName('idProduto').Value;
    Dm.sqlAumentaEstoque.ParamByname('pQtd').Value := Dm.tbMovimentacoesProdutosqtd_produtos.Value;
    Dm.sqlAumentaEstoque.Execute;
  end;
end;

end.
