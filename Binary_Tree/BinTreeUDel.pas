unit BinTreeUDel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses BinTreeU1;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
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
if MessageDlg('Подтвердите удаление',mtWarning,[mbOK,mbCancel],0)= mrCancel then
      exit;
if isn then
  begin
  Form2.Tag:=StrToInt(Edit1.Text);
  Form2.Close;
  end;
end;

end.
