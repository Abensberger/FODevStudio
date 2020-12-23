unit processExt;

{$mode objfpc}{$H+}

interface

uses
  Classes, Forms, SysUtils, Process;

const
  C_BUFSIZE = 2048;
type

  TLogEvent = procedure(LogMessageText: String) of object;

  { TProcessExt }

  TProcessExt = class(TProcess)
  private
  public
      OnLogMessage : TLogEvent;
      constructor Create(aOwner:TComponent); override;
      procedure execute; override;
  end;

implementation

{ TProcessExt }

constructor TProcessExt.Create(aOwner:TComponent);
begin
  inherited create(aOwner);
  Options := [poUsePipes, poStdErrToOutput, poNewConsole];
  ShowWindow := swoHide;
end;

procedure TProcessExt.execute;
var
  Buffer: pointer;
  SStream: TStringStream;
  nread: longint;
begin
  inherited execute;
  // Prepare for capturing output
  Getmem(Buffer, C_BUFSIZE);
  SStream := TStringStream.Create(EmptyStr);

  // Start capturing output
  while Running and Active do
  begin
    nread := Output.Read(Buffer^, C_BUFSIZE);
    if nread = 0 then
      sleep(100)
    else
      begin
        // Translate raw input to a string
        SStream.size := 0;
        SStream.Write(Buffer^, nread);
        // And add the raw stringdata to the memo
        if Assigned(OnLogMessage) then
           OnLogMessage(SStream.DataString);
      end;
    Application.ProcessMessages;
  end;

  // Capture remainder of the output
  repeat
    nread := Output.Read(Buffer^, C_BUFSIZE);
    if nread > 0 then
    begin
      SStream.size := 0;
      SStream.Write(Buffer^, nread);
      if Assigned(OnLogMessage) then
         OnLogMessage(SStream.DataString);
    end
  until nread = 0;

  // Clean up
  Freemem(buffer);
  SStream.Free;
end;

end.

