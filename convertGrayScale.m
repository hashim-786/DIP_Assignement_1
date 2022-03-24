Image1 = imread('cameraman.tif'); 

rows = size(Image1,1); 
columns = size(Image1,2);
 binary_img = zeros(rows, columns); 
for r=1:rows
    for c=1:columns
        current_val = Image1(r,c);
        
        if current_val <128
           binary_img(r,c) =0;
        else
           binary_img(r,c) =1;
        end
    end
end
imshow(binary_img);

