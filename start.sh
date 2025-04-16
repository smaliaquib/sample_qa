#!/bin/bash

# Start the FastAPI backend
python fastapi_app.py &

# Wait a bit to ensure FastAPI is up before starting Gradio
sleep 5

# Start the Gradio interface
python gradio_interface.py

# Keep the container running if any of the processes exit
wait