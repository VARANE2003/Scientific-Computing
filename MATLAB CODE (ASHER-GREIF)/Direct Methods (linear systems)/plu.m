function [p,A] = plu(A)
% συνάρτηση [p,A] = plu(A)
%
% Εκτελεί παραγοντοποίηση LU με μερική οδήγηση.
% Επιστρέφει τα στοιχεία των L και U που αντικαθιστούν
% τα στοιχεία της μη ιδιάζουσας μήτρας Α,
% διαστάσεων n επί n, που δίνεται ως είσοδος.
% Οι εκτελούμενες αντιμεταθέσεις γραμμών
% καταγράφονται στον μονοδιάστατο πίνακα p.

n = size(A,1);

% καθορισμός αρχικών τιμών του διανύσματος μετάθεσης p
p = 1:n;

% παταγοντοποίηση LU με μερική οδήγηση
for k = 1:n-1
    % εύρεση του δείκτη γραμμής του σχετικού μεγίστου
    % στη στήλη k
    [val,q] = max(abs(A(k:n,k)));
    q = q + k-1;

    % αντιμετάθεση των γραμμών k και q, και σχετική
    % καταγραφή στον πίνακα p
    A([k,q],:) = A([q,k],:);
    p([k,q])=p([q,k]);

    % υπολογισμός της αντίστοιχης στήλης της μήτρας L
    J=k+1:n;
    A(J,k) = A(J,k) / A(k,k);

    % ανανέωση της υπομήτρας με το εξωτερικό γινόμενο
    A(J,J) = A(J,J) - A(J,k) * A(k,J);
end

end