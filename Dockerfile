# Use official Python image
FROM python:3.10-slim

# Install system dependencies for dlib
RUN apt update && apt install -y \
    build-essential cmake libboost-all-dev \
    libopenblas-dev liblapack-dev \
    libx11-dev libgtk-3-dev \
    && apt clean

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Expose the port FastAPI runs on
EXPOSE 8000

# Run the app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
