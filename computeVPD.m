function [vpd]=computeVPD(year);
% requires that you have downloaded ERA-5 hourly dewpoint and temperature data named download_dew_YEAR.nc and download_t_YEAR.nc

 a=ncread(['download_dew_',num2str(year),'.nc'],'time');
 for ii=1:length(a)
  dew=ncread(['download_dew_',num2str(year),'.nc'],'d2m',[1 61 ii],[Inf 510  1],[1 1 1]);
  t=ncread(['download_t_',num2str(year),'.nc'],'t2m',[1 61 ii],[Inf 510 1],[1 1 1]);
  vpd1=calcVPD(t,dew);
  vpd(:,:,ii)=uint16(vpd1);
  clear t dew
 end
