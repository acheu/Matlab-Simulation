% Type A gateways are a prototype gateway meant to test the physical layer

function [g] = gateway_A(args)
    g = cell(1,args); 
    data = guidata(gcf()); 
    
    for itt1 = 1:args
        g{itt1}.type            = ['A gate: ', num2str(itt1)];
        g{itt1}.throughput      = 100; %Mbps, w/e
        g{itt1}.sensitivity     = -50; %dBm, sensitivty of receive power
        g{itt1}.loc             = [0,0]; %Location is set elsewhere, either randLoc.m or loaded in a predetermined 
    end
end