unit usplash;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  BCSVGViewer;

type

  { TSplashform }

  TSplashform = class(TForm)
    BCSVGViewer1: TBCSVGViewer;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Splashform: TSplashform;

implementation

{$R *.lfm}

{ TSplashform }

procedure TSplashform.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Button1.Visible := True;
  Close;
end;

procedure TSplashform.Button1Click(Sender: TObject);
begin
  Timer1.Enabled := False;
  Close;
end;

procedure TSplashform.FormCreate(Sender: TObject);
begin
  BCSVGViewer1.LoadFromFile('media\xslfo3.svg');
end;

procedure TSplashform.FormShow(Sender: TObject);
begin
  Timer1.Enabled := not Button1.Visible;
end;

end.

