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
    CG2: TCheckBox;
    CG3: TCheckBox;
    CG4: TCheckBox;
    CG1: TCheckBox;
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

    procedure CB1ColorChanged(Sender: TObject);


    procedure CF1ColorChanged(Sender: TObject);
    procedure CG1Change(Sender: TObject);
    procedure CG1ChangeBounds(Sender: TObject);
    procedure CG2Change(Sender: TObject);
    procedure CG3Change(Sender: TObject);
    procedure CG4Change(Sender: TObject);
    procedure DG1Click(Sender: TObject);

    procedure SACBF1Change(Sender: TObject);


    procedure FormCreate(Sender: TObject);

    procedure LF1Click(Sender: TObject);



    procedure SB1Change(Sender: TObject);
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


procedure TForm1.SB1Change(Sender: TObject);
begin
  form1.Font.Size:=SB1.Position;
  sf2.writeInteger('font','size',SB1.Position);
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

end;



procedure TForm1.ATD1Click(Sender: TObject);
begin
 T1:=3600*HT1.Value+60*MT1.Value+ST1.Value;
    NS1.Lines.Add(timetostr(DTP1.Time+T1/86400));
      ln2.Items.Add(inttostr(T1));
       ln1.Items.Add(timetostr(T1/86400));
         NS1.Lines.SaveToFile('Note Show How much Timer to end.txt');
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


procedure TForm1.CF1ColorChanged(Sender: TObject);
begin
    form1.Font.Color:=CF1.ButtonColor;
        SF2:=Tinifile.Create(SF1);
      sf2.writeInteger('font','Color Font',CF1.ButtonColor);
end;

procedure TForm1.CG1Change(Sender: TObject);
begin
    form1.Font.Underline:= CG1.Checked;
    SF2:=Tinifile.Create(SF1);
    SF2.WriteBool('font','Underline',CG1.Checked);
end;

procedure TForm1.CG1ChangeBounds(Sender: TObject);
begin

end;

procedure TForm1.CG2Change(Sender: TObject);
begin
     form1.Font.Bold:= CG2.Checked;
    SF2:=Tinifile.Create(SF1);
    SF2.WriteBool('font','Bold',CG2.Checked);
end;

procedure TForm1.CG3Change(Sender: TObject);
begin
       form1.Font.Italic:= CG3.Checked;
    SF2:=Tinifile.Create(SF1);
    SF2.WriteBool('font','italic',CG3.Checked);
end;

procedure TForm1.CG4Change(Sender: TObject);
begin
      form1.Font.StrikeThrough:= CG4.Checked;
    SF2:=Tinifile.Create(SF1);
    SF2.WriteBool('font','StrikeThrough',CG4.Checked);
end;

procedure TForm1.DG1Click(Sender: TObject);
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



procedure TForm1.FormCreate(Sender: TObject);
begin
      LF1.Items.Assign(screen.Fonts);
   SF2:=Tinifile.Create(SF1);

  SB1.Position:=sf2.ReadInteger('font','size',0);
   CB1.ButtonColor:=sf2.ReadInteger('font','Color Black',16777215);
   CF1.ButtonColor:=sf2.ReadInteger('font','Color Font',0);
   CG1.Checked:=sf2.ReadBool('font','Underline',false);
   CG2.Checked:=sf2.ReadBool('font','Bold',false);
   CG3.Checked:=sf2.ReadBool('font','Italic',false);
   //StrikeThrough
   CG4.Checked:=sf2.ReadBool('font','StrikeThrough',false);

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

procedure TForm1.LF1Click(Sender: TObject);
begin
 form1.Font.Name:=LF1.Items[lf1.Itemindex];
   SF2:=Tinifile.Create(SF1);
 SF2.WriteString('font','Name',LF1.Items[lf1.Itemindex]);
end;



end.


