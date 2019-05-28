function [hasil] = deffuzification (listNilaiKeputusan, model_output)
    
   [baris ~] = size(listNilaiKeputusan);
   yDeffuz = zeros(baris,1);
   
   pole = [model_output.ya , model_output.tidak];
   for i=1:baris
     yDeffuz(i,1) = (pole * listNilaiKeputusan(i,:)') / sum(listNilaiKeputusan(i,:)); 
   end

   hasil = yDeffuz;
end