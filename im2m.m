% convert image from png to matlab script
varname = 'im';
pages = '';
sz=size(im);

for ipage = 1:sz(3)

    pages = add_dim(pages, ipage,im,varname);
end




filename = 'myTextFile.txt';  % better to use fullfile(path,name) 
fid = fopen(filename,'w');    % open file for writing (overwrite if necessary)
fprintf(fid,'%s',pages);          % Write the char array, interpret newline as new line
fclose(fid); 


function pages = add_dim(pages,ipage,im,varname)
    pages = [ pages varname '(:,:,' num2str(ipage) ') = [ '];
    Nrows = size(im,1);
    for r =1:Nrows
        pages=[ pages  num2str(im(r,:,ipage)) '; '];
    end
    pages = [pages '];' newline];
end