FROM python:3.9

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    git && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the contents of the repository to the container
COPY . /app

# Set the working directory to the app directory
WORKDIR /app

# Set the command to start the app
CMD ["bokeh", "serve", "main.py", "--allow-websocket-origin=*"]
