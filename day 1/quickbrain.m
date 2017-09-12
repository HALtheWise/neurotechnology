%%
clear
load('brainimagingdata.mat');
%%

figure
imagesc(squeeze(t1(150,:,:)));
figure;
imagesc(squeeze(whitematter(150,:,:)))

figure
imagesc(squeeze(brain(:,:,150)));
%% Actual structural scan
for i = 1:256
imagesc(squeeze(t1(:,i,:)))
pause(.05)
end

%% Actual structural scan -flipped through a different dimension
for i = 1:256
imagesc(squeeze(t1(:,:,i)))
pause(.05)
end

%% Masked to only include the brain (also the orientation may change)
for i = 1:256
imagesc(squeeze(brain(:,i,:)))
pause(.05)
end

%% You may be able to turn things 
%  by shifting dimensions or applying a rotation
shlab = shiftdim(labelsbrain,2);
for i = 1:256
imagesc(squeeze(shlab(:,i,:)))
pause(.05)
end
%% Mask a region
%  The labels are in textlabels.index
mybrain = squeeze(brain(:,:,120));
mymask = squeeze(labelsbrain(:,:,120));
mybrain(mymask~=41) = 0;
imagesc(mybrain)

