-module(city).

-export([new/2]).
-export([name/1]).
-export([neighbours/1]).
-export([infection_level/2]).
-export([infect/2]).

new(CityName,Neighbours) -> {ok, {CityName, Neighbours, #{}}}.

name({CityName, _Neighbours, _Diseases}) -> CityName.

neighbours({_CityName, Neighbours, _Diseases}) -> Neighbours.

infection_level({_CityName, _Neighbours, Diseases}, Infection) -> maps:get(Infection, Diseases, 0).

infect(City = {CityName, Neighbours, Diseases}, Infection) -> 
case infection_level(City, Infection) of
    3 -> outbreak;
    _ -> {infected, 
        {CityName, 
        Neighbours, 
        Diseases#{Infection => maps:get(Infection, Diseases, 0) + 1}}
    }
end.
