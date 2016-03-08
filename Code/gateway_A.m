% Type A gateways are a prototype gateway meant to test the physical layer

function [g] = gateway_A(varargin)
    if length(varargin) == 1
        g = cell(1,varargin{1}); 
        data = guidata(gcf()); 

        for itt1 = 1:varargin{1}
            g{itt1}.type            = ['A gate: ', num2str(itt1)];
            g{itt1}.throughput      = 100; %Mbps, w/e
            g{itt1}.sensitivity     = -50; %dBm, sensitivty of receive power
            g{itt1}.loc             = [0,0]; %Location is set elsewhere, either randLoc.m or loaded in a predetermined 
        end
    elseif length(varargin) == 2 
        g{1}.type            = ['A gate: ', num2str('1')];
        g{1}.throughput      = 100; %Mbps, w/e
        g{1}.sensitivity     = -50; %dBm, sensitivty of receive power
        g{1}.loc             = varargin{2}; %Location is set elsewhere, either randLoc.m or loaded in a predetermined 
        
        
    end
end