# Kubernetes Namespace Commands

## Introduction

A **Namespace** in Kubernetes is used to organize and isolate resources inside a cluster.
It helps divide cluster resources between multiple users or environments such as **dev, test, and prod**.

---

## 1. List All Namespaces

```bash
kubectl get namespaces
```

or

```bash
kubectl get ns
```

Example Output:

```
NAME              STATUS   AGE
default           Active   20d
kube-system       Active   20d
kube-public       Active   20d
kube-node-lease   Active   20d
```

---

## 2. Create a Namespace

```bash
kubectl create namespace dev
```

Verify the namespace:

```bash
kubectl get ns
```

---

## 3. Create Pod in a Namespace

```bash
kubectl run nginx --image=nginx -n dev
```

Check pods in the namespace:

```bash
kubectl get pods -n dev
```

---

## 4. View Resources Inside a Namespace

Check pods:

```bash
kubectl get pods -n dev
```

Check services:

```bash
kubectl get svc -n dev
```

Check deployments:

```bash
kubectl get deployments -n dev
```

---

## 5. Describe Namespace

To view detailed information:

```bash
kubectl describe namespace dev
```

---

## 6. Set Default Namespace

Instead of writing `-n dev` every time:

```bash
kubectl config set-context --current --namespace=dev
```

Now you can run commands like:

```bash
kubectl get pods
```

---

## 7. Delete Namespace

```bash
kubectl delete namespace dev
```

Note: Deleting a namespace removes **all resources inside it**.

---

## 8. Get Resources From All Namespaces

```bash
kubectl get pods -A
```

or

```bash
kubectl get pods --all-namespaces
```

---

## Summary

| Command                        | Description            |
| ------------------------------ | ---------------------- |
| kubectl get ns                 | List namespaces        |
| kubectl create namespace dev   | Create namespace       |
| kubectl get pods -n dev        | View pods in namespace |
| kubectl describe namespace dev | Namespace details      |
| kubectl delete namespace dev   | Delete namespace       |
| kubectl get pods -A            | Pods in all namespaces |

---

## Conclusion

Namespaces help manage Kubernetes clusters by **separating resources for different environments or teams**.
They improve **resource organization, access control, and scalability** in large Kubernetes deployments.

