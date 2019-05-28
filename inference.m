function [hasil] = inference(hasilFuzzification1, hasilFuzzification2, rules)
    % fungsi ini digunakan untuk proses inference
    % hasilFuzzification1 dan hasilFuzzification2 didapat dari fungsi fuzzification
    
    % lakukan transpose pada matrix yang nantinya digunakan untuk
    % mendapatkan index non zero dengan syntax find()

    transposeHasilFuzzification1 = hasilFuzzification1';
    transposeHasilFuzzification2 = hasilFuzzification2';
    
    indexNonZeroHasilFuzzification1 = [];
    indexNonZeroHasilFuzzification2 = [];
    
    % looping ini untuk mendapatkan index dari setiap value non zero dan
    % posisinya
    for j=1:length(hasilFuzzification1) 
        %Fuzzification1
        idxeachCol = find(transposeHasilFuzzification1(:,j));  %find index non zero dari setiap kolom
        [~,~,value] = find(transposeHasilFuzzification1(:,j)); %dapatkan valuenya dengan mereturn kolom ketiga (value) dari fungsi find()
        indexNonZeroHasilFuzzification1 = [indexNonZeroHasilFuzzification1 ; {idxeachCol value}  ];
        
        %Fuzzification2
        idxeachCol = find(transposeHasilFuzzification2(:,j));  %find index non zero dari setiap kolom
        [~,~,value] = find(transposeHasilFuzzification2(:,j)); %dapatkan valuenya dengan mereturn kolom ketiga (value) dari fungsi find()
        indexNonZeroHasilFuzzification2 = [indexNonZeroHasilFuzzification2 ; {idxeachCol value} ];
    end
   
   
    listNilaiKeputusan = zeros(30,2);
    for i=1:length(hasilFuzzification1)
 
        extractValueFF1 = [indexNonZeroHasilFuzzification1{i,2}];
        extractValueFF2 = [indexNonZeroHasilFuzzification2{i,2}];

        extractPositionFF1 = [indexNonZeroHasilFuzzification1{i,1}];
        extractPositionFF2 = [indexNonZeroHasilFuzzification2{i,1}];

        [ukuranBarisValue1,  ~]= size(extractValueFF1);
        [ukuranBarusValue2,  ~]= size(extractValueFF2);

        tempInference = [];
        listPosisi = [];
        ruleNilaiKeputusan = [];
        % cek semua kemungkinan linguistic dari tes kompetensi dan kepribadian
        
        if(ukuranBarisValue1 == 1 && ukuranBarusValue2 == 2)
            % list inference
            tempInference = [tempInference; extractValueFF1(1),extractValueFF2(1)];
            tempInference = [tempInference; extractValueFF1(1),extractValueFF2(2)];

            % list posisi pada rule
            listPosisi = [listPosisi; extractPositionFF1(1),extractPositionFF2(1)];
            listPosisi = [listPosisi; extractPositionFF1(1), extractPositionFF2(2)];

            % tandai posisi pada rule
            ruleNilaiKeputusan = [ruleNilaiKeputusan; rules(listPosisi(1,2),listPosisi(1,1))];
            ruleNilaiKeputusan = [ruleNilaiKeputusan; rules(listPosisi(2,2),listPosisi(2,1))];

        elseif (ukuranBarisValue1 == 2 && ukuranBarusValue2 == 1)
             % list inference
            tempInference = [tempInference; extractValueFF1(1),extractValueFF2(1)];
            tempInference = [tempInference; extractValueFF1(2),extractValueFF2(1)];

            % list posisi di rule
            listPosisi = [listPosisi; extractPositionFF1(1),extractPositionFF2(1)];
            listPosisi = [listPosisi; extractPositionFF1(2), extractPositionFF2(1)];

            % tandai posisi di rule
            ruleNilaiKeputusan = [ruleNilaiKeputusan; rules(listPosisi(1,2),listPosisi(1,1))];
            ruleNilaiKeputusan = [ruleNilaiKeputusan; rules(listPosisi(2,2),listPosisi(2,1))];

        elseif (ukuranBarisValue1 == 1 && ukuranBarusValue2 == 1)
             % list inference
            tempInference = [tempInference; extractValueFF1(1),extractValueFF2(1)];

            % list posisi di rule
            listPosisi = [listPosisi; extractPositionFF1(1),extractPositionFF2(1)];

            % tandai posisi di rule
            ruleNilaiKeputusan = [ruleNilaiKeputusan; rules(listPosisi(1,2),listPosisi(1,1))];       
        elseif (ukuranBarisValue1 == 2 && ukuranBarusValue2 == 2)
              % list inference
            tempInference = [tempInference; extractValueFF1(1),extractValueFF2(1)];
            tempInference = [tempInference; extractValueFF1(1),extractValueFF2(2)];
            tempInference = [tempInference; extractValueFF1(2),extractValueFF2(1)];
            tempInference = [tempInference; extractValueFF1(2),extractValueFF2(2)];

            % list posisi di rule
            listPosisi = [listPosisi; extractPositionFF1(1),extractPositionFF2(1)];
            listPosisi = [listPosisi; extractPositionFF1(1), extractPositionFF2(2)];
            listPosisi = [listPosisi; extractPositionFF1(2),extractPositionFF2(1)];
            listPosisi = [listPosisi; extractPositionFF1(2), extractPositionFF2(2)];

            % tandai posisi di rule
            ruleNilaiKeputusan = [ruleNilaiKeputusan; rules(listPosisi(1,2),listPosisi(1,1))]; 
            ruleNilaiKeputusan = [ruleNilaiKeputusan; rules(listPosisi(2,2),listPosisi(2,1))];
            ruleNilaiKeputusan = [ruleNilaiKeputusan; rules(listPosisi(3,2),listPosisi(3,1))];
            ruleNilaiKeputusan = [ruleNilaiKeputusan; rules(listPosisi(4,2),listPosisi(4,1))];
        end
        gabunganHasil = [];
        gabunganHasil = [tempInference,ruleNilaiKeputusan];

        [rows ~] = size(gabunganHasil);
        ya = zeros(4,1);
        tidak = zeros(4,1);
        % lakukan grouping dan temukan nilai terkecil
        for j = 1:rows
            if (gabunganHasil(j,3) == 0)
                ya(j,:) =  min(gabunganHasil(j,1:2));
            elseif (gabunganHasil(j,3) ==1)
                tidak(j,:) =  min(gabunganHasil(j,1:2));
            end
        end

        %temukan maksimum dari setiap label dan return
        NilaiKeputusanYa = max(ya);
        NilaiKeputusanTidak = max(tidak);
        listNilaiKeputusan(i,:) = [NilaiKeputusanTidak, NilaiKeputusanYa];
    end
    hasil = listNilaiKeputusan;
end