% this is an example script for calculating hourly VPD from ERA-5 and disaggregating day/time hours
year=1999;
[vpd]=computeVPD(year);

% lon and lat grid defined truncated to 
[xx,yy]=meshgrid(0:.25:359.75,75:-.25:-52.25);

% if needed, calculate daily sunrise/sunset times for each day of the year
for i=1:365
  [sunr,suns]=sunrise(yy,xx,0,0,datenum(2011,1,0)+i);
  sunr=uint8(sunr);suns=uint8(suns);
  [dayh(:,:,:,i)]=dayhours(sunr,suns);
end

% dayh holds a logical matrix such that 1=daytime, 0=nighttime
