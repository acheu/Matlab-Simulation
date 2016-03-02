% This function randomizes the locations of all the nodes given to it

function [nodes] = randLoc (nodes)
%     g = cell(1,nodes);
    data = guidata(gcf()); 
    size = data.size(); 
    
    for itt1 = 1:length(nodes)
       nodes{itt1}.loc = size.*rand(1,2);
    end
end

