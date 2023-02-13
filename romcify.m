function romcify(varargin)
%% ROMCIFY Formats current Figure in Romca style. 
% This function has no scientific meaning.
% It was intended as a gift for Ing. Jan Kudlacek from Ing. Jan Chvojka
% Example call:
% surf(peaks);
% romcify();

% image definition

im = imread('romcify.png');

switch nargin
    case 1
        scale = varargin{1};
        decoratefigedges(im,scale);
    case 0
        decoratefigedges(im,1);
end

end

