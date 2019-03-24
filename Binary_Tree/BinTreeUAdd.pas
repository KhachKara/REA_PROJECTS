unit BinTreeUAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var isn:boolean;
     i:integer;
begin
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
  Form3.Tag:=StrToInt(Edit1.Text);
  Form3.Close;
  end;
end;

end.
