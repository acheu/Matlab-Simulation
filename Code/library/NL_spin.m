% This is the network layer algorithm of SPIN. It will pull down all nodes
% from the open figure and iterate through all the nodes and their ability
% to communicate to the gateway. 

function [] = NL_spin()
    d = guidata(gcf()); 
    
    
    for itt1 = 1:length(d.nodes)
       if strcmp(d.nodes{itt1}.receive,'NO')
           
          warn = ['WARNING: ', d.nodes{itt1}.type, ' CANNOT NETWORK']; 
          disp(warn)
          sens = physicalLayer(itt1,'TX'); %Returns the nodes that can hear a broadcast from this node
%           NEED TO ADD GLOBAL ADDRESSING SYSTEM FOR PACKETS AS WELL

          
          
       else
           continue
           
       end
    end
end

function [] = adv()
    
end

function [] = req()

end

function [] = data()


end

function [] = ack()

end

