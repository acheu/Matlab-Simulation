% Function that the command_script sends arguments to to initiate a network
% layer protocol. This is the page that we can easily go to to see all
% available network protocols, any special settings we'd otherwise need to
% set, etc. 

% Output: The only output this would send is an error message

function [err] = networkLayer(arg)
    err = []; %empty variable to push any error messages
    if strcmp(arg,'SPIN')
        NL_spin();
    elseif strcmp(arg,'DDiff') || strcmp(arg,'DDIFF')
        NL_DDiff();
    else
        err = 'Error: Network protocol not available';
        return
    end
end
