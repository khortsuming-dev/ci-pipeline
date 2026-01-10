# Use Python slim
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy only what is needed
COPY setup.py requirements.txt ./
COPY app ./app
COPY tests ./tests

# Install dependencies
RUN pip install --upgrade pip \
    && pip install -r requirements.txt \
    && pip install -e .

# Optional: run tests
RUN pip install pytest \
    && pytest

# Default command (replace with your app)
CMD ["python", "-m", "app.calculator"]

