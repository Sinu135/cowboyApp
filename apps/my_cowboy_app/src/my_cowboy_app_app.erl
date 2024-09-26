-module(my_cowboy_app_app).
-behaviour(application).

%% Exportar funciones de inicio y parada
-export([start/2, stop/1]).

start(_Type, _Args) ->
    io:format("~s~n", ["arrancando"]), %%añadido durante el debugeo
    Dispatch = cowboy_router:compile([
        {'_', [
            {"/", my_cowboy_handler, []}
        ]}
    ]),
    {ok, _} = cowboy:start_clear(http_listener,
        [{port, 8080}],
        #{env => #{dispatch => Dispatch}}),
    my_cowboy_app_sup:start_link().

%% Detener la aplicación
stop(_State) ->
    ok.
