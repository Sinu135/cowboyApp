-module(saludar_handler).
-export([init/2]).

init(Req, State) ->
    %% Obtener el valor del parámetro 'nombre' de la consulta
    #{nombre := Nombre} 
	= cowboy_req:match_qs([{nombre, [], undefined}], Req),
    
    %% Comprobar si el parámetro 'nombre' está presente
    Saludo = case Nombre of
        undefined -> <<"Hola, como te llamas?">>;  %% Si no se envió el parámetro
        Nombre -> <<"Hola, ", Nombre/binary>>  %% Saludo personalizado
    end,

    %% Enviar la respuesta HTTP 200 con el saludo
    {ok, Resp} = cowboy_req:reply(200,
        #{<<"content-type">> => <<"text/plain">>},
        Saludo,
        Req),
    
    {ok, Resp, State}.
