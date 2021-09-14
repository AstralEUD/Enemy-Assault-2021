params["_distance", "_power", "_cos"];

sqrt((_power * 377 * 10 ^ ((_cos call EM_Gain) / 10)) / (4 * pi * (_distance ^ 2)));
