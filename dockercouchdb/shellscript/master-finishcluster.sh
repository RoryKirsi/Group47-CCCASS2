#run current node
export node=115.146.84.146
export masternode=115.146.84.146
export user=user
export pass=pass

#only run on master below
curl -XPOST "http://${user}:${pass}@${masternode}:9584/_cluster_setup" \
--header "Content-Type: application/json" --data "{\"action\": \"finish_cluster\"}" 

rev=`curl -XGET "http://${user}:${pass}@${masternode}:5986/_nodes/nonode@nohost" --user "${user}:${pass}" | sed -e 's/[{}"]//g' | cut -f3 -d:`

curl -X DELETE "http://${user}:${pass}@${masternode}:5986/_nodes/nonode@nohost?rev=${rev}"  --user "${user}:${pass}"

curl -X GET "http://${user}:${pass}@${node}:9584/_membership"
