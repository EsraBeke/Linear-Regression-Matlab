% linear_regression fonksiyonu, doğrusal regresyon modeli oluşturur ve katsayılarını ekrana yazdırır.
% 
% Parametreler:
%   - filename: Kullanılacak veri dosyasının adı.
%   - degree: Kullanılacak polinom derecesi.
%   - lambda: Regülarizasyon parametresi.
%
function [] = linear_regression(filename, degree, lambda)

    % Varsayılan değerler atanır
    filename = 'sample_data1.txt';
    degree = 1;
    lambda = 0;

    % Assignment4 sınıfından bir nesne oluşturulur ve gerekli işlemler yapılır
    object = Assignment4(filename, degree, lambda);
    object.load_data(object);
    object.calculate_phi(object);
    object.calculate_w(object);

    % Modelin katsayıları ekrana yazdırılır
    for i = 1: size(object.w, 1)
        fprintf(' W%d = %.4f\n', i-1, object.w(i, 1));
    end

    % Eğer lineer regresyon kullanıldıysa, W2'nin 0 olduğu belirtilir
    if degree == 1
        fprintf(' W2 = 0\n');
    end
end
