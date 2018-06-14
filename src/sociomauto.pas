program sociomauto;

{$MODE OBJFPC}
{$H+}

{$I env.inc}

uses lua52, dynlibs, json;

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


var luaCtxConf: Plua_State;
    result: integer;

begin
    luaCtxConf := luaL_newstate(); (* 5.2 change *)
    luaL_openlibs(luaCtxConf);
    result := luaL_dostring(luaCtxConf, 'print "Hello from lua;"');
    lua_close(luaCtxConf); 

    WriteLn('Hello world.');
end.