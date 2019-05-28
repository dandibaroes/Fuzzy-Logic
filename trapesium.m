function hasil = trapesium(x, a, b, c, d, tipe) 
 %  fungsi ini digunakan untuk menghitung nilai dari x di tipe trapezoidal membership function
 % a, b, c, dan d adalah limit
 
 hasil = 0;
 
 if(strcmp(tipe,'normal'))
     if(x > c)
         hasil = (-(x-d))/(d-c); %  c<x<d
     elseif (x < b)
         hasil = (x-a)/(b-a); %   a<x<b
     else 
         hasil = 1;
     end
 elseif (strcmp(tipe,'kiri'))
     if(x > c)
         hasil = (-(x-d))/(d-c); %  c<x<d
     elseif (x >= a && x < c)
         hasil = 1;
     end
 elseif (strcmp(tipe,'kanan'))
     if (x < b)
         hasil = (x-a)/(b-a); %  a<x<b
     elseif(x >= b) 
         hasil = 1;
     end
     
 end
 
end