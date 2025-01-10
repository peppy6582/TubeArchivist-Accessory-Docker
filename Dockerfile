# Use a Python base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Python script and requirements file to the container
COPY youtube-process.py .
COPY requirements.txt .

# Install required Python libraries
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entrypoint script (if needed) and make it executable
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

# Set environment variables with default values (can be overridden)
ENV VIDEO_DIRECTORY=/TubeArchivist/YouTube/
ENV CHANNELS_DIRECTORY=/TubeArchivist/YouTube Channels/
ENV PROCESSED_FILES_TRACKER=processed_files.txt
ENV YOUTUBE_API_KEY=your-youtube-api-key
ENV APPRISE_URL=
ENV CHANNELS_DVR_API_REFRESH_URL=

# Run the entrypoint script by default
ENTRYPOINT ["./entrypoint.sh"]
