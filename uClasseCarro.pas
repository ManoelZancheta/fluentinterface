unit uClasseCarro;

interface

uses SysUtils, iInterfaceCarro;

type
  TCarro = class(TInterfacedObject, iCarro)
     {          Herdando TInterfacedObject, AddRef, Release e QueryInterface são
                implementados por padrão, assim o objeto será gerenciado pelo Delphi
                e liberado automaticamente da memória (ARC) quando não estiver mais em
                uso.
     }
     private
        FMontadora     : String;
        FNomeCarro     : String;
        FAnoFabricacao : Integer;
        FValor         : Currency;

     public
        constructor Create;
        destructor Destroy; override;

        class function Novo : iCarro;

        function montadora     (aMontadora: String): iCarro;
        function nomeCarro     (aNome: String)     : iCarro;
        function anoFabricacao (aAno: Integer)     : iCarro;
        function valor         (aValor: Currency)  : iCarro;
        function mostra                            : String;
end;

implementation


{ TCarro }
constructor TCarro.Create;
begin

end;

destructor TCarro.Destroy;
begin
   inherited;
end;

class function TCarro.Novo: iCarro;
begin
   result := self.Create;
end;

function TCarro.anoFabricacao(aAno: Integer): iCarro;
begin
   Result         := Self;
   FAnoFAbricacao := aAno;
end;


function TCarro.montadora(aMontadora: String): iCarro;
begin
   Result     := Self;
   FMontadora := aMontadora;
end;

function TCarro.nomeCarro(aNome: String): iCarro;
begin
   Result     := Self;
   FNomeCarro := aNome;
end;

function TCarro.valor(aValor: Currency): iCarro;
begin
   Result := Self;
   FValor := aValor;
end;

function TCarro.mostra: String;
begin
   Result := 'Montadora: ' + FMontadora + ' - Carro: ' + FNomeCarro + ' - Ano: ' + inttostr(FAnoFabricacao) + ' - Valor: ' + formatcurr('#,##0.00', FValor);
end;

end.
