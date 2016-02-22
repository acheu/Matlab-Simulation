% Physical Layer: This 
% BUILT ASSUMING 1 GATE

function physicalLayer()
    fid = gcf(); d = guidata(fid); 
%     nodes = data.nodes;
%     gates = data.gates; %ASSUME 1 GATE
    freq = d.freq; 
    
    for itt1 = 1:length(d.nodes)
        sep = distance(d.nodes(itt1).loc, d.gates(1).loc); %cal seperation in m
        pr = d.nodes(itt1).pow - 10*log10(dist) - 20*log10(4*pi*freq/3e8); 
        if pr < d.gates(1).sensitivity
            
        else
            
        end
    end
    
    guidata(gcf(),d)
end
