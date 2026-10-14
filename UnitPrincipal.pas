unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Sair1: TMenuItem;
    Cadastro1: TMenuItem;
    CadastrodeProdutos1: TMenuItem;
    Movimentaes1: TMenuItem;
    GerenciarMovimentaes1: TMenuItem;
    CadastrarMovimentaes1: TMenuItem;
    Image1: TImage;
    procedure Sair1Click(Sender: TObject);
    procedure CadastrodeProdutos1Click(Sender: TObject);
    procedure GerenciarMovimentaes1Click(Sender: TObject);
    procedure CadastrarMovimentaes1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses UnitCadProdutos, UnitConsMovimentacoes, UnitCadMovimentacoes;


procedure TFormPrincipal.CadastrarMovimentaes1Click(Sender: TObject);
begin
       ConsMovimentacoes.ShowModal;
end;

procedure TFormPrincipal.CadastrodeProdutos1Click(Sender: TObject);
begin
     CadProdutos.ShowModal;
end;

procedure TFormPrincipal.GerenciarMovimentaes1Click(Sender: TObject);
begin
         CadMovimentacoes.ShowModal;
end;

procedure TFormPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
