unit scmDb;

{$MODE OBJFPC}{$H+}

interface

uses {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  SQLite3Wrap, SysUtils;

type
    Pdb_Context = ^db_Context;
    db_Context = record
        db : TSQLite3Database;
    end;

function db_Get(path : AnsiString) : Pdb_Context;
function db_Close(ctx : Pdb_Context) : Boolean;
//function db_IsInitialized(path : AnsiString) : Boolean;
//function db_Initialize(path : AnsiString) : Boolean;
//function db_Query(db : Pdb_Context) : 


implementation

uses scmFile;

function db_local_GetInitializationScript() : AnsiString;
begin
    Result := file_ReadTextFile('res/initialize.sql');
end;

function db_Get(path : AnsiString) : Pdb_Context;
var
    initialize : Boolean = False;
    initScript : AnsiString;
begin

    (* Check if the file exists *)
    if not FileExists(path) then
    begin
        initialize := True;
    end;

    New(Result);

    Result^.db := TSQLite3Database.Create();
    Result^.db.Open(path);

    if initialize then
    begin
        (* Setup table structures *)
        WriteLn('Init Database');
        initScript := db_local_GetInitializationScript();
        WriteLn(initScript);
        Result^.db.Execute(initScript);
    end;

    

end;

function db_Close(ctx : Pdb_Context) : Boolean;
begin

    ctx^.db.Close();

    Result := True;

    Dispose(ctx);

end;


end.