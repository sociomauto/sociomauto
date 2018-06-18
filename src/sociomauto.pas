program sociomauto;

{$MODE OBJFPC}
{$H+}

{$I env.inc}

uses {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  lua52, dynlibs, fpjson, scmDb;

(*
    Sociomauto: Free + Open Source
         Marketing Automation

    Description:
        A single application extensible via DLLs (plugins) with a threaded
        architecture to help faciliate multiple peices of the system running
        together. While this isn't the most scalable, it is the least time
        consuming, to get this project off the ground.

    Calling conventions:
        Plugins will have a standard HOOK mechanism to register event handlers
        and the like. Which will receive JSON data as the param.
*)

var
    dbPath : String;


procedure l_PrintType(ctx : Plua_State; idx : Integer);
begin
    if lua_isboolean(ctx, idx) then
        if lua_toboolean(ctx, idx) then
            WriteLn(idx, ' is boolean: TRUE')
        else
            WriteLn(idx, ' is boolean: FALSE')

    else if lua_isnumber(ctx, idx) then
    begin
        WriteLn(idx, ' is number: ', lua_tonumber(ctx, idx));

        WriteLn(luaL_checkinteger(ctx, -idx));
    end;
end;

function conf_SetDatabase(ctx : Plua_State) : Integer; cdecl;
begin
    Result := 0;

    dbPath := lua_tostring(ctx, -1);
    WriteLn(dbPath);
end;

function conf_SetEnv(ctx : Plua_State) : Integer; cdecl;
var env : AnsiString;
begin

    //l_PrintType(ctx, -1);
    env := lua_tostring(ctx, -1);

    Result := 0;

end;


var luaCtxConf : Plua_State;
    result : Integer;
    db_ctx : Pdb_Context;

begin
    luaCtxConf := luaL_newstate(); (* 5.2 change *)
    luaL_openlibs(luaCtxConf);

    (* Add configuration functions into lua context *)
    //lua_pushliteral(luaCtxConf, 'SetEnv');
    lua_register(luaCtxConf, 'SetEnv', @conf_SetEnv);
    lua_register(luaCtxConf, 'SetDatabase', @conf_SetDatabase);

    result := luaL_dostring(luaCtxConf, 
                'print "Hello from lua;"'#10
              + 'SetEnv(true)'#10
              + 'SetEnv(1.02)'#10
              + 'SetDatabase("testdb.db")');
    lua_close(luaCtxConf);

    db_ctx := db_get(dbPath);

    db_close(db_ctx);

    WriteLn('Hello world.');
end.