# Use the base image
FROM python:3.8

# Install argo CLI
RUN curl -sLO https://github.com/argoproj/argo/releases/download/v3.2.1/argo-linux-amd64.gz && \
    gunzip argo-linux-amd64.gz && \
    chmod +x argo-linux-amd64 && \
    mv argo-linux-amd64 /usr/local/bin/argo

# Set the working directory
WORKDIR /app

# Copy your script and other files
COPY script.py /app/

# Run the script
CMD ["python", "script.py"]
