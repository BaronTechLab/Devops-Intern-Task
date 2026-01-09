# DevOps Intern Assignment Approach

## Overview
This repository contains the containerized Django application with Nginx as a reverse proxy and a CI/CD pipeline using GitHub Actions.

## Approach

### 1. Dockerization
- Created a `Dockerfile` using `python:3.11-slim` for a lightweight image.
- Used `gunicorn` as the production WSGI server.
- Configured static files collection during the build process.
- Exposed port 8000.

### 2. Nginx Reverse Proxy
- Created `nginx/default.conf` to configure Nginx.
- Nginx serves static files directly from `/static/` (mapped to the Django app's `STATIC_ROOT`).
- Proxies all other traffic to the `backend` service on port 8000.
- Sets standard forwarding headers (`Host`, `X-Real-IP`, etc.).

### 3. Orchestration
- Used `docker-compose.yml` to define two services: `backend` and `nginx`.
- The `nginx` service depends on `backend`.
- Environment variables are loaded from `.env`.

### 4. CI/CD Pipeline
- Implemented `.github/workflows/deploy.yml` triggered on push/PR to `main`.
- **Jobs**:
    - **Build and Test**:
        - Sets up Python 3.11.
        - Installs dependencies.
        - Runs `flake8` for linting.
        - Runs `python manage.py test` for unit tests.
        - Builds the Docker image to ensure the Dockerfile is valid.

## Usage
1.  Create a `.env` file with `SECRET_KEY` and `DEBUG`.
2.  Run `docker-compose up --build`.
3.  Access the API at `http://localhost/api/hello/`.
