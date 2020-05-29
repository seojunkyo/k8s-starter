# /api/v1/nodes/<node_name>/proxy/stats/summary
microk8s.kubectl proxy --port=9000 --accept-hosts='^.*$' --address='0.0.0.0'
