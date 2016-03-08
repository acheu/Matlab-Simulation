% Physical Layer: This 
% BUILT ASSUMING 1 GATE


% Pass 0 arguments:

% Pass 2 arguments, the integer node number of interest and ither 'TX' or
% 'RX'. 

% Ret will only return with 2 arguments given being a list of nodes that
% are affected
function[ret] =  physicalLayer(varargin)
    if isempty(varargin)
        fid = gcf(); d = guidata(fid); 
        ret = 0; %results don't matter in this section
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
                d.nodes{itt1}.receive = 1;
            end
        end
        guidata(gcf(),d)
    elseif length(varargin) == 2
        ret = []; 
        eventN = varargin{1}; %Specific node we are focused on 
        mode = varargin{2}; %Arguments is either TX or RX
        d = guidata(gcf()); 
        freq = d.freq; 
        
        if strcmp(mode,'TX') %Then there is an event from node 'eventN' ret will be array of nodes that hear 'eventN' 
            for itt2 = 1:d.noNodes
                if itt2 == eventN
                    continue
                else
                    sep = distance(d.nodes{itt2}.loc, d.nodes{eventN}.loc);
                    pr = d.nodes{eventN}.pow - 10*log10(sep) - 20*log10(4*pi*freq/3e8);
                    if pr > d.nodes{itt2}.sensitivity
                        ret = horzcat(ret,itt2);
                    end
                end
            end
        elseif strcmp(mode,'RX') %ret will be array of nodes  
        end
    else
        disp('ERROR: Incorrect arguments to physicalLayer()'); 
    end
end
