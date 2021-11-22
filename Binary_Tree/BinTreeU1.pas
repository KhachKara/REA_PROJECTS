unit BinTreeU1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Menus;

type
  NodePointer=^Node;
  Node = record
    key:integer;
    str:string;
    Left:NodePointer;
    Right:NodePointer;
  end;
  TForm1 = class(TForm)
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    SaveMemo: TMemo;
    SaveDialog1: TSaveDialog;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FI:TextFile;
    Root:NodePointer;  //Root - указатель на корень дерева
    function Parse(s:string; var k:integer; var d:string):boolean;  //Parse - процедура, которая выделяет из строки ключ и значение и выозвращает true, если выделение прошло удачно
    procedure Add(source:NodePointer; key:integer; str:string);  //Add - добавляет узел в дерево
    function Find(source:NodePointer; key:integer):NodePointer;  //Find - ищет узел по ключу, возвращает ссылку на узел
    procedure UpPass(source:NodePointer; lines:TStrings);    //UpPass - обход снизу вверх
    procedure DownPass(source:NodePointer; lines:TStrings);  //DownPass - обход сверху вниз
    procedure RootPass(source:NodePointer; lines:TStrings);  //RootPass - симметричный обход
    procedure DeleteTree(source:NodePointer);                //DeleteTree - удаляет дерево
    procedure DeleteSubTree(upper:NodePointer; source:NodePointer;key:integer;LeftBrunch:boolean);   //DeleteSubTree - удаляет поддерево
    procedure DeleteNode(upper:NodePointer; source:NodePointer; key:integer; LeftBrunch:boolean);    //DeleteNode - удаляет отдельный узел
    function Minimal(source:NodePointer):NodePointer; //Minimal - ищет минимальное значение в дереве или поддереве
    procedure ShowNodeInForm(source:NodePointer; left,right,top:integer); //ShowNodeInForm - процедура прорисовки отдельного узла
    procedure ShowTreeInForm; //ShowTreeInForm - процедура прорисовки всего дерева
    function MaxDepth(source:NodePointer; level:integer):integer; //MaxDepth - определяет максимальную глубину дерева
    function CountLeavesAtLevel(source:NodePointer;targetlevel,level:integer):integer; //CountLeavesAtLevel - считает листья на определенном уровне
    function CountNodesAtLevel(source:NodePointer;targetlevel,level:integer):integer; //CountNodesAtLevel - считает узлы (которые не листья) на определенном уровне
    procedure DelLeavesOnLevel(source:NodePointer;curlevel,level:integer); //DelLeavesOnLevel - удаляет листья на определенном уровне
    function FindLevelByKey(source:NodePointer;key:integer;curlevel:integer):integer; //FindLevelByKey - по ключу определяет уровень, на котором находится узел (не лист), с таким ключом. Если такого ключа нет или это лист, то возвращает 0
  end;

var
  Form1: TForm1;

implementation

uses BinTreeUDel, BinTreeUAdd, BinTreeUDraw, BinTreeUDelLeaves,
  BinTreeUSearchOnLevel;

procedure TForm1.Add(source:NodePointer; key:integer; str:string);
var tmp:NodePointer;
begin
if Root=nil then
  begin
  New(tmp);
  tmp^.key:=key;
  tmp^.str:=str;
  tmp^.Left:=nil;
  tmp^.Right:=nil;
  Root:=tmp;
  exit;
  end;
//здесь согласно принципам инкапсуляции мы не спрашиваем разрешение на замену.
//Разрешение на замену будет спрашиваться в интерфейсных процедурах, при запрете процедура вообще не будет вызываться
if key=source^.key then
  begin
  source^.key:=key;
  source^.str:=str;
  end;
//добавляем в левое поддерево
if key<source^.key then
  begin
  if source^.Left=nil then
    begin
    New(tmp);
    tmp^.key:=key;
    tmp^.str:=str;
    tmp^.Left:=nil;
    tmp^.Right:=nil;
    source^.Left:=tmp;
    exit;
    end
  else
    Add(source^.Left,key,str);
  end;
//добавляем в правое поддерево
if key>source^.key then
  begin
  if source^.Right=nil then
    begin
    New(tmp);
    tmp^.key:=key;
    tmp^.str:=str;
    tmp^.Left:=nil;
    tmp^.Right:=nil;
    source^.Right:=tmp;
    exit;
    end
  else
    Add(source^.Right,key,str);
  end;

end;

function TForm1.Find(source:NodePointer; key:integer):NodePointer;
begin
if Root=nil then
  begin
  Result:=nil;
  exit;
  end;
if source^.key=key then Result:=source;
if (key>source^.key) and (source^.Right<>nil) then Result:=Find(source^.Right,key);
if (key<source^.key) and (source^.Left<>nil) then Result:=Find(source^.Left,key);
if (key>source^.key) and (source^.Right=nil) then Result:=nil;
if (key<source^.key) and (source^.Left=nil) then Result:=nil;
end;

function TForm1.MaxDepth(source:NodePointer; level:integer):integer;
var m1,m2:integer;
begin
m1:=level;
m2:=0;
if Root=nil then
  begin
  Result:=0;
  exit;
  end;
if source^.Left<> nil then
  m1:=MaxDepth(source^.Left,level+1);
if source^.Right<> nil then
  m2:=MaxDepth(source^.Right,level+1);
if m1>m2 then Result:=m1
else Result:=m2;
end;

function TForm1.CountNodesAtLevel(source:NodePointer;targetlevel,level:integer):integer;
var r:integer;
begin
if (level=targetlevel) then
  begin
  if (source^.Left<>nil) or (source^.Right<>nil) then
    Result:=1
  else
    Result:=0;
  exit;
  end;
r:=0;
if source^.Left<>nil then r:=r+CountNodesAtLevel(source^.Left,targetlevel,level+1);
if source^.Right<>nil then r:=r+CountNodesAtLevel(source^.Right,targetlevel,level+1);
Result:=r;
end;

function TForm1.CountLeavesAtLevel(source:NodePointer;targetlevel,level:integer):integer;
var r:integer;
begin
if (level=targetlevel) then
  begin
  if (source^.Left=nil) and (source^.Right=nil) then
    Result:=1
  else
    Result:=0;
  exit;
  end;
r:=0;
if source^.Left<>nil then r:=r+CountLeavesAtLevel(source^.Left,targetlevel,level+1);
if source^.Right<>nil then r:=r+CountLeavesAtLevel(source^.Right,targetlevel,level+1);
Result:=r;
end;

procedure TForm1.UpPass(source:NodePointer; lines:TStrings);
begin
if Root=nil then Exit;
if source^.Left<>nil then UpPass(source^.Left,lines);
lines.Add(IntToStr(source^.key)+'->'+source^.str);
if source^.Right<>nil then UpPass(source^.Right,lines);
end;

procedure TForm1.DownPass(source:NodePointer; lines:TStrings);
begin
if Root=nil then Exit;
if source^.Right<>nil then DownPass(source^.Right,lines);
lines.Add(IntToStr(source^.key)+'->'+source^.str);
if source^.Left<>nil then DownPass(source^.Left,lines);
end;

procedure TForm1.RootPass(source:NodePointer; lines:TStrings);
begin
if Root=nil then Exit;
lines.Add(IntToStr(source^.key)+'->'+source^.str);
if source^.Left<>nil then RootPass(source^.Left,lines);
if source^.Right<>nil then RootPass(source^.Right,lines);
end;

procedure TForm1.DeleteTree(source:NodePointer);
begin
if Root=nil then exit;
if source^.Left<>nil then DeleteTree(source^.Left);
if source^.Right<>nil then DeleteTree(source^.Right);
if source=Root then
  begin
  Dispose(Root);
  Root:=nil;
  end
else
  Dispose(source);
end;

procedure TForm1.DeleteSubTree(upper:NodePointer; source:NodePointer;key:integer;LeftBrunch:boolean);
var prob:NodePointer;
begin
if source=Root then
  begin
  New(prob);
  upper:=prob;
  end;
if source=nil then exit;
if Root=nil then exit;
if key<source^.key then DeleteSubTree(source,source^.Left,key,true);
if key>source^.key then DeleteSubTree(source,source^.Right,key,false);
if key=source^.key then
  begin
  if LeftBrunch then upper^.Left:=nil
  else upper^.Right:=nil;
  DeleteTree(source)
  end;
if source=Root then
  Dispose(prob);
end;

function TForm1.Minimal(source:NodePointer):NodePointer;
begin
if source^.Left<>nil then Result:=Minimal(source^.Left)
else Result:=source;
end;

procedure TForm1.DeleteNode(upper:NodePointer; source:NodePointer; key:integer; LeftBrunch:boolean);
var tmp,tmp1,prob:NodePointer;
begin
if source=Root then
  begin
  New(prob);
  upper:=prob;
  end;
if Root=nil then exit;
if key<source^.key then
  begin
  DeleteNode(source,source^.Left,key,true);
  exit;
  end;
if key>source^.key then
  begin
  DeleteNode(source,source^.Right,key,false);
  exit;
  end;
if key=source^.key then
  begin
    if (source^.Left=nil) and (source^.Right=nil) then
      begin
      Dispose(source);
      if LeftBrunch then upper^.Left:=nil
      else upper^.Right:=nil;
      end
    else if (source^.Left=nil) then
      begin
      source^.key:=source^.Right^.key;
      source^.str:=source^.Right^.str;
      tmp:=source^.Right;
      source^.Left:=source^.Right^.Left;
      source^.Right:=source^.Right^.Right;
      Dispose(tmp);
      tmp:=nil;
      end
    else if (source^.Right=nil) then
      begin
      source^.key:=source^.Left^.key;
      source^.str:=source^.Left^.str;
      tmp:=source^.Left;
      source^.Right:=tmp^.Right;
      source^.Left:=tmp^.Left;
      Dispose(tmp);
      tmp:=nil;
      end
    else if (source^.Left<>nil) and (source^.Right<>nil) then
      begin
      tmp1:=Minimal(source^.Right);
      source^.key:=tmp1^.key;
      source^.str:=tmp1^.str;
      DeleteNode(source, source^.Right,source^.key,false);
      end;
  end;
if source=Root then
  Dispose(prob);
end;

procedure TForm1.DelLeavesOnLevel(source:NodePointer;curlevel,level:integer);
begin
if (source^.Left=nil) and (source^.Right=nil) and (curlevel=level) then
  begin
  DeleteNode(nil,Root,source^.key,true);
  exit;
  end;
if curlevel=level then exit;
if (source^.Left<>nil) then DelLeavesOnLevel(source^.Left,curlevel+1,level);
if (source^.Right<>nil) then DelLeavesOnLevel(source^.Right,curlevel+1,level);
end;

function TForm1.Parse(s:string; var k:integer; var d:string):boolean;
var tmps:string;
    i:integer;
begin
Result:=false;
if (length(s)=0) or (not(s[1] in ['0'..'9'])) then
  exit;
tmps:=s[1];
i:=2;
while (s[i]<>'-') and (i<length(s)) do
  if s[i] in ['0'..'9'] then
    begin
    tmps:=tmps+s[i];
    i:=i+1;
    end
  else
    exit;
k:=StrToInt(tmps);
if (s[i]='-') and (s[i+1]='>') then
  i:=i+2
else
  exit;
d:='';
while i<=length(s) do
  begin
  d:=d+s[i];
  i:=i+1;
  end;
Result:=true;
end;

procedure TForm1.ShowNodeInForm(source:NodePointer; left,right,top:integer);
const VertStep:byte=70;
begin
if source^.Left<>nil then
begin
  Form4.Image1.Canvas.Pen.Color:=clBlue;
  Form4.Image1.Canvas.MoveTo(Round((right+left)/2),top);
  Form4.Image1.Canvas.LineTo(Round(((right+left)/2+left)/2),top+VertStep);
  ShowNodeInForm(source^.Left,left,Round((right+left)/2),top+VertStep);
end;
if source^.Right<>nil then
begin
  Form4.Image1.Canvas.Pen.Color:=clBlue;
  Form4.Image1.Canvas.MoveTo(Round((right+left)/2),top);
  Form4.Image1.Canvas.LineTo(Round((right+(right+left)/2)/2),top+VertStep);
  ShowNodeInForm(source^.Right,Round((right+left)/2),right,top+VertStep);
end;
Form4.Image1.Canvas.Font.Color:=clRed;
Form4.Image1.Canvas.TextOut(Round((right+left)/2)-Form4.Image1.Canvas.TextWidth(source^.str) div 2,top-10,source^.str);
Form4.Image1.Canvas.Font.Color:=clGreen;
Form4.Image1.Canvas.TextOut(Round((right+left)/2)-5,top+3,IntToStr(source^.key));
end;

procedure TForm1.ShowTreeInForm;
begin
Form4.Image1.Canvas.Brush.Color:=clWhite;
Form4.Image1.Canvas.FillRect(Form4.Image1.Canvas.ClipRect);
if Root<>nil then
  ShowNodeInForm(Root,0,Form4.Image1.Picture.Bitmap.Width,30);
Form4.Show;
Form4.Image1.Visible:=true;
end;

function TForm1.FindLevelByKey(source:NodePointer;key:integer;curlevel:integer):integer;
begin
if Root=nil then
  begin
  Result:=0;
  exit;
  end;
if ((source^.Left<>nil) or (source^.Right<>nil)) and (source^.key=key) then
  begin
  Result:=curlevel;
  exit;
  end;
if (key<source^.key)and(source^.Left<>nil) then Result:=FindLevelByKey(source^.Left,key,curlevel+1);
if (key>source^.key)and(source^.Right<>nil) then Result:=FindLevelByKey(source^.Right,key,curlevel+1);
end;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var s,s1,s2:string;
    k:integer;
begin
if OpenDialog1.Execute then
  begin
  s:=OpenDialog1.FileName;
  if FileExists(s) then
    begin
    AssignFile(FI,s);
    Reset(FI);
    while not EOF(FI) do
      begin
      readln(FI,s1);
      if Parse(s1,k,s2) then
        Add(Root,k,s2);
      end;
    CloseFile(FI);
    ShowTreeInForm;
    end
  else
    ShowMessage('Ошибка! Такой файл не существует');
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var s:string;
begin
if SaveDialog1.Execute then
  begin
  s:=SaveDialog1.FileName;
  if FileExists(s) then
    if MessageDlg('Такой файл уже существует. Перезаписать?',mtWarning,[mbOK,mbCancel],0)=mrCancel then exit;
  RootPass(Root,SaveMemo.Lines);
  SaveMemo.Lines.SaveToFile(s);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Root:=nil;
end;

procedure TForm1.Button3Click(Sender: TObject);
var s,s1:string;
    k:integer;
begin
while Memo1.Lines.Count>0 do
begin
s:=Memo1.Lines[0];
if Parse(s,k,s1) then
  begin
  if Find(Root,k)<>nil then
    begin
    if MessageDlg('Элемент с ключом '+IntToStr(k)+' уже существует. Перезаписать?',mtWarning,[mbOK,mbCancel],0)= mrOK then
      Add(Root,k,s1);
    end
  else
    Add(Root,k,s1);
  end;
Memo1.Lines.Delete(0);
end;
ShowTreeInForm;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
Memo1.Lines.Clear;
RootPass(Root,Memo1.Lines);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
Memo1.Clear;
UpPass(Root,Memo1.Lines);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
Memo1.Clear;
DownPass(Root,Memo1.Lines);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
if MessageDlg('Вы действительно хотите удалить дерево плностью?',mtWarning,[mbOK,mbCancel],0)= mrOK then
      DeleteTree(Root);
ShowTreeInForm;
end;

procedure TForm1.Button8Click(Sender: TObject);
var k:integer;
begin
Form2.Tag:=-1;
Form2.Edit1.Text:='';
Form2.CheckBox1.Checked:=false;
Form2.ShowModal;
k:=Form2.Tag;
if k>-1 then
  begin
  if Find(Root,k)=nil then
    begin
    ShowMessage('Элемента с таким ключом не существует');
    exit;
    end;
  if Form2.CheckBox1.Checked then DeleteSubtree(nil,Root,k,true)
  else DeleteNode(nil,Root,k,true);
  end;
ShowTreeInForm;
end;

procedure TForm1.Button9Click(Sender: TObject);
var k:integer;
    s:string;
begin
Form3.Tag:=-1;
Form3.Edit1.Text:='';
Form3.Edit2.Text:='';
Form3.ShowModal;
k:=Form3.Tag;
s:=Form3.Edit2.Text;
if k>-1 then
  begin
  if Find(Root,k)<>nil then
    begin
    if MessageDlg('Элемент с ключом '+IntToStr(k)+' уже существует. Перезаписать?',mtWarning,[mbOK,mbCancel],0)= mrOK then
      Add(Root,k,s);
    end
  else
    Add(Root,k,s);
  end;
ShowTreeInForm;
end;

procedure TForm1.Button10Click(Sender: TObject);
var i,m:integer;
begin
m:=MaxDepth(Root,1);
Memo1.Lines.Clear;
for i:=1 to m do
  Memo1.Lines.Add('Листьев на уровне '+IntToStr(i)+':  '+IntToStr(CountLeavesAtLevel(Root,i,1)));
end;

procedure TForm1.Button11Click(Sender: TObject);
var i,k:integer;
begin
k:=MaxDepth(Root,1);
Form5.ComboBox1.Items.Clear;
for i:=1 to k do
  Form5.ComboBox1.Items.Add(IntToStr(i));
Form5.ShowModal;
if Form5.Tag>-1 then
      DelLeavesOnLevel(Root,1,Form5.Tag+1);
ShowTreeInForm;
end;

procedure TForm1.Button12Click(Sender: TObject);
var n,k:integer;
begin
Form6.Tag:=0;
Form6.ShowModal;
if Form6.Tag=0 then exit;
k:=Form6.Tag;
n:=FindLevelByKey(Root,k,1);
ShowMessage('Количество узлов на заданном уровне равно '+IntToStr(CountNodesAtLevel(Root,n,1)));
end;

procedure TForm1.N5Click(Sender: TObject);
begin
Form1.Button1Click(Sender);
end;

procedure TForm1.N6Click(Sender: TObject);
begin
Form1.Button2Click(Sender);
end;

procedure TForm1.N7Click(Sender: TObject);
begin
Form1.Button3Click(Sender);
end;

procedure TForm1.N8Click(Sender: TObject);
begin
Form1.Button9Click(Sender);
end;

procedure TForm1.N9Click(Sender: TObject);
begin
Form1.Button8Click(Sender);
end;

procedure TForm1.N10Click(Sender: TObject);
begin
Form1.Button7Click(Sender);
end;

procedure TForm1.N11Click(Sender: TObject);
begin
Form1.Button6Click(Sender);
end;

procedure TForm1.N12Click(Sender: TObject);
begin
Form1.Button5Click(Sender);
end;

procedure TForm1.N13Click(Sender: TObject);
begin
Form1.Button4Click(Sender);
end;

procedure TForm1.N14Click(Sender: TObject);
begin
Form1.Button10Click(Sender);
end;

procedure TForm1.N15Click(Sender: TObject);
begin
Form1.Button11Click(Sender);
end;

procedure TForm1.N16Click(Sender: TObject);
begin
Form1.Button12Click(Sender);
end;

end.
