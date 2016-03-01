% dummy A type node. A types are the prototype node to test the physical
% layer construction 

function [n] = node_A (args)
    n = cell(1,args);
    data = guidata(gcf()); 
    size = data.size(); 
    
    for itt1 = 1:args
        n{itt1}.type    = ['A node: ', num2str(itt1)]; %type of node
        n{itt1}.loc     = size.*rand(1,2); 
        n{itt1}.pow     = 0; %dBm ERP
        n{itt1}.data    = 100*rand(); %Random data from 0 to 100
        n{itt1}.receive = 'NO'; %String if the gateway has received the packet
    end
end

