function [dayhours]=dayhours(sunset,sunr);
% This function assigns each hour in Zulu time to being daytime (sunrise to sunset)

daylength=int8(sunset)-int8(sunr)+1;
sunr=int8(sunr);
daylength(daylength<0)=daylength(daylength<0)+24;
dayhours=logical(zeros(48,510,1440));
for i=1:48
    f=find((i>=sunr & i<=sunr-1+daylength));% | (i>=sunr | (i<=sunr-1+daylength-24)));
    dayhours(i,f)=1;
end
dayhours=dayhours(1:24,:,:)|dayhours(25:48,:,:);
dayhours=permute(dayhours,[2 3 1]);
