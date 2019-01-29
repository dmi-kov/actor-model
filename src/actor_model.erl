%%%-------------------------------------------------------------------
%%% @author dmitry
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. Jan 2019 00:42
%%%-------------------------------------------------------------------
-module(actor_model).
-author("dmitry").

%% API
-export([create_actor/0, send_message/2, receive_message/0]).


%% Create an actor
-spec create_actor() -> pid().
create_actor() ->
    Pid = spawn(?MODULE, receive_message, []),
    io:format("~n spawned new process under Pid --> ~p ~n", [Pid]),
    Pid.

%% Send message to actor
-spec send_message(ActorAddress :: pid(), Message :: any()) -> ok.
send_message(ActorAddress, Message) ->
    ActorAddress ! {self(), Message}.

%% call back function to receive messages sent from send_message()
-spec receive_message() -> any().
receive_message() ->
    receive
        {From, Int} when is_integer(Int) ->
            From ! ok,
            io:format("~n I've got an Integer from ~p actor, lets multiply it by 2 and will get ->> ~p ~n", [From, Int * 2]),
            receive_message();
        {From, List} when is_list(List) ->
            From ! ok,
            io:format("~n I've got a List from ~p actor, lets concat it with another one ->> ~p ~n", [From, List ++ [1, 2, 3]]),
            receive_message();
        {From, _} ->
            io:format("~n I've got unexpected message from ~p actor, process will be terinated ~n", [From])
    end.
