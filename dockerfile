FROM python:alpine
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt
ENTRYPOINT ["gunicorn"]
CMD ["app.py"]