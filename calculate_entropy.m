%This function is used to calculate the entropy of a dataset, 
function entropy = calculate_entropy(binary_labels)

    label_size = length(binary_labels);

    positives = length(find(binary_labels==1));
    negatives = label_size - positives;

    positive_raito = positives/label_size;
    negative_raito = negatives/label_size;

    if (positives == 0 || negatives == 0)
        entropy = 0;
    else
        entropy = -positive_raito * log2(positive_raito) - (negative_raito)*log2(negative_raito);
    end
end
