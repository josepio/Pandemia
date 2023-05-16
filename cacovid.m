% Main event loop
stop= 0; run = 1;freeze = 0; 
while stop==0
    if run==1
        %Make an infection judgment first
      [x11,y11]=find(inf~=0);
      m=[];n=[];
      for i=1:length(x11)
          m=[m;x11(i)-2:x11(i)+2];
          n=[n;y11(i)-2:y11(i)+2];
          m(m<1)=1;m(m>100)=100;
          n(n<1)=1;n(n>100)=100;
      end
      %Each act of m is away from the infected person2Row coordinates within
      %Each act of n is away from the infected2Column coordinates within
      %Next, judge this centered on the infected5*5Are there healthy people in the matrix of
      x22=[];y22=[];fm=0;
      if ~isempty(m)
      fm=length(m(:,1));
    end
      for i=1:fm
        mat=healthy(m(i,:),n(i,:));%Coordinates near an infected person
        [x21,y21]=find(healthy(m(i,:),n(i,:))~=0);%healthy(m(i,:),n(i,:)Yes5*5The matrix of, the row of which represents the element of row m, and n corresponds to the column subscript in the same way
        x22=[x22,m(i,x21)];y22=[y22,n(i,y21)];
      end

      for i=1:length(x22)
      pro=rand;a=pro>0.6;b=pro<0.6;
      healthy(x22(i),y22(i))=200*a;
      carrier(x22(i),y22(i))=200*b;
      cardate(x22(i),y22(i))=b;
      end
      %Get the coordinates of a healthy person near the infected person and make it a carrier with a certain probability
      %Carriers become infected,And increase the number of days to carry
      date=find(cardate==4);
      carrier(date)=0;cardate(date)=0;inf(date)=200;
      cardate(cardate~=0)=cardate(cardate~=0)+1;
      
      %  Now let’s move the crowd
     
      [x1_,y1_]=find(inf~=0);infnum=length(x1_);
      inf=z;
      for i=1: infnum
      x1_(i)=randi([x1_(i)-7,x1_(i)+7]);y1_(i)=randi([y1_(i)-7,y1_(i)+7]);
      while x1_(i)<3||x1_(i)>97||y1_(i)<3||y1_(i)>97   %If you hit a wall, take another point
          x1_(i)=randi([x1_(i)-7,x1_(i)+7]);y1_(i)=randi([y1_(i)-7,y1_(i)+7]);
          if x1_(i)<0%Because re-taking points may result in constantly adding or subtracting in one direction and never being able to jump outwhileSo for the excessive point, let it be equal to a normal value
              x1_(i)=3;
          elseif y1_(i)<0
              y1_(i)=3;
          elseif x1_(i)>100
              x1_(i)=97;
          elseif y1_(i)>100
              y1_(i)=97;         
          end
      end
      end%Movement of the infected
      idx1=sub2ind(size(z),x1_,y1_);%Get the coordinate index of the infected person after moving
      inf(idx1)=200;%Mark the location of the infected person on the matrix

      [x2,y2]=find(healthy~=0);healnum=length(x2);%Get the matrix index of healthy people and the number of healthy people
      healthy = z;
      for i=1: healnum   
      x2(i)=randi([x2(i)-7,x2(i)+7]);y2(i)=randi([y2(i)-7,y2(i)+7]);%Healthy people exercise randomly
      while x2(i)<3||x2(i)>97||y2(i)<3||y2(i)>97||~isempty(find(idx1==sub2ind(size(z),x2(i),y2(i)), 1))%Check whether the positions of healthy people overlap with those of the infected, if they overlap, change positions
          x2(i)=randi([x2(i)-7,x2(i)+7]);y2(i)=randi([y2(i)-7,y2(i)+7]);
          if x2(i)<0
              x2(i)=3;
          elseif y2(i)<0
              y2(i)=3;
          elseif x2(i)>100
              x2(i)=97;
          elseif y2(i)>100
              y2(i)=97;         
          end
      end
      end
      idx2=sub2ind(size(z),x2,y2);%Get the subscript of the healthy person after moving
      healthy(idx2)=200;
      
      [x3,y3]=find(carrier~=0);carnum=length(x3);
      dateidx=sub2ind(size(z),x3,y3);
      cardate_=cardate;
      cardate=z;
      carrier=z;
      for i=1: carnum   
      x3(i)=randi([x3(i)-7,x3(i)+7]);y3(i)=randi([y3(i)-7,y3(i)+7]);%Random movement of the carrier
      while x3(i)<3||x3(i)>97||y3(i)<3||y3(i)>97||~isempty(find(idx1==sub2ind(size(z),x3(i),y3(i)), 1))||~isempty(find(idx2==sub2ind(size(z),x3(i),y3(i)), 1))%Check whether the carrier overlaps with the infected person and healthy person. If they overlap, take another point
          x3(i)=randi([x3(i)-7,x3(i)+7]);y3(i)=randi([y3(i)-7,y3(i)+7]);
          if x3(i)<0
              x3(i)=3;
          elseif y3(i)<0
              y3(i)=3;
          elseif x3(i)>100
              x3(i)=97;
          elseif y3(i)>100
              y3(i)=97;         
          end
      end
      end
      idx3=sub2ind(size(z),x3,y3);%Get the subscript index of the carrier after moving
      cardate(idx3)=cardate_(dateidx);
      carrier(idx3)=200;

        image(cat(3,inf,healthy,carrier));
        stepnumber = 1 + str2double(get(number,'string'));%Update the number of iteration steps, adding one for each iteration
        set(number,'string',num2str(stepnumber))%Update the iteration algebra after adding one
       pause(0.7)
        
    end
    if freeze==1
        run = 0;
        freeze = 0;
    end
end