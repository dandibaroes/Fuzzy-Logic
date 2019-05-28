function hasil = segitiga(x, a, b, c) 
 %  fungsi ini digunakan untuk menghitung nilai dari x di tipe triangular membership function
 %  a,b,dan c merupakan limit dari segitiga yang dibangun 
 
 if(x < b)
     hasil = (x-a)/(b-a);   % a<x<=b
 else
     hasil = (-(x-c))/(c-b);    % b<x<c
 end

end