%figurefull()
surf(peaks); %hold on;

%mariofy();
romcify();

%%

% 
% hf = gcf;
% back_units = hf.Units;
% back_gca = gca;
% hf.Units ="pixels";
% fig_wh_px = hf.Position([3 4]);
% hf.Units ="normalized";
% 
% 
% % prepare
% im_orig = imread("texture_mario.png");
% 
% im_bg=uint8(255*ones(fig_wh_px(2), fig_wh_px(1), 3));
% im_bg1=im_bg;
% im_bg2=im_bg;
% 
% 
% haax = findall(hf.Children,'Type','axes');
% 
% pos = zeros(numel(haax),4);
% for i = 1:numel(haax)
%     pos(i,:) = haax(i).Position;
% end
% 
% edge_norm_top = min( pos(:,2) );
% edge_norm_bottom = min( 1-(pos(:,2)+pos(:,4)) );
% edge_norm_right = min( 1-(pos(:,1)+pos(:,3)) );
% edge_norm_left = min( pos(1) );
% 
% 
% target_imheight_px = round(edge_norm_top*fig_wh_px(2)); 
% [im, im_width_px, im_height_px] = get_im_scaled(im_orig,target_imheight_px);
% im_horz_edge = repmat(im,1,ceil(fig_wh_px(1)/im_width_px));
% im_horz_edge = im_horz_edge(:,1:fig_wh_px(1),:);
% im_bg1(fig_wh_px(2)-target_imheight_px+1  : fig_wh_px(2),:,:) = im_horz_edge;
% 
% 
% target_imheight_px = round(edge_norm_bottom*fig_wh_px(2)); 
% [im, im_width_px, im_height_px] = get_im_scaled(im_orig,target_imheight_px);
% im_horz_edge = repmat(im,1,ceil(fig_wh_px(1)/im_width_px));
% im_horz_edge = im_horz_edge(:,1:fig_wh_px(1),:);
% im_bg1(1  : target_imheight_px,:,:) = flipud(im_horz_edge);
% 
% 
% target_imheight_px = round(edge_norm_left*fig_wh_px(1)); 
% [im, im_width_px, im_height_px] = get_im_scaled(im_orig,target_imheight_px);
% im_vert_edge = repmat(im,1,ceil(fig_wh_px(2)/im_height_px));
% im_vert_edge = pagetranspose(im_vert_edge(:,1:fig_wh_px(2),:));
% im_bg2(:,fig_wh_px(1)-target_imheight_px+1  : fig_wh_px(1),:) = im_vert_edge;
% 
% target_imheight_px = round(edge_norm_right*fig_wh_px(1)); 
% [im, im_width_px, im_height_px] = get_im_scaled(im_orig,target_imheight_px);
% im_vert_edge = repmat(im,1,ceil(fig_wh_px(2)/im_height_px));
% im_vert_edge = pagetranspose(im_vert_edge(:,1:fig_wh_px(2),:));
% im_bg2(:,1  : target_imheight_px,:) = fliplr(im_vert_edge);
% 
% im_bg = min(im_bg1,im_bg2);
% 
% % figure
% % imagesc(im_bg)
% 
% ha = axes(hf,"Position",[0 0 1 1]); 
% imagesc(im_bg);
% ha.XAxis.Visible = false;
% ha.YAxis.Visible = false;
% ha.Color ='w';
% ha.XTick= [];
% ha.YTick= [];
% % axis off;
% % reorder
% h = hf.Children; 
% hf.Children = [h(end) h(1:end-1)];
% 
% % revert
% axes(back_gca);
% hf.Units =back_units;
% 
% 
% function [im, im_width_px, im_height_px] = get_im_scaled(im_orig,target_imheight_px)
%     im = imresize(im_orig,[target_imheight_px NaN],'method','nearest');
%     im_size = size(im);
%     im_height_px = im_size(1); im_width_px = im_size(2);
% end
