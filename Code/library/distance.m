% 2/20/16 finds the distance between two given points

function [r] = distance(n,g)
    r = sqrt((n(1) - g(1))^2 + (n(2) - g(2))^2);  
end
