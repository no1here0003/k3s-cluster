#!/bin/sh

# Run one time to define the desired tasks/plugins in tekton

kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/git-clone/0.5/git-clone.yaml -n tekton-pipelines
  # kaniko -- https://github.com/tektoncd/catalog/tree/main/task/kaniko/0.5
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/kaniko/0.5/kaniko.yaml -n tekton-pipelines
  # pull request -- https://github.com/tektoncd/catalog/tree/main/task/pull-request/0.1
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/pull-request/0.1/pull-request.yaml -n tekton-pipelines
  # terraform -- https://github.com/tektoncd/catalog/tree/main/task/terraform-cli/0.2
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/terraform-cli/0.2/terraform-cli.yaml -n tekton-pipelines
  # ansible -- https://github.com/tektoncd/catalog/tree/main/task/ansible-runner/0.1
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/ansible-runner/0.1/ansible-runner.yaml -n tekton-pipelines
  # kubernetes actions -- https://github.com/tektoncd/catalog/tree/main/task/kubernetes-actions/0.2
kubectl apply -f https://raw.githubusercontent.com/tektoncd/catalog/main/task/kubernetes-actions/0.2/kubernetes-actions.yaml -n tekton-pipelines
