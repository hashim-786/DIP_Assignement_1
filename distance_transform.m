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
[rows, cols] = size(binary_img); % here binary_img is the matrix computed in gray to binary conversion program.

nonZeroPixels_cords = [];
pix_rows = 0;

% find Non-zero pixels coordinates
for row=1 : rows
    for col=1: cols
        if binary_img(row, col) == 1
            pix_rows = pix_rows+1;
            nonZeroPixels_cords(pix_rows, 1) = row;
            nonZeroPixels_cords(pix_rows, 2) = col;    
        end
    end
end

% Compute Euclidean Distance Transform
eucl_dist = zeros(rows, cols);
for row=1 : rows
    for col=1: cols
        if binary_img(row, col) ~= 1
         eucl_dist(row, col) = sqrt((row - nonZeroPixels_cords(1,1))^2 + (col - nonZeroPixels_cords(1,2))^2);
         for j = 2: pix_rows
             temp_dist = sqrt((nonZeroPixels_cords(j,1) - row)^2 + (nonZeroPixels_cords(j,2) - col)^2);
             if temp_dist < eucl_dist(row, col)
                 eucl_dist(row, col) = temp_dist;
             end
         end
        end
    end
end

% Compute D-4 Distance Transform
d4_dist = zeros(rows, cols);
for row=1 : rows
    for col=1: cols
        if binary_img(row, col) ~= 1
         d4_dist(row, col) = abs(row - nonZeroPixels_cords(1,1)) + abs(col - nonZeroPixels_cords(1,2));
         for j = 2: pix_rows
             temp_dist = abs(nonZeroPixels_cords(j,1) - row) + abs(nonZeroPixels_cords(j,2) - col);
             if temp_dist < d4_dist(row, col)
                 d4_dist(row, col) = temp_dist;
             end
         end
        end
    end
end

% Compute D-8 Distance Transform

d8_dist = zeros(rows, cols);

for row=1 : rows
    for col=1: cols
        if binary_img(row, col) ~= 1
         d8_dist(row, col) = max(abs(row - nonZeroPixels_cords(1,1)), abs(col - nonZeroPixels_cords(1,2)));
         for j = 2: pix_rows
             temp_dist = max(abs(nonZeroPixels_cords(j,1) - row) ,abs(nonZeroPixels_cords(j,2) - col));
             if temp_dist < d8_dist(row, col)
                 d8_dist(row, col) = temp_dist;
             end
         end
        end
    end
end

subplot(131); imshow(eucl_dist), title("Euclidean");
subplot(132); imshow(d4_dist), title("D-4");
subplot(133); imshow(d8_dist), title("D-8");

clear

