% --- Görüntü Filtreleme ve Analiz Aracý ---

% Temizleme komutlarý (Eski pencereleri kapatýr, hafýzayý temizler)
clear; clc; close all;

% Fotoðrafý hafýzaya alýyoruz
orijinal_foto = imread('reiayanamiholdingfanta.jpg');

% 1. Aþama: Gri Tonlama
gri_foto = rgb2gray(orijinal_foto);

% 2. Aþama: Gürültü Azaltma (Gaussian Blur)
bulanik_foto = imgaussfilt(gri_foto, 2);

% 3. Aþama: Kenar Tespiti (Canny Algoritmasý)
kenarlar = edge(bulanik_foto, 'canny');

% 4. Aþama: Tüm sonuçlarý profesyonel bir arayüzde (2x2) gösterme
figure('Name', 'Görüntü Ýþleme Projesi', 'Position', [100, 100, 1000, 600]);

subplot(2, 2, 1);
imshow(orijinal_foto);
title('1. Orijinal Görüntü');

subplot(2, 2, 2);
imshow(gri_foto);
title('2. Gri Tonlama');

subplot(2, 2, 3);
imshow(bulanik_foto);
title('3. Gürültü Azaltýlmýþ (Gaussian Blur)');

subplot(2, 2, 4);
imshow(kenarlar);
title('4. Kenar Tespiti (Canny Algoritmasý)');