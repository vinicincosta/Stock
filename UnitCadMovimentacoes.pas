unit UnitCadMovimentacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask;

type
  TCadMovimentacoes = class(TForm)
    Label1: TLabel;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBNavigator1: TDBNavigator;
    DBEdit2: TDBEdit;
    DBNavigator2: TDBNavigator;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    DBGrid2: TDBGrid;
    Label9: TLabel;
    lblTotaisProdutos: TLabel;
    DBGrid3: TDBGrid;
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadMovimentacoes: TCadMovimentacoes;

implementation

{$R *.dfm}

uses UnitDm;

procedure TCadMovimentacoes.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then
    begin
      Dm.tbMovimentacao.FieldByName('data_hora_movimentacao').Value := Now;
    end;
end;

procedure TCadMovimentacoes.FormShow(Sender: TObject);
begin
  Dm.calcular_totais;
end;

end.
