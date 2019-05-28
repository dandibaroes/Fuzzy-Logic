%masukkan data
%kolom pertama merupakan tes kompetensi dan kolom kedua merupakan kepribadian
data_terklasifikasi = [
    61      37.5;
    71      58.3;
    64      35.8;
    60      51.7;
    73.5	75;
    66.5	62.5;
    82.5	15;
    61      37.5;
    52.5	54.2;
    57.5	79.2;
    72.5	56.7;
    73.5	75;
    50.5	70.8;
    62.5	58.3;
    62.5	60;
    68      20.8;
    38      82.5;
    52.5	70.8;
    81      61.7;
    72      67.5;
];

data_test = [
    61.5	52.5;
    66.5	58.3;
    71      45.8;
    64.5	55;
    57.5	79.2;
    80      45.8;
    81.5	53.3;
    61      64.2;
    46      65.8;
    78      49.2;
];

%buat model dengan fungsi model()
[modeltes, modelkep, modelPelamar, rulesModel] = model();

%fuzzyfication
% proses fuzzyfication dengan data_test
[hasilFuzzificationTes, hasilfuzzificationKep] = fuzzification(modeltes,modelkep,data_test(:,1),data_test(:,2));
% proses fuzzyfication dengan data_terklasifikasi untuk mengecek akurasi
% (buka komen untuk mengecek tebakan)
% [hasilFuzzificationTes, hasilfuzzificationKep] = fuzzification(modeltes,modelkep,data_terklasifikasi(:,1),data_terklasifikasi(:,2));

%inference
[hasilInference] = inference(hasilFuzzificationTes, hasilfuzzificationKep, rulesModel);

%defuzzification
[hasilDefuzzification]= deffuzification(hasilInference, modelPelamar);

%result processing
Ditolak = hasilDefuzzification < 62; %jika nilai hasil defuzzification lebih kecil dari 50 maka pelamar ditolak
Diterima = hasilDefuzzification > 62; %jika nilai hasil defuzzification lebih besar dari 50 maka pelamar diterima


listPelamarDiterima = find(Diterima==1);
listPelamarTidakDiteima = find(Ditolak==1);
disp('List pelamar yang diterima (P) ' );
disp(listPelamarDiterima');
disp('List pelamar yang tidak diterima (P) ' );
disp(listPelamarTidakDiteima');


simpan_hasil = [listPelamarDiterima,listPelamarTidakDiteima];
newFileName = 'resultData.xlsx';
xlswrite(newFileName,simpan_hasil);
