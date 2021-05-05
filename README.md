# k8s-tcp-dump-sidecar
Implementation of a Kubernetes Pod with a sidecar container to collect 24-hour rolling TCP Dump traces. Trace files are stored in an Azure Files Volume for easy retrieval. Ideal for constrained environments where terminal access to the node or pod is not possible.
