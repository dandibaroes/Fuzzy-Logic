function [model_input1, model_input2, model_output, model_rules] = model()
% Fungi ini digunakan untuk membuat level inputan beserta nilai limitnya, ouput, dan rule membership function
% Tes kompetensi
tes.rendahBanget= [ 0 , 0 , 30 , 35];  %trapesium [ a, b , c , d]
tes.rendah      = [ 30 , 35 , 45 ];      %segitiga [a ,b ,c]
tes.sedang      = [ 35 , 45 , 75];      %segitiga [a ,b ,c]
tes.tinggi      = [ 60 , 70 , 90];       %segitiga [a ,b ,c]
tes.tinggiBanget= [ 75, 80, 100, 100 ]; %trapesium [ a, b , c , d]

% Kepribadian
kep.rendah    = [ 0 , 0 , 20 , 30];  %trapesium [ a, b , c , d]
kep.biasa    = [ 20 , 45 , 70];      %segitiga [a ,b ,c]
kep.tinggi   = [ 60 , 80 , 100 , 100];%trapesium [a ,b ,c, d]

% cek menggunakan model Sugeno
diterima.ya = 80;
diterima.tidak = 0;

% Rules/aturan

aturan = [
  0 0 0 0 1 ;  
  0 0 0 1 1 ;
  1 1 1 1 1 ;
];

model_input1 = tes;
model_input2 = kep;
model_output = diterima;
model_rules = aturan;

% untuk visualisasi model membership function dalam plot 2D
tes_kompetensi = 0:0.01:100;
kepribadian = 0:0.01:100;

level1tes = trapmf(tes_kompetensi,tes.rendahBanget);
level2tes = trimf(tes_kompetensi,tes.rendah);
level3tes = trimf(tes_kompetensi,tes.sedang);
level4tes = trimf(tes_kompetensi,tes.tinggi);
level5tes = trapmf(tes_kompetensi,tes.tinggiBanget);

level1kep = trapmf(kepribadian,kep.rendah);
level2kep = trimf(kepribadian,kep.biasa);
level3kep = trapmf(kepribadian,kep.tinggi);


subplot(1,2,1)
plot(tes_kompetensi,level1tes,'linewidth',1);
hold on 
plot(tes_kompetensi,level2tes,'linewidth',1);
plot(tes_kompetensi,level3tes,'linewidth',1);
plot(tes_kompetensi,level4tes,'linewidth',1);
plot(tes_kompetensi,level5tes,'linewidth',1);
title('Tes Kompetensi');

subplot(1,2,2)
plot(kepribadian,level1kep,'linewidth',1);
hold on
plot(kepribadian,level2kep,'linewidth',1);
plot(kepribadian,level3kep,'linewidth',1);
title('Kepribadian');

end