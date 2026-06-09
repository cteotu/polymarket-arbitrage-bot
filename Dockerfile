FROM python:3.11-slim

WORKDIR /app

# Gerekiyorsa sistem bağımlılıkları (pandas vs. için)
RUN apt-get update && apt-get install -y --no-install-recommends gcc && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Paper trading modu (gerçek işlem yapmaz)
CMD ["python", "main.py"]
