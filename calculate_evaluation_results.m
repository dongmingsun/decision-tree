function evaluation_results = calculate_evaluation_results(confusion_matrix)

%initialise a matrix to record recall_rate, precision_rate, F1 and
%classification_rate
[num_row,~] = size(confusion_matrix);
evaluation_results = zeros(num_row,4);

for i=1:num_row
    %the diagonal value will be TP for each class
    TP = confusion_matrix(i,i);
    
    %the rest of the diagonal will be TN
    TN = trace(confusion_matrix)-TP;
    
    %calculate the sum of each row and store in a column matrix
    sum_of_rows = sum(confusion_matrix,2);
    %FN will be the difference between sum and TP
    FN = sum_of_rows(i,1) - TP;
    
    %calcluate the sum of each column and store in a row matrix
    sum_of_columns = sum(confusion_matrix,1);
    %FP will be the difference between sum and TP
    FP = sum_of_columns(1,i)-TP;
    
    recall_rate = TP/(TP+FN);
    precision_rate = TP/(TP+FP);
    F1 = (2* precision_rate* recall_rate)/(precision_rate+recall_rate);
     
    if(isnan(recall_rate))
        recall_rate = 0;
    end  
    
    if(isnan(precision_rate))
        precision_rate = 0;
    end 
    
     
    if(isnan(F1))
        F1 = 0;
    end    
    
    classification_rate = (TP+TN)/(TP+TN+FP+FN);    
    evaluation_results(i,1) =  recall_rate;
    evaluation_results(i,2) = precision_rate;
    evaluation_results(i,3) = F1;
    evaluation_results(i,4) = classification_rate;
    
end
    
    
end

