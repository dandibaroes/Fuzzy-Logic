function [hasil1 , hasil2] = fuzzification(model1, model2, nilai1, nilai2)
    % fungsi ini digunakan untuk melakukan proses fuzzification
    % model1 adalah tes kompetensi
    % model2 adalah kepribadian
    % nilai1 adalah nilai pada data untuk tes kompetensi [0..100].
    % nilai2 adalah nilai pada data untuk kepribadian [0..100].
    

    pjgBaris = length(nilai1);
    labelModel1 = zeros(pjgBaris,5); %variabel ini memuat matrix yang mana setiap kolom mewakili nilai linguistic
    labelModel2 = zeros(pjgBaris,3); %variabel ini memuat matrix yang mana setiap kolom mewakili nilai linguistic
    
    % Menghitung nilai fuzzification pada model1
    for i=1:pjgBaris
        if (min(model1.rendahBanget) <= nilai1(i) && nilai1(i) <= max(model1.rendahBanget))
            labelModel1(i,1) = trapesium(nilai1(i),model1.rendahBanget(1,1),model1.rendahBanget(1,2),model1.rendahBanget(1,3),model1.rendahBanget(1,4),'kiri');
        end
        if (min(model1.rendah) <= nilai1(i) && nilai1(i) <= max(model1.rendah))
            labelModel1(i,2) = segitiga(nilai1(i),model1.rendah(1,1),model1.rendah(1,2),model1.rendah(1,3));
        end
        if (min(model1.sedang) <= nilai1(i) && nilai1(i) <= max(model1.sedang))
            labelModel1(i,3) = segitiga(nilai1(i),model1.sedang(1,1),model1.sedang(1,2),model1.sedang(1,3));
        end
        if (min(model1.tinggi) <= nilai1(i) && nilai1(i) <= max(model1.tinggi))
            labelModel1(i,4) = segitiga(nilai1(i),model1.tinggi(1,1),model1.tinggi(1,2),model1.tinggi(1,3));
        end
        if (min(model1.tinggiBanget) <= nilai1(i) && nilai1(i) <= max(model1.tinggiBanget))
            labelModel1(i,5) = trapesium(nilai1(i),model1.tinggiBanget(1,1),model1.tinggiBanget(1,2),model1.tinggiBanget(1,3),model1.tinggiBanget(1,4),'kanan');
        end
    end
    
    % Menghitung nilai fuzzification pada model2
    for i=1:pjgBaris
        if (min(model2.rendah)<= nilai2(i) && nilai2(i) <= max(model2.rendah))
            labelModel2(i,1) = trapesium(nilai2(i),model2.rendah(1,1),model2.rendah(1,2),model2.rendah(1,3),model2.rendah(1,4),'kiri');
        end
        if (min(model2.biasa)<= nilai2(i) && nilai2(i) <= max(model2.biasa))
            labelModel2(i,2) = segitiga(nilai2(i),model2.biasa(1,1),model2.biasa(1,2),model2.biasa(1,3));
        end
        if (min(model2.tinggi)<= nilai2(i) && nilai2(i) <= max(model2.tinggi))
            labelModel2(i,3) = trapesium(nilai2(i),model2.tinggi(1,1),model2.tinggi(1,2),model2.tinggi(1,3),model2.tinggi(1,4),'kanan');
        end
    end
    
    hasil1 = labelModel1;
    hasil2 = labelModel2;
    
end