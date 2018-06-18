unit scmFile;

{$MODE OBJFPC}{$H+}

interface

uses {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  SysUtils, StrUtils;

function file_ReadTextFile(path : AnsiString) : AnsiString;

implementation

function file_ReadTextFile(path : AnsiString) : AnsiString;
var
    f : TextFile;
    s : AnsiString;
begin

    Result := '';
    if FileExists(path) then
    begin
        AssignFile(f, path);

        (* Open for reading at top *)
        Reset(f);

        while not eof(f) do
        begin
            readln(f, s);
            Result := Result + s + #10;
        end;
    end;
end;

end.