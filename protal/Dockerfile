FROM python:3.13-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PORT=7860

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc libpq-dev && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

# Setup permissions for non-root runtime users (Hugging Face Spaces UID 1000)
RUN mkdir -p /app/data && chown -R 1000:1000 /app

USER 1000

EXPOSE 7860

CMD ["sh", "-c", "python manage.py collectstatic --noinput && python manage.py migrate && gunicorn protal.wsgi:application --bind 0.0.0.0:7860"]
