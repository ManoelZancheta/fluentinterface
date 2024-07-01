
{================================================================================
 Descrição     : Código Referente à Vídeo Aula 95 - Fluent Interface
 Local Vídeo   : YouTube - Conteúdo Delphi - Canal do Zanca
          Link : https://www.youtube.com/watch?v=IqOYGobO6s0&t=462s
 Elaborado Por : Manoel Zancheta
================================================================================}
unit uFluentInterface;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  iInterfaceCarro;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uClasseCarro, uClasseComissao;


procedure TForm1.Button1Click(Sender: TObject);
var
  funcionarioCargo: string;
begin
  //Sem Fluent Interface
  funcionarioCargo := ' manoel*dev ';

  showmessage(funcionarioCargo + ' - Tamanho: ' +inttostr(length(funcionarioCargo)));

  funcionarioCargo := Trim(funcionarioCargo);
  funcionarioCargo := UpperCase(funcionarioCargo);
  funcionarioCargo := StringReplace(funcionarioCargo, '*', '-', [rfReplaceAll]);

   showmessage(funcionarioCargo + ' - Tamanho: ' + inttostr(length(funcionarioCargo)));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   funcionarioCargo: string;
begin
   //Com Fluent Interface

   funcionarioCargo := ' manoel*dev ';

   showmessage(funcionarioCargo + ' - Tamanho: ' +inttostr(length(funcionarioCargo)));

   funcionarioCargo := funcionarioCargo
                          .Trim
                          .ToUpper
                          .Replace('*', '-', [rfReplaceAll]) ;


   showmessage(funcionarioCargo + ' - Tamanho: ' + inttostr(length(funcionarioCargo)));
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   showmessage(currtostr(TComissao
                           .Novo
                           .valorVenda(300)
                           .percentualComissao(35)
                           .adicional
                              .percentualAdicional(15)
                              .valorAdicional(400)
                           .&End
                           .valorComissao
                        )
              );
end;


procedure TForm1.Button4Click(Sender: TObject);
begin
    showmessage(TCarro
                   .Novo.montadora('Chevolet')
                   .nomeCarro('Cruze')
                   .anoFabricacao(2024)
                   .valor(70000)
                   .mostra
               );

    showmessage(TCarro.Novo.montadora('Fiat').nomeCarro('Toro').anoFabricacao(2024).valor(120000).mostra);
end;

end.
