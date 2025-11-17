FROM python:alpine
WORKDIR /app
ENTRYPOINT ["python"]
CMD ["app.py"]