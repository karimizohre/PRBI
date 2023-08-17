function callForSVM()
idx=1;
for  sigmaIdx=1:8
    for gamIdx=1:6
        measures=main('data',1,1,sigmaIdx,gamIdx);
         array(idx,1)=sigmaIdx;
          array(idx,2)=gamIdx;
        array(idx,3:11)=measures.array;
      idx=idx+1;
    end
end
end
