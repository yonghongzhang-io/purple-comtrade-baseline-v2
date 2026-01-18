FROM python:3.11-slim

WORKDIR /app

# Install curl for healthchecks
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir requests fastapi uvicorn pydantic

# Copy application code
COPY *.py ./

# Create output directory
RUN mkdir -p /workspace/purple_output

# Default environment variables
ENV MOCK_URL=http://mock-comtrade:8000
ENV TASK_ID=T1_single_page
ENV OUTPUT_DIR=/workspace/purple_output

# Expose server port
EXPOSE 9009

# Entrypoint: run the purple agent (args passed through from runner)
ENTRYPOINT ["python3", "run.py"]
CMD []
