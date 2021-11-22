program BinTree;

uses
  Forms,
  BinTreeU1 in 'BinTreeU1.pas' {Form1},
  BinTreeUDel in 'BinTreeUDel.pas' {Form2},
  BinTreeUAdd in 'BinTreeUAdd.pas' {Form3},
  BinTreeUDraw in 'BinTreeUDraw.pas' {Form4},
  BinTreeUDelLeaves in 'BinTreeUDelLeaves.pas' {Form5},
  BinTreeUSearchOnLevel in 'BinTreeUSearchOnLevel.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
