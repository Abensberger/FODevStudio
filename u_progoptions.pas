unit u_progoptions;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, ExtCtrls,
  Buttons, StdCtrls;

type

  { TProgOptions }

  TProgOptions = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    FontDialog1: TFontDialog;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  ProgOptions: TProgOptions;

implementation

{$R *.lfm}

{ TProgOptions }

procedure TProgOptions.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TProgOptions.Button1Click(Sender: TObject);
begin
  if FontDialog1.Execute then
  begin
    Edit1.text := FontDialog1.Font.Name;
    Edit2.text := IntToStr(FontDialog1.Font.Size);
  end;
end;

end.

