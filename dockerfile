# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variables
ENV API_V1_STR="/api/v1"
ENV PROJECT_NAME="AI Alt Text Generation API"
ENV API_KEY="your_api_key_here"
ENV USE_GPU=false
ENV MAX_CPU_USAGE_PERCENT=80
ENV NUMEXPR_MAX_THREADS=4

# Run app.py when the container launches
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]