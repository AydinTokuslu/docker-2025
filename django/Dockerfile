# Resmi Python imajını kullan
FROM python:3.11

# Çalışma dizinini ayarla
WORKDIR /app

# Bağımlılıkları yüklemek için öncelikle gereksinim dosyasını kopyala
COPY requirements.txt /app/

# Bağımlılıkları yükle
RUN pip install --no-cache-dir -r requirements.txt

# Uygulama dosyalarını kopyala
COPY . /app/

# Django projesinin portunu aç
EXPOSE 8000

# Konteyner başlatıldığında çalıştırılacak komut
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
