unit iInterfaceComissao;

interface


type
  iComissao = Interface; //Necessário fazer um forward (avançar) pois iAdicional utiliza
                         //iComissao que vem logo abaixo dela

  iAdicional = interface
  ['{23DCB819-B4FD-4200-A671-417DB315F6C5}']
     function percentualAdicional                                      : Currency;   overload;
     function valorAdicional                                           : Currency;   overload;
     function percentualAdicional(const aPercentualAdicional: Currency): iAdicional; overload;
     function valorAdicional     (const aValorAdicional: Currency)     : iAdicional; overload;
     function &End                                                     : iComissao;
  end;


  iComissao = interface
  ['{A8550B31-3E3F-4F1C-988A-99DF7A7D1BA6}']
     function valorVenda        (const aValorVenda: Currency)         : iComissao; overload;
     function percentualComissao(const aPercentualComissao : Currency): iComissao; overload;
     function valorVenda                                              : Currency;  overload;
     function percentualComissao                                      : Currency;  overload;
     function adicional                                               : IAdicional;
     function valorComissao                                           : Currency;
  end;

implementation


end.
