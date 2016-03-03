% Simple graph that displays the nodes and locations. Nodes that
% successfully communicate is displayed with a red circle, nodes that
% cannot are displayed with a red x. 

function [] = simpleGraph()

    d = guidata(gcf()); 
    
    for itt1 = 1:d.noNodes
        if strcmp(d.nodes{itt1}.receive,'NO')
            scatter(d.nodes{itt1}.loc(1),d.nodes{itt1}.loc(2),'rx')
        else
            scatter(d.nodes{itt1}.loc(1),d.nodes{itt1}.loc(2),'ro')
        end
    end

    for itt2 = 1:d.noGate
        scatter(d.gates{itt2}.loc(1),d.gates{itt2}.loc(2),'b')
    end
end
