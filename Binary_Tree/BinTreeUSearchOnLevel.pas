unit BinTreeUSearchOnLevel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
var isn:boolean;
  i:integer;
begin
Form6.Tag:=0;
isn:=true;
for i:=1 to length(Edit1.Text) do
  isn:=isn and (Edit1.Text[i] in ['0'..'9']);
if not isn then
  begin
  ShowMessage ('Ключ должен быть числовым значением без знака');
  exit;
  end;
if isn then
  begin
  Form6.Tag:=StrToInt(Edit1.Text);
  Form6.Close;
  end;
end;

end.
