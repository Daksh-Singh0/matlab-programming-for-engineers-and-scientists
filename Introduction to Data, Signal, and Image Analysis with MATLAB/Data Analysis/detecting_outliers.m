counter = 0;
for ii = 1:length(nodetraffic)
    sdd = standard_deviation_distance(nodetraffic, nodetraffic(ii, 1));
    if sdd > 6
        counter = counter + 1;
    end
end