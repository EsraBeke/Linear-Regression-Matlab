% Assignment4 sınıfı, doğrusal regresyon modelini oluşturmak için kullanılır.
% Bu sınıf, veri dosyasını yükler, öznitelik matrisini hesaplar
% ve regresyon modelinin katsayılarını hesaplar.
classdef Assignment4 < handle

    % Sınıfın özelliklerini tanımla
    properties
        filename;  % Kullanılacak veri dosyasının adı
        degree;    % Kullanılacak polinom derecesi
        lambda;    % Regülarizasyon parametresi
        data;      % Veri dosyasından yüklenen veri
        phi;       % Öznitelik matrisi
        w;         % Regresyon modelinin katsayıları
    end
    
    % Sınıfın statik yöntemlerini tanımla
    methods (Static)
        
        % Constructor metodu: Sınıfın bir örneğini oluşturur ve gerekli özellikleri başlatır
        function [obj] = Assignment4(filename, degree, lambda)
            obj.filename = filename;
            obj.degree = degree;
            obj.lambda = lambda;
        end
        
        % Veri dosyasını yükler
        function [obj] = load_data(obj) 
            obj.data = load(obj.filename);
        end 
        
        % Öznitelik matrisini hesaplar
        function [obj] = calculate_phi(obj)
            number_of_rows = size(obj.data, 1);
            obj.phi = zeros(number_of_rows, (obj.degree)+1);   
            for row = 1: number_of_rows
                obj.phi(row, 1) = 1;
                for deg = 1: obj.degree
                    obj.phi(row, deg+1) = obj.data(row, 1)^deg;
                end
            end
        end
        
        % Regresyon modelinin katsayılarını hesaplar
        function [obj] = calculate_w(obj)
            if obj.lambda == 0
                obj.w = (inv(transpose(obj.phi)* (obj.phi))) * (transpose(obj.phi)) * (obj.data(:,2));
            else 
                obj.w = (inv((obj.lambda * eye(obj.degree+1)) + transpose(obj.phi)* (obj.phi))) * (transpose(obj.phi)) * (obj.data(:,2)); 
            end         
        end      
    end
end
