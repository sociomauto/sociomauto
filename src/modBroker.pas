program modBroker;

{$MODE FPC}

(*
    modBroker
        is a sort of communication manager for Sociomauto
    receiving requests from all mods, and publishing them to
    the appropriate workers.


    Example REQ -> REP:
        modAppsrv, page visited on website -> Send Info to modCore
            {"method": "core.regActivity", "params": {"ip": "127.0.0.1", "guid": "...", ...} ...}

        modAppsrv -> modBroker -> modCore



*)

var
    zctx : pointer;

    master_pipe : pointer;
    receiver_pipe : pointer;


begin

    zctx := zmq_ctx_new();
    master_pipe := zmq_socket(zctx, ZMQ_

    WriteLn('Broker Mod Says Hello.');
end.