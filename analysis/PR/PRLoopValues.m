%This function generates the ROC data points to graph. 
%Output-the actual output from the predictor (this is raw value
%	meaning not 0's and 1's but the actual percentages given by the predictor.
%Target- the actual class the corespond to the output, this vector is in 0's and 1'
function [PRPoints] = PRLoopValues(output, target)
  minimum = min(output);
  maximum = max(output);
	thresholds = zeros(1, size(target)(2));
	% Find the minimum differece in the threshold.
	% For each column
	for i = 1:size(target)(2)
		minThershold = inf;
		currentOutput = output(:,i);
		% Find the smallest difference.
		for j = 1:size(target)(1)
				% Find the min difference that is not zero.
				vals = abs(currentOutput - currentOutput(j, 1));
				difference = min(vals(find(vals > 1e-4),:));
				if(difference < minThershold)
					minThershold = difference;
				end
		end
		thresholds(1, i) = minThershold;
	end
  %Create number of cells as the number of PR graphs
	PRPoints = cell(size(target)(2), 1);
	for i = 1:size(target)(2)
		% Init threshold.
		threshold = minimum(1, i);
		% NumberOfValues to compute for ROC graph.
		numberOfValues = ceil(((maximum(1, i) - minimum(1, i)) / thresholds(1, i)));
		values = zeros(numberOfValues, 2);
		%Initiate for loop
		thresholdOutput = output(:, i) > threshold;
		valueCount = 0;
		% Go till maximum value or a bit above.
		while (threshold <= (maximum(1, i)))
			valueCount += 1;
			%Compute confusion matrix
			confusionM = confusionMatrix(target(:, i), thresholdOutput);
			% Compute points for that threshold
			sensativity = confusionM(1, 1) / (confusionM(1, 1) + confusionM(1, 2));
      precision = confusionM(1, 1) / (confusionM(1, 1) + confusionM(2, 1));
			values(valueCount,:) = [sensativity, precision];
			%Increment threshold by minimum amount
			threshold = threshold + thresholds(1, i);
			thresholdOutput = output(:, i) > threshold;
		end
		% add PRPoints set
		PRPoints{i} = values;
	end

end