unit iInterfaceCarro;

interface


type
  iCarro = interface
     ['{63C79AD9-4068-41A5-974A-CE14627560F9}']  //GUID (Globally Unique Identifier) -> CTRL + SHIFT + G
     function montadora     (aMontadora: String): iCarro;
     function nomeCarro     (aNome: String)     : iCarro;
     function anoFabricacao (aAno: Integer)     : iCarro;
     function valor         (aValor: Currency)  : iCarro;
     function mostra                            : String;
  end;

implementation

end.
