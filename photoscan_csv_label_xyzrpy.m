%% obtain image labels from GOPRO images

%paste full file location (including CAM), new file name, and CAM_num 
file_loc = '';
save_file_loc = '.csv';
CAM_num_FIXED = CAM__FIXED;

%extract image labels from .jpgs 
fullfile_data = dir(fullfile(file_loc));
fullfile_cell = struct2cell(fullfile_data)'; %turns file strucutre into cell array
image_label = fullfile_cell(1:end,1); %extracts only image label
image_label(1:2,:) = []; %removes bad data points 

cam_cell = num2cell(CAM_num_FIXED); %change num to cell arrays to concatenate with image label
cell_csv = cat(2,image_label,cam_cell(:,[(4:6),(8:10)])); %concatenate
table_csv = cell2table(cell_csv); %change cell to table to be able to save as csv
writetable(table_csv, save_file_loc); %save as txt to be opened in photoscan

% format of csv: label, latitide, longitude, altitude, roll, pitch, yaw