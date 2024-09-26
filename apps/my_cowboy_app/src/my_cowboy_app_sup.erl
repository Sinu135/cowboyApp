-module(my_cowboy_app_sup).
-behaviour(supervisor).

%% Exportar las funciones de inicialización
-export([start_link/0, init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    Children = [
        %% Aquí es donde normalmente irían tus procesos supervisados
    ],
    {ok, {{one_for_one, 1, 5}, Children}}.
