# Using the Docker Image URL

You have configured the CI/CD pipeline to publish your Docker image to the GitHub Container Registry.

## Your Docker Image URL
Once the pipeline runs successfully on the `main` branch, your image will be available at:

```
ghcr.io/barontechlab/devops-intern-task:latest
```

*(Note: The username/organization name `barontechlab` should be lowercased)*

## How to use in Render
If you want to deploy using this specific image URL instead of building from Git:
1.  On Render, select **"Deploy an existing image from a registry"**.
2.  Enter the URL: `ghcr.io/barontechlab/devops-intern-task:latest`
3.  **Authentication**: Since GHCR is private by default properly, you might need to configure credentials or make the package public on GitHub settings.
    *   **Easier Option**: Use **"Deploy from Git"** (Build context) on Render, which uses the internal `Dockerfile` we verified. It achieves the same result without registry auth issues.
