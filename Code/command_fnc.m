% A dupe of the command script to be launched by the gui

function command_fnc(h)
    % This create a physical layer simulation of nodes communicating with a
    % gateway(s). For now, no Network layer is added

    d      = guidata(h);
    noGates   = str2num(d.gates);
    noNodes   = d.nodes;
    size      = [10,10]; %meters by meters in 2-D Plane
    freq      = 5.8e9; %Hz, frequency of communication

    disp(noGates)
    disp(noNodes)
   
    d.size = size; d.freq =  freq; 
    axis([0,size(1),0,size(2)]);
    hold on 
    guidata(h,d); 

    d.nodes = node_A(noNodes-noGates); %Generate nodes w/ A properties and locs 
    d.gates = gateway_A(noGates); %Generates gateways with A properties and locs

    guidata(h, d);
   
    for itt1 = 1:length(d.nodes)
        
    end
    
    for itt2 = 1:length(d.gates)
        
    end
    hold off

end
