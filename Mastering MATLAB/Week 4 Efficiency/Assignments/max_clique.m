function clique = max_clique(graph,clique)
    if nargin < 2                                       
        clique = [];                                    
    end
    max_clq = clique;                                  
    if isempty(clique)                                 
        for ii = 1:length(graph)                       
            clq = max_clique(graph,ii);
             if length(clq) > length(max_clq)           
                max_clq = clq;                         
             end
        end
    else
        candidates = graph{clique(1)};                           % it is enough to check nodes that the first member of the clique follows
        candidates = candidates(graph{clique(1)} > max(clique)); % since nodes are ordered, a potential new member must have a greater ID than current members
        for ii = 1:length(candidates)
            if check_clique(clique,candidates(ii),graph)              
                clq = max_clique(graph,[clique candidates(ii)]);     
                if length(clq) > length(max_clq)            
                    max_clq = clq;                          
                end
            end
        end
    end
    clique = max_clq;                                          
end
        
function ok = check_clique(clq,node,graph)                     
    ok = false;
    if ~isempty(find(node == clq))
        return;
    end
    for ii = 1:length(clq)                                      
        if isempty(find(clq(ii) == graph{node})) || ...         
                isempty(find(node == graph{clq(ii)}))           
            return;
        end
    end
    ok = true;
end