%% Declaración del módulo y exportación de funciones
-module(my_cowboy_handler).
-export([init/2]).

%% Función de inicialización del manejador
init(Req, State) ->
    io:format("Request: ~p~n", [Req]),  %% Imprimir el Request para depuración
    case cowboy_req:reply(200,
        #{<<"content-type">> => <<"text/plain">>},
        <<"Hola Mundo desde Cowboy!">>,
        Req) of
        {ok, Resp} ->
            {ok, Resp, State};
        {error, Reason} -> %% manejador de errores añadido duranto el debugeo
            %% Manejo del error
            io:format("Error al enviar respuesta: ~p~n", [Reason]),
            {stop, Reason, State}
    end.

