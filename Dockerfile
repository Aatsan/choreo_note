# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory in the container
WORKDIR /home/jupyter

# Install Jupyter Notebook
RUN pip install jupyter

# Create a new user with UID 10014
RUN useradd -m -u 10014 jupyteruser

# Change ownership of the working directory to the new user
RUN chown -R jupyteruser:jupyteruser /home/jupyter

# Switch to the new user
USER 10014

# Expose the Jupyter Notebook port
EXPOSE 8888

# Run Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
