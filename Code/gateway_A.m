% Type A gateways are a prototype gateway meant to test the physical layer

function [g] = gateway_A(args)
    g = cell(1,args); 
    data = guidata(gcf()); 
    size = data.size(); 
    
    for itt1 = 1:args
        g{itt1}.type            = ['A gate: ', num2str(itt1)];
        g{itt1}.throughput      = 100; %Mbps, w/e
        g{itt1}.sensitivity     = -50; %dBm, sensitivty of receive power
        g{itt1}.loc             = size.*rand(1,2);  

    end
end