% Physical Layer: This 
% BUILT ASSUMING 1 GATE

function physicalLayer()
    fid = gcf(); d = guidata(fid); 
%     nodes = data.nodes;
%     gates = data.gates; %ASSUME 1 GATE
    freq = d.freq; 
    lambda = 3e8 / freq; 
    
    for itt1 = 1:length(d.nodes)
        sep = distance(d.nodes{itt1}.loc, d.gates{1}.loc); %cal seperation in m
        
        %2-ray model
        theta1 = 2*pi*(sep / lambda);
        sep2 = sqrt(d.height^2 + sep^2 / 4);
        theta2 = 2*pi*(sep2*2 / lambda) + pi; 
        
        mag1 = 10 * log10(sep);
        mag2 = 10 * log10(2* sep2); 
       
        pr = d.nodes{itt1}.pow - 10*log10(sep) - 20*log10(4*pi*freq/3e8); 
        
        if pr < d.gates{1}.sensitivity
            continue;
        else
            d.nodes{itt1}.receive = 'YES';
        end
    end
    
    guidata(gcf(),d)
end
