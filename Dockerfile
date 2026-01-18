FROM python:3.11-slim

WORKDIR /app

# Install dependencies
RUN pip install --no-cache-dir requests

# Copy application code
COPY *.py ./

# Create output directory
RUN mkdir -p /workspace/purple_output

# Default environment variables
ENV MOCK_URL=http://mock-comtrade:8000
ENV TASK_ID=T1_single_page
ENV OUTPUT_DIR=/workspace/purple_output

# Entrypoint: run the purple agent
ENTRYPOINT ["python3", "run.py"]
CMD ["--task-id", "T1_single_page", "--mock-url", "http://mock-comtrade:8000"]
