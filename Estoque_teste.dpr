program Estoque_teste;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FormPrincipal},
  UnitCadProdutos in 'UnitCadProdutos.pas' {CadProdutos},
  UnitCadMovimentacoes in 'UnitCadMovimentacoes.pas' {CadMovimentacoes},
  UnitConsMovimentacoes in 'UnitConsMovimentacoes.pas' {ConsMovimentacoes},
  UnitDm in 'UnitDm.pas' {Dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TCadProdutos, CadProdutos);
  Application.CreateForm(TCadMovimentacoes, CadMovimentacoes);
  Application.CreateForm(TConsMovimentacoes, ConsMovimentacoes);
  Application.Run;
end.
