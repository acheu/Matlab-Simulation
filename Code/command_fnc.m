% A dupe of the command script to be launched by the gui

function command_fnc()
    % This create a physical layer simulation of nodes communicating with a
    % gateway(s). For now, no Network layer is added
%     noNodes   = 5; %How many nodes do you want
%     noGate    = 1; %Of the nodes, how many are Gateways

    noGates = str2num(get(gcf(),'gates'));
    noNodes = str2num(get(gcf(),'nodes'));
    size      = [10,10]; %meters by meters in 2-D Plane
    freq      = 5.8e9; %Hz, frequency of communication

    d.size = size; d.freq =  freq; 
    fid = gcf;
    axis([0,size(1),0,size(2)]);
    hold on 
    guidata(fid,d); 

    d.nodes = node_A(noNodes-noGates); %Generate nodes w/ A properties and locs 
    d.gates = gateway_A(noGates); %Generates gateways with A properties and locs

    guidata(fid, d);

    n = cell2mat(d.nodes); 
    nloc = n.loc;
    g = cell2mat(d.gates);
    gloc = g.loc; 
    
    for itt1 = 1:length(d.nodes)
        
    end
    
    for itt2 = 1:length(d.gates)
        
    end
    hold off

end
