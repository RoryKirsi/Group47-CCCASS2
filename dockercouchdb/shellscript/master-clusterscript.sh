#run current node
export node=115.146.84.146
export masternode=115.146.84.146
export user=user
export pass=pass

#run each node
curl -XPOST "http://${user}:${pass}@${masternode}:9584/_cluster_setup" \
--header "Content-Type: application/json" \
--data "{\"action\": \"enable_cluster\", \"bind_address\":\"0.0.0.0\", \
\"username\": \"${user}\", \"password\":\"${pass}\", \"port\": \"9584\", \
\"remote_node\": \"${node}\", \
\"remote_current_user\":\"${user}\", \"remote_current_password\":\"${pass}\"}"

curl -XPOST "http://${user}:${pass}@${masternode}:9584/_cluster_setup" \
--header "Content-Type: application/json" \
--data "{\"action\": \"add_node\", \"host\":\"${node}\", \
\"port\": \"9584\", \"username\": \"${user}\", \"password\":\"${pass}\"}"
#until here

sleep 10
