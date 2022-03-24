a = [
1 1 1 0 0 0 0 0;
1 1 1 0 1 1 0 0;
1 1 1 0 1 1 0 0;
1 1 1 0 0 0 1 0;
1 1 1 0 0 0 1 0;
1 1 1 0 0 0 1 0;
1 1 1 0 0 1 1 0;
1 1 1 0 0 0 0 0
];

A = zeros(10,8);
equivalence_pairs = [];
equ_row = 1;

% For top (x-1,y)
% For left (x, y-1)
running = 0;
label = 1;
[m,n] = size(a);
for r = 1:m
    for c = 1:n
       
%     For First Row
       if r == 1 && c==1
            
            first_index = a(r,c);
            
            if first_index ==0
                a(r,c) = first_index;
            elseif first_index ==1
                a(r,c) = first_index;
               
            end
            
       elseif r ==1 
          
          
           base_val = a(r,c);
           left_val = a(r,c-1);
          
           
           if base_val ==0 && left_val ==0
               a(r,c) = base_val;
           elseif base_val ==0 && left_val ==1
               a(r,c) = base_val;
           elseif base_val ==1 && left_val ==0
               a(r,c) = base_val;
           end
       end
        
       
       if r>1 && c==1
          
           base_val = a(r,c);
           top_val = a(r-1,c);
           
           
           if base_val ==0 && top_val ==0
                 a(r,c) = base_val;
           elseif base_val ==0 && top_val >=1
               a(r,c) = base_val;
           elseif base_val ==1 && top_val ==0
               label = label +1;
               a(r,c) = label;
           elseif base_val ==1 && top_val >=1
                 a(r,c) = top_val;
           end
       elseif r>1
           base_val = a(r,c);
           top_val = a(r-1,c);
           left_val = a(r,c-1);
           
           if top_val ==0 && left_val ==0 && base_val ==0
               a(r,c) = base_val;
           elseif top_val ==0 && left_val ==0 && base_val ==1
                label = label +1;
               a(r,c) = label;
           elseif top_val >=1 && left_val ==0 && base_val ==1
               a(r,c) = top_val;
           elseif top_val ==0 && left_val >=1 && base_val ==1
                a(r,c) = left_val;
           elseif  top_val >=1 && left_val >=1 && base_val ==1
                a(r,c) = left_val;
                if top_val ~= left_val
                A(r,c) = left_val;
                equivalence_pairs(equ_row, 1) = top_val;
                equivalence_pairs(equ_row, 2) = left_val;   
                equ_row =equ_row+1;
                end
           elseif top_val >=1 && left_val >=1 && base_val ==0
                a(r,c) = base_val;
           end
       end
        
    end
end
disp(a);
disp('Equilant Pairs')
disp(equivalence_pairs);

disp('Equilant Classes');
disp(equivalence_pairs);
prompt = "Which no your want to preffered ";
x = input(prompt);
disp('RELABELLING THE INDEXES');
for r = 1:m
    for c = 1:n
        base_val = a(r,c);
        if base_val ==4
           a(r,c) = x;
        end
    end
end

disp(a);



