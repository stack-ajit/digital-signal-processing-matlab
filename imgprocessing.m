clc;	% Clear command window.
clear;	% Delete all variables.
close all;	% Close all figure windows except those created by imtool.
imtool close all;	% Close all figure windows created by imtool.
workspace;	% Make sure the workspace panel is showing.
fontSize = 15;

% Read in a standard MATLAB demo image.
folder = fullfile(matlabroot, '\toolbox\images\imdemos');
baseFileName = 'coins.png';
% Get the full filename, with path prepended.
fullFileName = fullfile(folder, baseFileName);
if ~exist(fullFileName, 'file')
	% Didn't find it there.  Check the search path for it.
	fullFileName = baseFileName; % No path this time.
	if ~exist(fullFileName, 'file')
		% Still didn't find it.  Alert user.
		errorMessage = sprintf('Error: %s does not exist.', fullFileName);
		uiwait(warndlg(errorMessage));
		return;
	end
end
grayImage = imread(fullFileName);
% Get the dimensions of the image.  numberOfColorBands should be = 1.
[rows, columns, numberOfColorBands] = size(grayImage);
% Display the original image.
subplot(2, 2, 1);
imshow(grayImage);
title('Original Gray Scale Image', 'FontSize', fontSize);
% Enlarge figure to full screen.
set(gcf, 'Position', get(0,'Screensize')); 

% Generate a noisy image with salt and pepper noise.
noisyImage = imnoise(grayImage,'salt & pepper', 0.05);
subplot(2, 2, 2);
imshow(noisyImage);
title('Image with Salt and Pepper Noise', 'FontSize', fontSize);

% Median Filter the image:
medianFilteredImage = medfilt2(noisyImage, [3 3]);

% Find the noise.  It will have a gray level of either 0 or 255.
noiseImage = (noisyImage == 0 | noisyImage == 255);
% Get rid of the noise by replacing with median.
noiseFreeImage = noisyImage; % Initialize
noiseFreeImage(noiseImage) = medianFilteredImage(noiseImage); % Replace.
% Display the image.
subplot(2, 2, 3);
imshow(noiseFreeImage);
title('Restored Image', 'FontSize', fontSize);
