function [fitness] = calrank(pop)
%CALRANK �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    N = size(pop,2);
    [FrontNo,MaxFNo] = NDSort(pop.objs,N);
    CrowdDis = CrowdingDistance(pop.objs,FrontNo);
    finalrank = zeros(1,N);
    count = 1;
    for i = 1:MaxFNo
        current = find(FrontNo==i);
        [~,Rank] = sort(CrowdDis(current),'descend');
        for j = 1:size(Rank,2)
            finalrank(current(Rank(j))) = count;
            count = count +1;
        end
    end
    fitness = 1./finalrank;
end

