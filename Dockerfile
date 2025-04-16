FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy only the requirements file to leverage Docker cache
COPY requirements.txt .

# Install the dependencies and clean pip cache in the same layer to keep the image size small
RUN pip install --no-cache-dir -r requirements.txt && \
    rm -rf /root/.cache/pip

# Copy the rest of the application code to the working directory
COPY . .

# Create a proper start script
COPY start.sh /app/
RUN chmod +x /app/start.sh

# Clean apt cache to reduce image size
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Expose ports for FastAPI (8000) and Gradio (7860)
EXPOSE 8000 7860

# Use a shell entrypoint to run the start script
ENTRYPOINT ["/bin/bash"]
CMD ["/app/start.sh"]