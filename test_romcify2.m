
surf(peaks); hold on;


hf = gcf;
back_units = hf.Units;
back_gca = gca;
hf.Units ="pixels";
fig_wh_px = hf.Position([3 4]);
hf.Units ="normalized";





haax = findall(hf.Children,'Type','axes')

pos = zeros(numel(haax),4);
for i = 1:numel(haax)
    pos(i,:) = haax(i).Position;
end

edge_norm_top = min( pos(:,2) );
edge_norm_bottom = min( 1-(pos(:,2)+pos(:,4)) );
edge_norm_right = min( 1-(pos(:,1)+pos(:,3)) );
edge_norm_left = min( pos(1) );

im = imread("texture_mario.png");



edge_height_norm  = 0.0512;
% edge_width_norm  = 0.13;
target_imheight_px = round(edge_height_norm*fig_wh_px(2)); 
im = imresize(im,[target_imheight_px NaN],'method','nearest');
im_size = size(im);
im_height_px = im_size(1); im_width_px = im_size(2);

% imagesc(im);

im_horz_edge = repmat(im,1,ceil(fig_wh_px(1)/im_width_px));
im_horz_edge = im_horz_edge(:,1:fig_wh_px(1),:);

im_vert_edge = repmat(im,1,ceil(fig_wh_px(2)/im_height_px));
im_vert_edge = pagetranspose(im_vert_edge(:,1:fig_wh_px(2),:));

% append 
im_bg=uint8(255*ones(fig_wh_px(2), fig_wh_px(1), 3));

im_bg1=im_bg;
im_bg1(fig_wh_px(2)-target_imheight_px+1  : fig_wh_px(2),:,:) = im_horz_edge;
im_bg1(1  : target_imheight_px,:,:) = flipud(im_horz_edge);

im_bg2=im_bg;
im_bg2(:,fig_wh_px(1)-target_imheight_px+1  : fig_wh_px(1),:) = im_vert_edge;
im_bg2(:,1  : target_imheight_px,:) = fliplr(im_vert_edge);


im_bg = min(im_bg1,im_bg2);

% figure
% imagesc(im_bg)


ha = axes(hf,"Position",[0 0 1 1],"Color",'w','XTick',[],'YTick',[]); 
ha.XAxis.Visible = false; ha.YAxis.Visible = false;
imagesc(im_bg);
% axis off;
% reorder
h = hf.Children; 
hf.Children = [h(end) h(1:end-1)];
% Naxes = size(h,1);
% hf.Children = [h(Naxes) h(1:Naxes)];
%set(gca,'Children',[h(3) h(2) h(1)])

% revert
axes(back_gca);
hf.Units =back_units;


% 
% 
% im_scaleratio = edge_height_norm/im_height_px;
% pos = [0 0 im_scaleratio*im_width_px edge_height_norm]; % setting constant  height of the image
% 
% 
% hold on;
% for r=1:im_height_px
%     for c=1:im_width_px
%         px_pos_fig=[pos(1)+pos(3)*(c-1)/im_width_px   pos(2)+pos(4)*(1-(r)/im_height_px)   pos(4)/im_height_px   pos(3)/im_width_px];
%         px_color = double([im(r,c,1) im(r,c,2) im(r,c,3)])/255;
%         annotation('rectangle',px_pos_fig,"Color",px_color,"FaceColor",px_color,"LineStyle",'none'); % 
% 
% 
%     end
% end
% 
% hold off;
% 
% 
% %draw2fig(im,pos)