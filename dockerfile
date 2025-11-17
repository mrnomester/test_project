FROM python:alpine
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
ENTRYPOINT ["gunicorn"]
CMD ["app.py"]