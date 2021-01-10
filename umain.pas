unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus,
  ActnList, ExtCtrls, StdCtrls, Buttons,
  LConvEncoding,
  ProcessExt,
  SynEdit, SynHighlighterXML,
  laz2_DOM,
  laz2_XMLRead,
  laz2_XMLWrite, ExtendedNotebook,
  IniFiles,
  u_progOptions,
  PdfiumCore,
  PdfiumCtrl,
  uSplash;

const _BLINDTEXT = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'+
                   #13#10+
                   'Aenean commodo ligula eget dolor.'+#13#10+
                   'Aenean massa.'+#13#10+
                   'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'+#13#10+
                   'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.'+#13#10+
                   'Nulla consequat massa quis enim.'+#13#10+
                   'Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.'+#13+#10+
                   'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.'+#13#10+
                   'Nullam dictum felis eu pede mollis pretium.'+#13#10+
                   'Integer tincidunt.';

type

  { TForm1 }

  TForm1 = class(TForm)
    actApplicationClose: TAction;
    actApplicationInfo: TAction;
    actFileOpen: TAction;
    actFileSave: TAction;
    actFileNew: TAction;
    actFileSaveAs: TAction;
    actExecCompile: TAction;
    actExecCreatePDF: TAction;
    actEditCut: TAction;
    actEditCopy: TAction;
    actEditPaste: TAction;
    actEditSelectAll: TAction;
    actEditCodeBeautify: TAction;
    actApplicationSettings: TAction;
    actFileClose: TAction;
    actInsertDate: TAction;
    actInsertTime: TAction;
    actEditUndo: TAction;
    actEditRedo: TAction;
    actFO_block: TAction;
    actFO_block_container: TAction;
    actFO_external_graphic: TAction;
    actFO_list_block: TAction;
    actFO_table: TAction;
    actInsertLoremIpsumText: TAction;
    actFontChecker: TAction;
    actViewFullScreenMode: TAction;
    actViewDefault: TAction;
    actViewZoomOut: TAction;
    actViewZoomIn: TAction;
    ActionList1: TActionList;
    BKImages: TImageList;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    DocpMenu: TPopupMenu;
    ExtendedNotebook1: TExtendedNotebook;
    ImageList1: TImageList;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    N11: TMenuItem;
    MenuItem45: TMenuItem;
    N10: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    miFullScreenMode: TMenuItem;
    N9: TMenuItem;
    N8: TMenuItem;
    N7: TMenuItem;
    N6: TMenuItem;
    N5: TMenuItem;
    MenuItem46: TMenuItem;
    MenuItem48: TMenuItem;
    MenuItem52: TMenuItem;
    MenuItem56: TMenuItem;
    MenuItem57: TMenuItem;
    MenuItem58: TMenuItem;
    MenuItem59: TMenuItem;
    mpCloseP: TMenuItem;
    mpDocCopy: TMenuItem;
    mpDocCopyA: TMenuItem;
    mpDocCut: TMenuItem;
    mpDocDeleteBL: TMenuItem;
    mpDocDeleteL: TMenuItem;
    mpDocDeleteW: TMenuItem;
    mpDocInsData: TMenuItem;
    mpDocInsF: TMenuItem;
    mpDocInsFN: TMenuItem;
    mpDocInsTime: TMenuItem;
    mpDocPaste: TMenuItem;
    mpDocRedo: TMenuItem;
    mpDocSelectAll: TMenuItem;
    mpDocSelectP: TMenuItem;
    mpDocSelectW: TMenuItem;
    mpDocUndo: TMenuItem;
    N4: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    N1: TMenuItem;
    OpenFile: TOpenDialog;
    PageControl: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    pnlClient: TPanel;
    SaveFile: TSaveDialog;
    ScrollBox1: TScrollBox;
    SpeedButton1: TSpeedButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    StatusBar: TStatusBar;
    SynEdit1: TSynEdit;
    XEPSynEdit: TSynEdit;
    SynXMLSyn1: TSynXMLSyn;
    MainTimer: TTimer;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure actApplicationCloseExecute(Sender: TObject);
    procedure actApplicationInfoExecute(Sender: TObject);
    procedure actApplicationSettingsExecute(Sender: TObject);
    procedure actEditCodeBeautifyExecute(Sender: TObject);
    procedure actEditCodeBeautifyUpdate(Sender: TObject);
    procedure actEditCopyExecute(Sender: TObject);
    procedure actEditCutExecute(Sender: TObject);
    procedure actEditPasteExecute(Sender: TObject);
    procedure actEditRedoExecute(Sender: TObject);
    procedure actEditSelectAllExecute(Sender: TObject);
    procedure actEditUndoExecute(Sender: TObject);
    procedure actExecCompileExecute(Sender: TObject);
    procedure actExecCompileUpdate(Sender: TObject);
    procedure actExecCreatePDFExecute(Sender: TObject);
    procedure actExecCreatePDFUpdate(Sender: TObject);
    procedure actFileCloseExecute(Sender: TObject);
    procedure actFileExecuteExecute(Sender: TObject);
    procedure actFileNewExecute(Sender: TObject);
    procedure actFileOpenExecute(Sender: TObject);
    procedure actFileSaveAsExecute(Sender: TObject);
    procedure actFileSaveExecute(Sender: TObject);
    procedure actFileShowPDFExecute(Sender: TObject);
    procedure actFontCheckerExecute(Sender: TObject);
    procedure actFontCheckerUpdate(Sender: TObject);
    procedure actFO_blockExecute(Sender: TObject);
    procedure actFO_block_containerExecute(Sender: TObject);
    procedure actFO_external_graphicExecute(Sender: TObject);
    procedure actFO_list_blockExecute(Sender: TObject);
    procedure actFO_tableExecute(Sender: TObject);
    procedure actInsertDateExecute(Sender: TObject);
    procedure actInsertLoremIpsumTextExecute(Sender: TObject);
    procedure actInsertTimeExecute(Sender: TObject);
    procedure actViewDefaultExecute(Sender: TObject);
    procedure actViewFullScreenModeExecute(Sender: TObject);
    procedure actViewZoomInExecute(Sender: TObject);
    procedure actViewZoomOutExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MainTimerTimer(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure sbShowMsgClick(Sender: TObject);
  private
    FCtrl        : TPdfControl;
    CurrentFile  : String;
    LastPrj      : Boolean;
    FirstShow    : Boolean;
    SaveWSP      : Boolean;
    StartFSM     : Boolean;
    ValTransparent : Integer;
    UserFont     : String;
    UserFontSize : Integer;
    function  Check_And_Rebuild_FileName(FileName : String) : String;
    function  Check_SE_Modified(): Boolean;

    function  Create_New_TabSheet(FileName : String): TTabSheet;
    function  Create_New_Z80SynEdit(TB: TTabSheet): TSynEdit;

    procedure Log(aMessage: String);
    procedure Open_new_FO_File;
    procedure Open_FO_File(aFilename : String);
    procedure Save_FO_File(Tab: TTabSheet);
    procedure Load_User_Setting;
    procedure ShowPDFFile(aFileName : String);
    procedure PageChanger(Sender: TObject);
    procedure ShowXEPFile(aFileName : String; ShowInPageControl : Boolean);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{function PrettyXml(const Xml: string): string;
var
  D: IDocument;
begin
  D := DocumentCreate;
  D.Xml := Xml;
  D.Beautify;
  Result := D.Xml;
end;
}

{ TForm1 }

procedure TForm1.actApplicationCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TForm1.actApplicationInfoExecute(Sender: TObject);
begin
  uSplash.Splashform.ShowModal;
end;

procedure TForm1.actApplicationSettingsExecute(Sender: TObject);
Var Ini : TIniFile;
begin
  Ini := TIniFile.Create('Settings.ini');
  with ProgOptions do
  begin
   CheckBox1.Checked := Ini.ReadBool('General', 'Reopen Last Project', False);
   CheckBox2.Checked := Ini.ReadBool('General', 'Start FullScreen', False);
   CheckBox3.Checked := Ini.ReadBool('General', 'Save WSIZEPOS', False);
   CheckBox4.Checked := Ini.ReadBool('General', 'Show Toolbar Hints', True);
   CheckBox5.Checked := Ini.ReadBool('General', 'Show Toolbar Captions', True);

   Edit1.Text        := Ini.ReadString('General','FontName','Courier New');

   if  Assigned(PageControl.ActivePage) and
      (PageControl.ActivePage.ControlCount > 0) then
   begin
    with PageControl.ActivePage.Controls[0] as TSynEdit do
      begin
        Edit2.Text := IntToStr(Font.Size);
      end;
   end
   else
   begin
      Edit2.Text := Ini.ReadString('General','FontSize','10');
   end;

   ShowModal;
   if modalResult = mrOK then
   begin
     Ini.WriteBool('General', 'Reopen Last Project',CheckBox1.Checked);
     Ini.WriteBool('General', 'Start FullScreen',CheckBox2.Checked);
     Ini.WriteBool('General', 'Save WSIZEPOS',CheckBox3.Checked);
     Ini.WriteBool('General', 'Show Toolbar Hints',CheckBox4.Checked);
     Ini.WriteBool('General', 'Show Toolbar Captions',CheckBox5.Checked);
     Ini.WriteString('General','FontName',Edit1.text);
     Ini.WriteString('General','FontSize',Edit2.text);

     if Assigned(PageControl.ActivePage) and
      (PageControl.ActivePage.ControlCount > 0) then
     with PageControl.ActivePage.Controls[0] as TSynEdit do
     begin
       Font.Name := Edit1.text;
       Font.Size := StrToInt(Edit2.Text);
     end;
     UserFont := Edit1.text;
     UserFontSize := StrToInt(Edit2.Text);
     Toolbar.ShowHint     := Checkbox4.Checked;
     Toolbar.ShowCaptions := Checkbox5.Checked;
   end;

  end;
  Ini.Free;

end;

procedure TForm1.actEditCodeBeautifyExecute(Sender: TObject);
var
  s : String;
  ss, sout : TStringStream;
  XML : TXMLDocument;
begin

  s := (PageControl.ActivePage.Controls[0] as TSynEdit).Lines.Text;

  s := StringReplace(s,'&#x','~~~',[rfReplaceAll]);

  ss := TStringStream.Create(s);
  XML := nil;
  ReadXMLFile(XML,SS);
  sout := TStringStream.Create('');
  laz2_XMLWrite.WriteXMLFile(XML,sout);
  sout.Position := 0;

  s := StringReplace(sOut.DataString,'~~~','&#x',[rfReplaceAll]);

  (PageControl.ActivePage.Controls[0] as TSynEdit).Lines.Text := s;

  //PrettyXml(s);
end;

procedure TForm1.actEditCodeBeautifyUpdate(Sender: TObject);
begin
  actEditCodeBeautify.Enabled := Assigned(PageControl.ActivePage)
end;

procedure TForm1.actEditCopyExecute(Sender: TObject);
begin

end;

procedure TForm1.actEditCutExecute(Sender: TObject);
begin

end;

procedure TForm1.actEditPasteExecute(Sender: TObject);
begin

end;

procedure TForm1.actEditRedoExecute(Sender: TObject);
begin
  if Assigned(PageControl.ActivePage) then
    with PageControl.ActivePage.Controls[0] as TSynEdit do
      Redo;

end;

procedure TForm1.actEditSelectAllExecute(Sender: TObject);
begin
  if Assigned(PageControl.ActivePage) then
    with PageControl.ActivePage.Controls[0] as TSynEdit do
      SelectAll;

end;

procedure TForm1.actEditUndoExecute(Sender: TObject);
begin
  if Assigned(PageControl.ActivePage) then
    with PageControl.ActivePage.Controls[0] as TSynEdit do
      Undo;

end;

function TForm1.Check_SE_Modified(): Boolean;
 Var Ind : Integer;
begin
 Result := False;

 If PageControl.PageCount > 0 Then
  For Ind := 0 To PageControl.PageCount - 1 Do
   If PageControl.Pages[Ind].Controls[0] Is TSynEdit Then
    If TSynEdit(PageControl.Pages[Ind].Controls[0]).Modified Then
     Begin
      Result := True;

      Break;
     End;
end;

procedure TForm1.actExecCompileExecute(Sender: TObject);
Var P : TProcessExt;
    RenderXPath, RenderXArgs : String;
begin
  if UpperCase(ExtractFileExt(Currentfile)) <> '.FO' then
     exit;

//  If Check_SE_Modified() Then
     Save_FO_File(PageControl.ActivePage);

{   If MessageDlg('Project code changed, save before assembly?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
    mSavePrjClick(Sender);

}

try
  try
  if Assigned(FCtrl) then
    begin
      FCtrl.Free;
    end;
   except

   end;
finally
  FCtrl := nil;
end;

  Panel2.Hide;

  RenderXPath := ExtractFilePath(Application.ExeName);
  RenderXPath := IncludeTrailingPathDelimiter(RenderXPath + 'RenderX');

  RenderXPath := RenderXPath + 'FO2XEP.BAT';

  If FileExists(RenderXPath) Then
   Begin
    SynEdit1.Lines.Clear;
    Log('Start build "' + ChangeFileExt(CurrentFile,'.XEP') + '" at ' + DateTimeToStr(Now)+#13#10);
    Log(''+#13#10);

    P := TProcessExt.Create(Nil);

    RenderXArgs := Format('%s',[CurrentFile]);

//    CmdLine := '"' + RenderXPath + '"' + ' ' + RenderXArgs;

    P.OnLogMessage:=@Log;
    P.Executable := RenderXPath;
    P.Parameters.Clear;
    P.Parameters.Text := CurrentFile;
    P.Execute;
    P.Free;

    Log(''+#13#10);
    Log('End build "' + ChangeFileExt(CurrentFile,'.XEP') + '" at ' + DateTimeToStr(Now)+#13#10);

    if FileExists(ChangeFileExt(CurrentFile,'.XEP')) then
//       Open_XEP_File(ChangeFileExt(CurrentFile,'.XEP'));
       ShowXEPFile(ChangeFileExt(CurrentFile,'.XEP'), true);
   End;
end;

procedure TForm1.actExecCompileUpdate(Sender: TObject);
begin
  actExecCompile.Enabled := Assigned(PageControl.ActivePage);
end;

procedure TForm1.actExecCreatePDFExecute(Sender: TObject);
Var P : TProcessExt;
    RenderXPath, RenderXArgs, CmdLine : String;
begin
  if UpperCase(ExtractFileExt(Currentfile)) <> '.FO' then
     exit;
  //  If Check_SE_Modified() Then
     Save_FO_File(PageControl.ActivePage);
  try
    try
    if Assigned(FCtrl) then
      begin
        FCtrl.Free;
      end;
     except

     end;
  finally
    FCtrl := nil;
  end;

  Panel2.Hide;

  RenderXPath := ExtractFilePath(Application.ExeName);
  RenderXPath := IncludeTrailingPathDelimiter(RenderXPath + 'RenderX');

  RenderXPath := RenderXPath + 'FO2PDF.BAT';

  If FileExists(RenderXPath) Then
   Begin
    SynEdit1.Lines.Clear;
    Log('Start build "' + ChangeFileExt(CurrentFile,'.PDF') + '" at ' + DateTimeToStr(Now)+#13#10);
    Log(''+#13#10);

    P := TProcessExt.Create(Nil);

    RenderXArgs := Format('%s',[CurrentFile]);

    CmdLine := '"' + RenderXPath + '"' + ' ' + RenderXArgs;

    P.OnLogMessage:=@Log;
    P.Executable := RenderXPath;
    P.Parameters.Clear;
    P.Parameters.Text := CurrentFile;
    P.Execute;
    P.Free;

    Log(''+#13#10);
    Log('End build "' + ChangeFileExt(CurrentFile,'.PDF') + '" at ' + DateTimeToStr(Now)+#13#10);

   End;
  if FileExists(ChangeFileExt(CurrentFile,'.XEP')) then
     ShowXEPFile(ChangeFileExt(CurrentFile,'.XEP'),false);
  if FileExists(ChangeFileExt(CurrentFile,'.PDF')) then
     ShowPDFFile(ChangeFileExt(CurrentFile,'.PDF'));
end;

procedure TForm1.actExecCreatePDFUpdate(Sender: TObject);
begin
  actExecCreatePDF.Enabled := Assigned(PageControl.ActivePage);
end;

procedure TForm1.actFileCloseExecute(Sender: TObject);
begin
  if Assigned(PageControl.ActivePage) then
 begin
   PageControl.ActivePage.Destroy;
 end;
end;

procedure TForm1.actFileExecuteExecute(Sender: TObject);
begin

end;

procedure TForm1.actFileNewExecute(Sender: TObject);
begin
  Open_new_FO_File;
end;

procedure TForm1.actFileOpenExecute(Sender: TObject);
begin
  If OpenFile.Execute Then
   Begin
    Open_FO_File(OpenFile.FileName);

{    TSynEdit(PageControl.ActivePage.Controls[0]).Highlighter := Nil;
}   End;

end;

procedure TForm1.actFileSaveAsExecute(Sender: TObject);
begin
  If Assigned(PageControl.ActivePage) Then
   Begin
    If SaveFile.Execute Then
     Begin
      With (PageControl.ActivePage.Controls[0] As TSynEdit) Do
       Begin
        Lines.SaveToFile(SaveFile.FileName);
        PageControl.ActivePage.Caption := ExtractFileName(SaveFile.Filename);
        TStaticText(PageControl.ActivePage.Controls[1]).Caption := SaveFile.FileName;
        CurrentFile := SaveFile.FileName;
        MarkTextAsSaved;
       End;
     End;
   End;
end;

procedure TForm1.actFileSaveExecute(Sender: TObject);
begin
  If Assigned(PageControl.ActivePage) Then
    Save_FO_File(PageControl.ActivePage);
end;

procedure TForm1.actFileShowPDFExecute(Sender: TObject);
begin

end;

procedure TForm1.actFontCheckerExecute(Sender: TObject);
Var P : TProcessExt;
    S, ToolsPath, ToolsProg, ToolsArgs, CmdLine : String;
    SL : TStringList;
begin
  if Assigned(PageControl.ActivePage) Then
  Begin
   try
     try
     if Assigned(FCtrl) then
       begin
         FCtrl.Free;
       end;
      except

      end;
   finally
     FCtrl := nil;
   end;

   Panel2.Hide;


   ToolsPath := ExtractFilePath(Application.ExeName);
    ToolsPath := IncludeTrailingPathDelimiter(ToolsPath + 'RenderX');

    ToolsProg := ToolsPath+'CHECKPDF.BAT';

    Log('Start font checking "' + ChangeFileExt(CurrentFile,'.PDF') + '" at ' + DateTimeToStr(Now)+#13#10);
    Log(''+#13#10);

    P := TProcessExt.Create(Nil);

    ToolsArgs := CurrentFile;

    Log(ToolsProg+#13#10);
    Log(ToolsArgs+#13#10);

//    CmdLine := '"' + RenderXPath + '"' + ' ' + RenderXArgs;

    P.OnLogMessage:=@Log;
    P.Executable := ToolsProg;
    P.Parameters.Clear;
    P.Parameters.Text := ToolsArgs;
    P.Execute;
    P.Free;

    SL := TStringList.Create;
    SL.LoadFromFile(ExtractFilePath(CurrentFile)+'OUT.XML');
    for s in SL do
       Log(s+#13#10);

    Log(''+#13#10);
    Log('End font checking "' + ChangeFileExt(CurrentFile,'.PDF') + '" at ' + DateTimeToStr(Now)+#13#10);

   End
end;

procedure TForm1.actFontCheckerUpdate(Sender: TObject);
begin
  actFontChecker.Enabled := Assigned(PageControl.ActivePage);
end;

procedure TForm1.actFO_blockExecute(Sender: TObject);
begin
  if Assigned(PageControl.ActivePage) then
    with PageControl.ActivePage.Controls[0] as TSynEdit do
      InsertTextAtCaret('<fo:block></fo:block>');
end;

procedure TForm1.actFO_block_containerExecute(Sender: TObject);
begin
  if Assigned(PageControl.ActivePage) then
    with PageControl.ActivePage.Controls[0] as TSynEdit do
      InsertTextAtCaret('<fo:block-container></fo:block-container>');

end;

procedure TForm1.actFO_external_graphicExecute(Sender: TObject);
begin
  if Assigned(PageControl.ActivePage) then
    with PageControl.ActivePage.Controls[0] as TSynEdit do
      InsertTextAtCaret('<fo:external-graphic src="url('')"></fo:external-graphic>');

end;

procedure TForm1.actFO_list_blockExecute(Sender: TObject);
begin
  if Assigned(PageControl.ActivePage) then
    with PageControl.ActivePage.Controls[0] as TSynEdit do
    begin
      InsertTextAtCaret('<fo:list-block text-align="left" provisional-distance-between-starts="20mm" start-indent="0mm" end-indent="10mm">'+#13#10);
      InsertTextAtCaret('   <fo:list-item>'+#13#10);
      InsertTextAtCaret('      <fo:list-item-label end-indent="label-end()">'+#13#10);
      InsertTextAtCaret('	  <fo:block background-color="yellow">???</fo:block>'+#13#10);
      InsertTextAtCaret('      </fo:list-item-label>'+#13#10);
      InsertTextAtCaret('      <fo:list-item-body start-indent="body-start()">'+#13#10);
      InsertTextAtCaret('	  <fo:block background-color="lightblue">???</fo:block>'+#13#10);
      InsertTextAtCaret('	</fo:list-item-body>'+#13#10);
      InsertTextAtCaret('   </fo:list-item>'+#13#10);
      InsertTextAtCaret('</fo:list-block>'+#13#10);
    end;

end;

procedure TForm1.actFO_tableExecute(Sender: TObject);
begin
  if Assigned(PageControl.ActivePage) then
    with PageControl.ActivePage.Controls[0] as TSynEdit do
    begin

      InsertTextAtCaret('<fo:table width="100%">'+#13#10);
      InsertTextAtCaret('<fo:table-column column-width="50%"/>'+#13#10);
      InsertTextAtCaret('<fo:table-column column-width="50%"/>'+#13#10);
      InsertTextAtCaret('<fo:table-body>'+#13#10);
      InsertTextAtCaret('<fo:table-row>'+#13#10);
      InsertTextAtCaret('<fo:table-cell>'+#13#10);
      InsertTextAtCaret('<fo:block>Inhalt1</fo:block>'+#13#10);
      InsertTextAtCaret('</fo:table-cell>'+#13#10);
      InsertTextAtCaret('<fo:table-cell>'+#13#10);
      InsertTextAtCaret('<fo:block>Inhalt2</fo:block>'+#13#10);
      InsertTextAtCaret('</fo:table-cell>'+#13#10);
      InsertTextAtCaret('</fo:table-row>'+#13#10);
      InsertTextAtCaret('</fo:table-body>'+#13#10);

      InsertTextAtCaret('</fo:table>');
    end;

end;

procedure TForm1.actInsertDateExecute(Sender: TObject);
begin
  if Assigned(PageControl.ActivePage) then
    with PageControl.ActivePage.Controls[0] as TSynEdit do
      InsertTextAtCaret(DateToStr(Now))
end;

procedure TForm1.actInsertLoremIpsumTextExecute(Sender: TObject);
begin
  if Assigned(PageControl.ActivePage) then
    with PageControl.ActivePage.Controls[0] as TSynEdit do
    begin
      InsertTextAtCaret('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, '+#13#10);
    end;
end;

procedure TForm1.actInsertTimeExecute(Sender: TObject);
begin
  if Assigned(PageControl.ActivePage) then
    with PageControl.ActivePage.Controls[0] as TSynEdit do
      InsertTextAtCaret(TimeToStr(Now))

end;

procedure TForm1.actViewDefaultExecute(Sender: TObject);
begin
  if Assigned(PageControl.ActivePage) then
    with PageControl.ActivePage.Controls[0] as TSynEdit do
      Font.Size := 9;

end;

procedure TForm1.actViewFullScreenModeExecute(Sender: TObject);
{$J+} //writeable constants on
const
  Rect: TRect = (Left:0; Top:0; Right:0; Bottom:0);
  Ws : TWindowState = wsNormal;
{$J-} //writeable constants off

 Var R : TRect;
begin
  miFullScreenMode.Checked := Not miFullScreenMode.Checked;

  if BorderStyle <> bsNone then
  begin
    ToolBar.Visible := False;
    StatusBar.Visible := False;

    Ws := WindowState;
    Rect := BoundsRect;
    BorderStyle := bsNone;

    R := Screen.MonitorFromWindow(Handle).BoundsRect;

    SetBounds(R.Left, R.Top, R.Right - R.Left, R.Bottom - R.Top);
  end
  else
  begin
    BorderStyle := bsSizeable;

    StatusBar.Visible := True;
    ToolBar.Visible := True;

    if Ws = wsMaximized Then
      WindowState := wsMaximized
    else
      SetBounds(Rect.Left, Rect.Top, Rect.Right - Rect.Left, Rect.Bottom - Rect.Top) ;
  End;
end;

procedure TForm1.actViewZoomInExecute(Sender: TObject);
begin
  if Assigned(PageControl.ActivePage) then
    with PageControl.ActivePage.Controls[0] as TSynEdit do
      Font.Size := Font.Size + 1;
end;

procedure TForm1.actViewZoomOutExecute(Sender: TObject);
begin
  if Assigned(PageControl.ActivePage) then
    with PageControl.ActivePage.Controls[0] as TSynEdit do
      Font.Size := Font.Size - 1;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  FCtrl.GotoPrevPage(True);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FCtrl.GotoNextPage(true);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  case TCombobox(Sender).ItemIndex of
  0 : FCtrl.ScaleMode := smFitAuto;
  1 : FCtrl.ScaleMode := smFitWidth;
  2 : FCtrl.ScaleMode := smFitHeight;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FirstShow := True;
  SaveWSP   := False;
  StartFSM  := False;
  OpenFile.InitialDir := ExtractFilePath(Application.ExeName);
  If Not FileExists('Settings.ini') Then
   Begin
{    sZ80 := TMySynZ80Syn.Create(Self);

    sZ80.CommentAttri.Background := clNone;
    sZ80.CommentAttri.Foreground := clOlive;
    sZ80.CommentAttri.Style := [fsItalic];

    sZ80.KeyAttri.Style := [fsBold];

    sZ80.NumberAttri.Foreground := clFuchsia;

    sZ80.StringAttri.Foreground := clRed;

    sZ80.SymbolAttri.Foreground := clBlue;
}   End
  Else
   Load_User_Setting();

  If StartFSM Then
     actViewFullScreenModeExecute(Sender);
  SynEdit1.Clear;

  XEPSynEdit.Align := alClient;
  XEPSynEdit.HideSelection := False;
  XEPSynEdit.WantTabs := True;
  XEPSynEdit.Highlighter := synXMLSyn1;
  XEPSynEdit.Font.Name := UserFont;
  XEPSynEdit.Font.Size := UserFontSize;
  XEPSynEdit.ScrollBars := ssAutoBoth;
  XEPSynEdit.BookMarkOptions.BookmarkImages := BKImages;
  XEPSynEdit.PopupMenu := DocpMenu;
  XEPSynEdit.Options := XEPSynEdit.Options + [eoShowScrollHint] + [eoSmartTabDelete] - [eoSmartTabs];
  XEPSynEdit.Options2 := XEPSynEdit.Options2 + [eoEnhanceEndKey];
  XEPSynEdit.Clear;


end;

procedure TForm1.FormDblClick(Sender: TObject);
begin

end;

procedure TForm1.FormDestroy(Sender: TObject);
Var
  IniFile : TIniFile;
begin
  MainTimer.Enabled := False;
  ChDir(ExtractFilePath(Application.ExeName));
  if FileExists('startup.ini') then
     DeleteFile('startup.ini');
  IniFile := TIniFile.Create('startup.ini');
  IniFile.WriteBool('WindowPosOpt', 'Maximized', WindowState = wsMaximized);
  IniFile.WriteInteger('WindowPosOpt', 'Width', Width);
  IniFile.WriteInteger('WindowPosOpt', 'Height', Height);
  IniFile.WriteInteger('WindowPosOpt', 'Top', Top);
  IniFile.WriteInteger('WindowPosOpt', 'Left', Left);
  IniFile.Free;
end;

procedure TForm1.FormPaint(Sender: TObject);
Var IniFile : TIniFile;
    Max : Boolean;
    W, H, L, T, Ind : Integer;
begin
If FirstShow Then
 Begin
  If FileExists('startup.ini') Then
   Begin
    IniFile := TIniFile.Create('startup.ini');
    Max := IniFile.ReadBool('WindowPosOpt', 'Maximized', False);
    W := IniFile.ReadInteger('WindowPosOpt', 'Width', 640);
    H := IniFile.ReadInteger('WindowPosOpt', 'Height', 480);
    T := IniFile.ReadInteger('WindowPosOpt', 'Top', 0);
    L := IniFile.ReadInteger('WindowPosOpt', 'Left', 0);
    IniFile.Free;

    If SaveWSP And Not StartFSM Then
     Begin
      If Max Then
       Self.WindowState := wsMaximized
      Else
       Begin
        Self.WindowState := wsNormal;
        Self.Position := poDesigned;

        Self.Width := W;
        Self.Height := H;
        Self.Top := T;
        Self.Left := L;
       End;
     End;
   End;

  FirstShow := False;

  MainTimer.Enabled := True;
 End;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Splashform.ShowModal;
end;

procedure TForm1.MainTimerTimer(Sender: TObject);
var
  OnlyFilename : String;
begin
  if Assigned(PageControl.ActivePage) then
  begin
    with PageControl.ActivePage.Controls[0] as TSynEdit do
    begin
      OnlyFilename := ExtractFilename(TStaticText(PageControl.ActivePage.Controls[1]).Caption);
      if Modified then
        PageControl.ActivePage.Caption := '*'+OnlyFilename
      else
        PageControl.ActivePage.Caption := OnlyFilename;
    end;
  end;

end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin

end;

procedure TForm1.PageControlChange(Sender: TObject);
begin
  CurrentFile := TStaticText(PageControl.ActivePage.Controls[1]).Caption;
  case UpperCase(ExtractFileExt(CurrentFile)) of
  '.FO' : begin
            actExecCompile.Enabled := True;
            actExecCreatePDF.Enabled := True;
          end; // .FO
  '.XEP' : begin
            actExecCompile.Enabled := False;
            actExecCreatePDF.Enabled := True;
          end; // .XEP
  else    begin
            actExecCompile.Enabled := False;
            actExecCreatePDF.Enabled := False;
          end;  // else

  end; // case

end;

procedure TForm1.sbShowMsgClick(Sender: TObject);
begin

end;

function TForm1.Check_And_Rebuild_FileName(FileName: String): String;
 Var NewFileName : String;
begin
 If Not FileExists(FileName) Then
   Begin
    NewFileName := ExtractFileName(FileName);

    If FileExists(NewFileName) Then
      Result := NewFileName
    Else
      Result := '';
   End
 Else
  Result := FileName;
end;

function TForm1.Create_New_TabSheet(FileName : String): TTabSheet;
 Var Tmp : TTabSheet;
begin
 Tmp := TTabSheet.Create(Nil);
 Tmp.PageControl := PageControl;
 Tmp.Parent := PageControl;
 Tmp.TabVisible := True;

// Tmp.OnShow := @Load_Bookmark_On_ActivePage;

 Tmp.Caption := FileName;

 Result := Tmp;
end;

function TForm1.Create_New_Z80SynEdit(TB: TTabSheet): TSynEdit;
 Var Tmp : TSynEdit;
     Foot : TStaticText;
begin
 Tmp := TSynEdit.Create(Self);
 Tmp.Parent := TB;
 Tmp.Align := alClient;
 Tmp.HideSelection := False;
 Tmp.WantTabs := True;
 Tmp.Highlighter := synXMLSyn1;
 Tmp.Font.Name := UserFont;
 Tmp.Font.Size := UserFontSize;


 Tmp.ScrollBars := ssAutoBoth;
 Tmp.BookMarkOptions.BookmarkImages := BKImages;
 Tmp.PopupMenu := DocpMenu;
 Tmp.Options := Tmp.Options + [eoShowScrollHint] + [eoSmartTabDelete] - [eoSmartTabs];
 Tmp.Options2 := Tmp.Options2 + [eoEnhanceEndKey];
// Tmp.OnClickLink := @SEClickLink;

// SetUp_SynEdit_Options(Tmp);

 Result := Tmp;

 PageControl.Align := alNone;
 PageControl.Width := PageControl.Width - 1;
 PageControl.Width := PageControl.Width + 1;
 PageControl.Align := alClient;

 Foot := TStaticText.Create(Self);
 Foot.Parent := TB;
 Foot.Align := alBottom;
end;

procedure TForm1.Log(aMessage: String);
begin
  SynEdit1.SelText := aMessage;
end;

procedure TForm1.Open_new_FO_File;
Var TB : TTabSheet;
     SE : TSynEdit;
     FName : String;
begin
  FName := 'Untitled1.fo';

  TB := Create_New_TabSheet(FName);

  SE := Create_New_Z80SynEdit(TB);

  TB.Show;
  SE.Lines.Clear;
  SE.Append('<?xml version="1.0"?>');
  SE.Append('<!-- ======================================================  -->');
  SE.Append('<!--                                                         -->');
  SE.Append('<!-- ======================================================  -->');
  SE.Append('<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:rx="http://www.renderx.com/XSL/Extensions">');
  SE.Append('  <fo:layout-master-set>');
  SE.Append('     <fo:simple-page-master master-name="SinglePage" page-width="210mm" page-height="297mm">');
  SE.Append('        <fo:region-body region-name="xsl-region-body" margin="17mm" column-gap="6mm" border="0.25pt solid gray" padding="6pt"/>');
  SE.Append('        <fo:region-before region-name="xsl-region-before" extent="17mm" display-align="after" padding="6pt 17mm"/>');
  SE.Append('        <fo:region-after region-name="xsl-region-after" extent="17mm" display-align="before" padding="6pt 17mm"/>');

  SE.Append('     </fo:simple-page-master>');
  SE.Append('  </fo:layout-master-set>');
  SE.Append('  <fo:page-sequence master-reference="SinglePage" force-page-count="odd">');
  SE.Append('     <fo:flow flow-name="xsl-region-body">');
  SE.Append('        <fo:block text-align="center" font-size="12pt">');
  SE.Append('           Hello World!');
  SE.Append('        </fo:block>');
  SE.Append('     </fo:flow>');
  SE.Append('  </fo:page-sequence>');
  SE.Append('</fo:root>');

  SE.Highlighter.Enabled := True;
  Se.Modified := true;

  SE.SetFocus;

  //  SE.Text := ConvertEncoding(SE.Text, 'Ansi', 'UTF-8');

  TStaticText(PageControl.ActivePage.Controls[1]).Caption := FName;
//  CurrentFile := Fname;
  //  Load_Bookmark_In_Menu(SE, TB);
  PageControlChange(Self)

end;


procedure TForm1.Open_FO_File(aFilename: String);
Var TB : TTabSheet;
    SE : TSynEdit;
    FName : String;
begin
  FName := Check_And_Rebuild_FileName(aFileName);

  If FName = '' Then
     Exit;

  TB := Create_New_TabSheet(ExtractFileName(FName));

  SE := Create_New_Z80SynEdit(TB);

  TB.Show;
  SE.Lines.LoadFromFile(FName);
  SE.Highlighter.Enabled := True;

  SE.SetFocus;

//  SE.Text := ConvertEncoding(SE.Text, 'Ansi', 'UTF-8');

  TStaticText(PageControl.ActivePage.Controls[1]).Caption := FName;
//  Load_Bookmark_In_Menu(SE, TB);
  PageControlChange(Self)

end;

procedure TForm1.Save_FO_File(Tab: TTabSheet);
begin
  With (Tab.Controls[0] As TSynEdit) Do
   Begin
    CurrentFile := TStaticText(Tab.Controls[1]).Caption;
    Lines.SaveToFile(CurrentFile);
    MarkTextAsSaved;
    Modified := False;
   End;
end;

procedure TForm1.Load_User_Setting;
Var Ini : TIniFile;
    NP, Ind : Integer;
begin
   Ini := TIniFile.Create('Settings.ini');
   LastPrj          := Ini.ReadBool('General', 'Reopen Last Project', False);
   StartFSM         := Ini.ReadBool('General', 'Start FSM', False);
   SaveWSP          := Ini.ReadBool('General', 'Save WSIZEPOS', False);
   ValTransparent   := Ini.ReadInteger('General', 'Transparent', 168);
   UserFont         := Ini.ReadString('General', 'FontName', 'Courier New');
   UserFontSize     := Ini.ReadInteger('General', 'FontSize', 10);
   ToolBar.ShowHint := Ini.ReadBool('General','Show Toolbar Hints',Toolbar.ShowHint);
   ToolBar.ShowCaptions := Ini.ReadBool('General','Show Toolbar Captions',Toolbar.ShowCaptions);
   Ini.Free;
end;

procedure TForm1.ShowPDFFile(aFileName: String);
begin
  if FileExists(aFilename) then
  begin
   {$IFDEF CPUX64}
   PDFiumDllDir := ExtractFilePath(ParamStr(0)) + 'x64';
   {$ELSE}
   PDFiumDllDir := ExtractFilePath(ParamStr(0)) + 'x86';
   {$ENDIF CPUX64}
   Panel2.Show;
   FCtrl := TPdfControl.Create(Self);
   FCtrl.Align  := alClient;
   FCtrl.Parent := ScrollBox1;
   FCtrl.SendToBack; // put the control behind the buttons
   FCtrl.Color  := clGray;
   FCtrl.ScaleMode := smFitWidth;
   ComboBox1.ItemIndex := 1;
   FCtrl.PageColor := clWhite; //RGB(255, 255, 200);
   FCtrl.OnPageChange := @PageChanger;
   FCtrl.LoadFromFile(aFileName);
   ExtendedNotebook1.PageIndex := 0;
  end;
end;

procedure TForm1.ShowXEPFile(aFileName: String; ShowInPageControl: Boolean);
begin
  if FileExists(aFilename) then
  begin
   XEPSynEdit.Lines.LoadFromFile(aFileName);
   if ShowInPageControl then
      ExtendedNotebook1.PageIndex := 1;
  end;
end;


procedure TForm1.PageChanger(Sender: TObject);
begin
  Label1.caption := format('%d/%d',[FCtrl.PageIndex+1,FCtrl.PageCount]);
end;


end.

