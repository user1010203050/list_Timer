unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, EditBtn, StdCtrls,
  ComCtrls, Spin, ExtCtrls, DateTimePicker,IniFiles;

type

  { TForm1 }

  TForm1 = class(TForm)
    ATD1: TButton;
    CBF1: TButton;
    CB1: TColorButton;
    CF1: TColorButton;
    CG1: TCheckGroup;
    Ch1: TToggleBox;
    MT1: TSpinEdit;
    LN2: TListBox;
    DTP1: TDateTimePicker;
    ST1: TSpinEdit;
    nns1: TMemo;
    SACBF1: TCheckBox;
    CTD1: TLabel;
    LN1: TListBox;
    LF1: TListBox;
    NS1: TMemo;
    SB1: TTrackBar;
    HT1: TSpinEdit;
    Timer1: TTimer;
    procedure ATD1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CB1Click(Sender: TObject);
    procedure CB1ColorChanged(Sender: TObject);
    procedure CBF1Click(Sender: TObject);
    procedure CF1Click(Sender: TObject);
    procedure CF1ColorChanged(Sender: TObject);
    procedure CG1Click(Sender: TObject);
    procedure SACBF1Change(Sender: TObject);
    procedure Del1Click(Sender: TObject);
    procedure Smove1Click(Sender: TObject);
    procedure CB1Change(Sender: TObject);
    procedure CF1Change(Sender: TObject);
    procedure DE1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LD1Change(Sender: TObject);
    procedure LD2Change(Sender: TObject);
    procedure LF1Click(Sender: TObject);
    procedure LN1Click(Sender: TObject);
    procedure LN2Click(Sender: TObject);
    procedure NS1Change(Sender: TObject);
    procedure Memo1EditingDone(Sender: TObject);
    procedure move2Change(Sender: TObject);
    procedure SB1Change(Sender: TObject);
    procedure Del1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TIN1Change(Sender: TObject);
    procedure Ch1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  i,T1:integer;
  SF2:Tinifile;
  const
SF1='Save_Font_Show_Date.ini';
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Memo1EditingDone(Sender: TObject);
begin

end;

procedure TForm1.move2Change(Sender: TObject);
begin

end;

procedure TForm1.SB1Change(Sender: TObject);
begin
  form1.Font.Size:=SB1.Position;
  sf2.writeInteger('font','size',SB1.Position);
end;

procedure TForm1.Del1Change(Sender: TObject);
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  DTP1.Date:=Date;
  DTp1.Time:=Time;
  for i:=0 to ln2.Count-1 do
  begin
    if ( strtoint(ln2.Items[i])>0)  Then
    begin
    ln2.Items[i]:=inttostr(strtoint(ln2.Items[i])-1);
    ln1.Items[i]:=timetostr(strtoint(ln2.Items[i])/86400);
    end;
  end;

end;

procedure TForm1.TIN1Change(Sender: TObject);
begin

end;

procedure TForm1.Ch1Change(Sender: TObject);
begin
         form1.Font.Bold:= CG1.Checked[1];
   form1.Font.Italic:= CG1.Checked[2];
   form1.Font.StrikeThrough:= CG1.Checked[3];
   form1.Font.Underline:= CG1.Checked[0];
    SF2:=Tinifile.Create(SF1);
    SF2.WriteBool('font','Underline',CG1.Checked[0]);
    SF2.WriteBool('font','Bold',CG1.Checked[1]);
    SF2.WriteBool('font','Italic',CG1.Checked[2]);
    SF2.WriteBool('font','StrikeThrough',CG1.Checked[3]);
end;

procedure TForm1.NS1Change(Sender: TObject);
begin
 if SACBF1.Checked Then NS1.Lines.SaveToFile('Note Show How much Timer to end.txt');
end;

procedure TForm1.CB1Change(Sender: TObject);
begin


    //sf2.writeInteger('font','Color Black',);

end;

procedure TForm1.ATD1Click(Sender: TObject);
begin
 T1:=3600*HT1.Value+60*MT1.Value+ST1.Value;
    NS1.Lines.Add(timetostr(DTP1.Time+T1/86400));
      ln2.Items.Add(inttostr(T1));
       ln1.Items.Add(timetostr(T1/86400));
         NS1.Lines.SaveToFile('Note Show How much Timer to end.txt');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin

end;

procedure TForm1.CB1Click(Sender: TObject);
begin

end;

procedure TForm1.CB1ColorChanged(Sender: TObject);
begin
     NS1.Color:=CB1.ButtonColor;
   NNS1.Color:=CB1.ButtonColor;
    DTP1.Color:=CB1.ButtonColor;
    LN1.Color:=CB1.ButtonColor;
    LN2.Color:=CB1.ButtonColor;
    LF1.Color:=CB1.ButtonColor;
    HT1.Color:=CB1.ButtonColor;
    MT1.Color:=CB1.ButtonColor;
    ST1.Color:=CB1.ButtonColor;
            SF2:=Tinifile.Create(SF1);
      sf2.writeInteger('font','Color Black',CB1.ButtonColor);
end;

procedure TForm1.CBF1Click(Sender: TObject);
begin

end;

procedure TForm1.CF1Click(Sender: TObject);
begin

end;

procedure TForm1.CF1ColorChanged(Sender: TObject);
begin
    form1.Font.Color:=CF1.ButtonColor;
        SF2:=Tinifile.Create(SF1);
      sf2.writeInteger('font','Color Font',CF1.ButtonColor);
end;

procedure TForm1.CG1Click(Sender: TObject);
begin

end;

procedure TForm1.SACBF1Change(Sender: TObject);
begin
  if (CBF1.Caption='Change Back Form') and (SACBF1.Checked=false) Then
  begin
    CBF1.Caption:='Counter';
    NS1.Top:=1000;
    NNS1.Top:=152;
  end
  else
  begin
    CBF1.Caption:='Change Back Form';
    NS1.Top:=152;
    NNS1.Top:=1000;
  end;
end;

procedure TForm1.Del1Click(Sender: TObject);
begin

end;

procedure TForm1.Smove1Click(Sender: TObject);
begin

end;

procedure TForm1.CF1Change(Sender: TObject);
begin


end;

procedure TForm1.DE1Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   NS1.Lines.loadfromFile('Note Show How much Timer to end.txt');
      LF1.Items.Assign(screen.Fonts);
   SF2:=Tinifile.Create(SF1);

  SB1.Position:=sf2.ReadInteger('font','size',0);
   CB1.ButtonColor:=sf2.ReadInteger('font','Color Black',1);
   CF1.ButtonColor:=sf2.ReadInteger('font','Color Font',2);
   CG1.Checked[0]:=sf2.ReadBool('font','Underline',false);
   CG1.Checked[1]:=sf2.ReadBool('font','Bold',false);
   CG1.Checked[2]:=sf2.ReadBool('font','Italic',false);
   //StrikeThrough
   CG1.Checked[3]:=sf2.ReadBool('font','StrikeThrough',false);
   form1.Font.Bold:= CG1.Checked[1];
   form1.Font.Italic:= CG1.Checked[2];
   form1.Font.StrikeThrough:= CG1.Checked[3];
   form1.Font.Underline:= CG1.Checked[0];
   NS1.Color:=CB1.ButtonColor;
  NNS1.Color:=CB1.ButtonColor;
   DTP1.Color:=CB1.ButtonColor;
   LN1.Color:=CB1.ButtonColor;
   LN2.Color:=CB1.ButtonColor;
   LF1.Color:=CB1.ButtonColor;
   HT1.Color:=CB1.ButtonColor;
   MT1.Color:=CB1.ButtonColor;
   ST1.Color:=CB1.ButtonColor;
  form1.Font.Size:=SB1.Position;
  form1.Font.Color:=CF1.ButtonColor;
end;

procedure TForm1.LD1Change(Sender: TObject);
begin

end;

procedure TForm1.LD2Change(Sender: TObject);
begin

end;

procedure TForm1.LF1Click(Sender: TObject);
begin
 form1.Font.Name:=LF1.Items[lf1.Itemindex];
   SF2:=Tinifile.Create(SF1);
 SF2.WriteString('font','Name',LF1.Items[lf1.Itemindex]);
end;

procedure TForm1.LN1Click(Sender: TObject);
begin

end;
procedure TForm1.LN2Click(Sender: TObject);
begin

end;

end.


