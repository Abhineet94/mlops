# Use Databricks Runtime base image (replace with your desired version)
FROM databricksruntime/standard:13.3-LTS

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1

# Install OS-level dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies (optional: adjust to your repo)
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Copy your repo code into the container
WORKDIR /workspace
COPY . .

# Default command (can be overridden in Databricks)
CMD ["python3"]
