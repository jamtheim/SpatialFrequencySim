function spat_freq(hObject, eventdata, handles)


%% SIMULATION OF SPATIAL FREQUENCIES
%% TILL VG MÖTE JAN 2014
%% CHRISTIAN GUSTAFSSON OCH MIKAEL MONTELIUS
% 
% close all
% clear all
% clc
% format long

% Displacement measured from k-center


X = handles.X;
Y = handles.Y;

% Value in point of interest
% a = real part
% b = complex part

% Slider max is 100
a = handles.real/100;
b = handles.imag/100;

% Data point value
datapoint_value = a+b*1i; 

%FOV
k_FOVx = 513+512;
k_FOVy = 513+512;
% 513 513 is centrum 


% Point of interest in the matrix
POI_kx = (k_FOVx-1)/2+1+X;
POI_ky = (k_FOVy-1)/2+1-Y;

% Mirrored point
POI_kx_mirrored = (k_FOVx-1)/2+1-X;
POI_ky_mirrored = (k_FOVy-1)/2+1+Y;

% Create a zero matrix
zero_matrix_k_space = zeros(k_FOVy, k_FOVx);

% ROW, COLUMN = Y, X 
% Set point in zero matrix to a complex value
zero_matrix_k_space(POI_ky,POI_kx) = datapoint_value;



% Mirrored complex conjugate point
zero_matrix_k_space(POI_ky_mirrored,POI_kx_mirrored) = conj(datapoint_value);


% fftshift and inverse fft2
matrix_image_space =ifft2(ifftshift(zero_matrix_k_space));

% Show it
subplot(1,2,1,'parent',handles.uipanel_subplot)
imshow(abs(matrix_image_space),[]) 
title('Magnitude image after inverse Fourier Transform of the K-space')

space_splot= subplot(1,2,2,'parent',handles.uipanel_subplot);

cla(space_splot)

% Create plot 
xlims = [-10 10]; ylims = [-10 10];
line([xlims nan 0 0],[0 0 nan ylims], ...
    'LineWidth',2, 'Color',[.2 .2 .2])
axis square, grid on
set(gca, 'XLim',xlims, 'YLim',ylims, ...
    'XTick',xlims(1):xlims(2), 'YTick',xlims(1):xlims(2))
title('K-space coordinate system')
xlabel('X-coordinate'), ylabel('Y-coordinate')
hold on


%# plot point
plot(X,Y, ...
    'LineStyle','none', 'Marker','.', 'MarkerSize',50, 'Color','r')

% plot(-X,-Y, ...
%     'LineStyle','none', 'Marker','.', 'MarkerSize',50, 'Color','r')







% subplot(1,3,2,'parent',handles.uipanel_subplot)
% imshow(real(matrix_image_space),[]) 
% title('Real')
% 
% subplot(1,3,3,'parent',handles.uipanel_subplot)
% imshow(imag(matrix_image_space),[]) 
% title('Imag')


% if handles.real > 0
% subplot(1,3,1,'parent',handles.uipanel_subplot2)
% imshow(atan(imag(matrix_image_space)./real(zero_matrix_k_space)),[]) 
% title('Phase')
% end

%POI_ky,POI_kx
%POI_ky_mirrored,POI_kx_mirrored
%datapoint_value
%conj(datapoint_value)


% zero_matrix_k_space_show = zero_matrix_k_space;
% 
% zero_matrix_k_space_show((POI_ky-5):(POI_ky+5),:) = 1;
% zero_matrix_k_space_show(:,(POI_kx-5):(POI_kx+5)) = 1;
% 
% subplot(1,3,2,'parent',handles.uipanel_subplot2)
% imshow(abs(zero_matrix_k_space_show),[])
% % axis([-20 20 -20 20] )
% % colormap hot
% title('K-space')





    


