FROM continuumio/miniconda3:latest

# Set working directory
WORKDIR /app
COPY . .

# Create Conda environment
RUN conda create -n facerec-env python=3.10 -y && \
    conda install -n facerec-env -c conda-forge \
        dlib \
        face_recognition \
        numpy=1.26.4 \
        pillow=11.2.1 \
        fastapi \
        uvicorn \
        python-dotenv \
        python-multipart \
        cryptography -y

# Install pip-only packages using conda-run
RUN conda run -n facerec-env pip install click

# Use conda-run to execute the app
EXPOSE 8000
CMD ["conda", "run", "--no-capture-output", "-n", "facerec-env", "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
