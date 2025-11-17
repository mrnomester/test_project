FROM python:alpine
WORKDIR /app
RUN apk add --no-cache wget
RUN adduser -D -s /bin/sh appuser
 
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 5000

USER appuser

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:5000/health || exit 1
	
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]