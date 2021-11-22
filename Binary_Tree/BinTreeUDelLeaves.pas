unit BinTreeUDelLeaves;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm5 = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
Form5.Tag:=0;
if MessageDlg('Подтвердите удаление',mtWarning,[mbOK,mbCancel],0)= mrCancel then
      exit;
Form5.Tag:=ComboBox1.ItemIndex;
Form5.Close;
end;

end.
