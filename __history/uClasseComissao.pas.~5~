unit uClasseComissao;

interface

uses sysutils, iInterfaceComissao;

type
  TAdicional = class(TInterfacedObject, iAdicional)
    private
        [Weak]   // Weak = Fraca -> referência circular entre as classes, mantendo o objeto em memória
                 //                 causando vazamento de memória
        FParent              : iComissao;
        FPercentualAdicional : Currency;
        FValorAdicional      : Currency;
     public
        constructor Create(aParent: iComissao);
        destructor Destroy; override;

        class function Novo(aParent: iComissao): iAdicional;

        function percentualAdicional                                      : Currency;   overload;
        function valorAdicional                                           : Currency;   overload;
        function percentualAdicional(const aPercentualAdicional: Currency): iAdicional; overload;
        function valorAdicional(const aValorAdicional: Currency)          : iAdicional; overload;
        function &End                                                     : iComissao;
  end;

  TComissao = class(TInterfacedObject, iComissao)
     private
        FValorVenda         : Currency;
        FPercentualComissao : Currency;
        FAdicional          : iAdicional;

     public
        constructor Create;
        destructor Destroy; override;

        class function Novo : iComissao;

        function valorVenda        (const aValorVenda: Currency)         : iComissao;  overload;
        function percentualComissao(const aPercentualComissao : Currency): iComissao;  overload;
        function valorVenda                                              : Currency;   overload;
        function percentualComissao                                      : Currency;   overload;
        function valorComissao                                           : Currency;   overload;
        function Adicional                                               : iAdicional; overload;
  end;

implementation

{ TComissao }


function TComissao.Adicional: iAdicional;
begin
   result := FAdicional;
end;

constructor TComissao.Create;
begin
   FAdicional := TAdicional.Novo(self);
end;

destructor TComissao.Destroy;
begin
   inherited;
end;

function TComissao.percentualComissao(const aPercentualComissao: Currency): iComissao;
begin
   result              := self;
   FPercentualComissao := aPercentualComissao;
end;

class function TComissao.Novo: iComissao;
begin
   result := self.Create;
end;

function TComissao.percentualComissao: Currency;
begin
   result := FPercentualComissao;
end;

function TComissao.valorComissao: Currency;
begin
   if FValorVenda >= FAdicional.valorAdicional then
      begin
         result := (FValorVenda * ((FPercentualComissao + FAdicional.percentualAdicional) / 100));
      end
   else
      begin
         result := (FValorVenda * (FPercentualComissao / 100));
   end;
end;

function TComissao.valorVenda: Currency;
begin
   result := FValorVenda;
end;

function TComissao.valorVenda(const aValorVenda: Currency): iComissao;
begin
   result      := self;
   FValorVenda := aValorVenda;
end;

{ TAdicional }
constructor TAdicional.Create(aParent: iComissao);
begin
   Inherited Create;
   FParent := aParent;
end;

destructor TAdicional.Destroy;
begin
   inherited;
end;

function TAdicional.&End: iComissao;
begin
   result := FParent;
end;

class function TAdicional.Novo(aParent: iComissao): iAdicional;
begin
   Result := Self.Create(aParent);
end;

function TAdicional.percentualAdicional: Currency;
begin
   result := FPercentualAdicional;
end;

function TAdicional.percentualAdicional(const aPercentualAdicional: Currency): iAdicional;
begin
   Result               := Self;
   FPercentualAdicional := aPercentualAdicional;
end;

function TAdicional.valorAdicional(const aValorAdicional: Currency): iAdicional;
begin
   Result          := Self;
   FValorAdicional := aValorAdicional;
end;

function TAdicional.valorAdicional: Currency;
begin
   Result:= FValorAdicional;
end;

end.
