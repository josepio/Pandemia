%  Set upGUIButton
plotbutton=uicontrol('style','pushbutton','string','run', 'fontsize',12, 'position',[150,400,50,20], 'callback', 'run=1;');
erasebutton=uicontrol('style','pushbutton','string','stop','fontsize',12,'position',[250,400,50,20],'callback','freeze=1;');
quitbutton=uicontrol('style','pushbutton','string','drop out','fontsize',12,'position',[350,400,50,20],'callback','stop=1;close;');
number = uicontrol('style','text','string','1','fontsize',12, 'position',[20,400,50,20]);
total_num=100;
n=100;
mu=[50,50];%  Mean vector
Sigma=[200 0;0 200];%  Covariance matrix
r=mvnrnd(mu,Sigma,total_num);
r=fix(r);
z = zeros(n,n);
k=sub2ind(size(z),r(:,1),r(:,2));%Get the sequence index of the person's coordinates
healthy = z;inf=z;carrier=z;cardate=z;%Initialize the matrix of the three types of people and the matrix with the date
first=randi([10,90]);
healthy(k)=200;healthy(k(first))=0;%No infected people at first
carrier(k(first))=200;cardate(k(first))=1;%Initialize carrier days matrix
%  Create image handle