
surf(peaks); hold on;




hf = gcf;
hf.Units ="normalized";


im = imread("texture_mario.png");
im = imresize(im,[32 NaN],'method','nearest');
imagesc(im);

im_leftbottom_fig = [0 0];
im_height_fig  = 0.2;
im_size = size(im);
im_height_px = im_size(1);
im_width_px = im_size(2);

im_scaleratio = im_height_fig/im_height_px;
pos = [im_leftbottom_fig im_scaleratio*im_width_px im_height_fig]; % set height


hold on;
for r=1:im_height_px
    for c=1:im_width_px
        px_pos_fig=[pos(1)+pos(3)*(c-1)/im_width_px   pos(2)+pos(4)*(1-(r)/im_height_px)   pos(4)/im_height_px   pos(3)/im_width_px];
        px_color = double([im(r,c,1) im(r,c,2) im(r,c,3)])/255;
        annotation('rectangle',px_pos_fig,"Color",px_color,"FaceColor",px_color,"LineStyle",'none'); % 


    end
end

hold off;


%draw2fig(im,pos)