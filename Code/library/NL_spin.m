% This is the network layer algorithm of SPIN. It will pull down all nodes
% from the open figure and iterate through all the nodes and their ability
% to communicate to the gateway. 

function [] = NL_spin()
    d = guidata(gcf()); 
    
    for itt1 = 1:length(d.nodes)
       if ~isempty(d.nodes{itt1}.buffer)
          
          buffer = d.nodes{itt1}.buffer;  
          dataTx = buffer(1); %queue up data
          buffer = circshift(buffer,length(buffer)-1); 
          buffer(end) = 0; 
          d.nodes{itt1}.buffer = buffer; 
          
          
          sens = physicalLayer(itt1,'TX'); %Returns the nodes that can hear a broadcast from this node
%           NEED TO ADD GLOBAL ADDRESSING SYSTEM FOR PACKETS AS WELL
          %%ADVERTISE
          tf = adv(sens);
          %%DATA
          if tf, data(); end
          
          %%ACK
          
          
          guidata(gcf(),d) %can we move this outside this loop?
       else
           continue
           
       end
    end
    
end

function [tf] = adv(nodesNear)

    for itt2 = 1:length(nodesNear) %Iterate how all the nodes that hear the adv respond
        if isInteresting()
            tf = 1; 
        else
            tf = 0; 
        end
    end
end

function [] = req()
    disp('test') 
end

function [] = data()


end

function [] = ack()

end

function [tf] = isInteresting()
    tf = 1; %It's always interesting, dear
    
%     Later fill with information like analyzing the memory, etc. 
end
