actor_model
=====

An example of Actor model in Erlang

Build and start
-----

    $ make
    $ erl -pa ebin


Examples
-----

    $ Pid = actor_model:create_actor().
    > spawned new process under Pid --> <0.62.0> 
    > <0.62.0>


    $ actor_model:send_message(Pid, 10).
    > I've got an Integer from <0.60.0> actor, lets multiply it by 2 and will get ->> 20 
    > {<0.60.0>,10}

    $ actor_model:send_message(Pid, [10, 30]).
    > I've got a List from <0.60.0> actor, lets concat it with another one ->> [10, 30, 1, 2, 3]
    > {<0.60.0>,[10,30]}

    $ actor_model:send_message(Pid, atom). 
    > I've got unexpected message from <0.60.0> actor, process will be terinated 
    > {<0.60.0>,atom}

    

    