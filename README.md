# Check manifest path

Check `manifest_path` value in Kubernetes deployment manifest annotations, in case the value found is a path that doesn't exist it will break the job.

This action will assume that the deployment manifest will use the word `manifest` in their paths.

If and deployment doesn't have a `manifest_path` configured it will produce a message but it won't break the build. Only when at least one deployment have a `manifest_path` that doesn't exit the build will break.

## Usage

```yaml
- name: Check manifest paths in deployment files
  uses: resuelve/check-manifest-path-action@master
```

Enjoy 🎉
