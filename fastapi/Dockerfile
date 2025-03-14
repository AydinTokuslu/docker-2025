# Base image
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9-slim AS builder

# Çalışma dizinini ayarla
WORKDIR /app

# Bağımlılıkları yükle
COPY requirements.txt ./
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install -r requirements.txt

# Uygulama dosyalarını kopyala
COPY ./app ./app

# Geliştirme ortamı için yeni aşama
FROM builder AS dev-envs

# Gerekli paketleri yükle
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

# Kullanıcı oluştur ve Docker yetkilerini ayarla
RUN useradd -s /bin/bash -m vscode && \
    groupadd docker && \
    usermod -aG docker vscode

# Docker araçlarını kopyala
COPY --from=gloursdocker/docker / /
EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
