# Nginx tabanlı bir image kullan
FROM nginx:alpine

# Çalışma dizinini belirle
WORKDIR /usr/share/nginx/html

# HTML dosyanı container içine kopyala
COPY index.html .

# Linux resmini de kopyalamak gerekiyor (eğer dosya mevcutsa)
COPY linux.png .

# Nginx servisini başlat
CMD ["nginx", "-g", "daemon off;"]

