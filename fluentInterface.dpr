program fluentInterface;

uses
  Vcl.Forms,
  uFluentInterface in 'uFluentInterface.pas' {Form1},
  uClasseComissao in 'uClasseComissao.pas',
  iInterfaceComissao in 'iInterfaceComissao.pas',
  uClasseCarro in 'uClasseCarro.pas',
  iInterfaceCarro in 'iInterfaceCarro.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
