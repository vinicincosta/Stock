unit UnitConsMovimentacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TConsMovimentacoes = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    txtDataInicial: TMaskEdit;
    txtDataFinal: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    btnConsultar: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label4: TLabel;
    lblTotal: TLabel;
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConsMovimentacoes: TConsMovimentacoes;

implementation

{$R *.dfm}

uses UnitDm;

procedure TConsMovimentacoes.btnConsultarClick(Sender: TObject);
begin

  var
    DataInicial, DataFinal: TDateTime;
  begin
// Verificando se o campo data Inicial e Data final estiver vazio
    if (Trim(txtDataInicial.Text) = '') or (Trim(txtDataFinal.Text) = '') or
      (not TryStrToDate(txtDataInicial.Text, DataInicial)) or
      (not TryStrToDate(txtDataFinal.Text, DataFinal)) then
    begin
      ShowMessage('Insira os Campos das Datas');
      Exit;
    end;

    if DataInicial > DataFinal then
    begin
      Application.MessageBox
        ('Data Inicial não pode ser maior do que Data Final', 'Erro',
        MB_ICONERROR);
      Exit;
    end;

    // segue o fluxo normal
  end;

  // Fechar o componente do Sql
  Dm.sqlMovimentacoes.Close;

  // Limpar o sql
  Dm.sqlMovimentacoes.SQL.Clear;

  Dm.sqlMovimentacoes.SQL.Text :=
    'SELECT * FROM movimentacoes WHERE Date(data_hora_movimentacao) BETWEEN :pDataInicial and :pDataFinal';

  // Pegando o valor de um parametro e atribuindo ao texto do txtDataInicial
  // FormatDateTime = Função para alterar o formato da Data. Além do mais no mesmo código
  // tem que acrescentar StrToDate Convertendo de String para Date

  Dm.sqlMovimentacoes.ParamByName('pDataInicial').Value :=
    FormatDateTime('YYYY-MM-DD', StrToDate(txtDataInicial.Text));

  Dm.sqlMovimentacoes.ParamByName('pDataFinal').Value :=
    FormatDateTime('YYYY-MM-DD', StrToDate(txtDataFinal.Text));

  // Abrir a tabela para realizar a consulta
  Dm.sqlMovimentacoes.Open;

  lblTotal.Caption := IntToStr(Dm.sqlMovimentacoes.RecordCount);

end;

procedure TConsMovimentacoes.FormShow(Sender: TObject);
begin
  Dm.sqlMovimentacoes.Refresh;
  Dm.sqlMovProdutos.Refresh;

  // Atualizando o Totais de Movimentações
  lblTotal.Caption := IntToStr(Dm.sqlMovimentacoes.RecordCount);
end;

end.
