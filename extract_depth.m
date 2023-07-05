%% For 22600 training images
%[imgs, deps]=textread('./utils/eigen_train_pairs.txt','%s%s');

%% For 697 testing images
[imgs, deps]=textread('./utils/eigen_test_pairs.txt','%s%s');

for i=1:697
    temp = strsplit(imgs{i},'/');
	img = imread(imgs{i});
	dep = imread(deps{i});
	dep_after = fill_depth_colorization(double(img),double(dep),1);
	raw_save_name = ['./raw_dense_map/'+string(temp(8))+'_'+string(temp(11))];
    imwrite(uint16(dep_after), raw_save_name);

    %visualization_save_name = ['./visualization_dense_map/'+string(temp(8))+'_'+string(temp(11))];
	%dep_after = fill_depth_colorization(double(img)/255.0,double(dep),1);
	%dep_after = (dep_after - min(min(dep_after))) / (max(max(dep_after)) - min(min(dep_after)));
    %imwrite(uint8(dep_after*255), visualization_save_name));
    % The last four rows is for viualization save
end
