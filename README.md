# user-microservice-docker-architecture-example
Docker microservice architecture for user services 

**User-Service functionality:: **
1. Login 
2. Register
3. Store User details into mongodb
4. Store User login session in redis cluster


Please read instruction.txt

    > Install Docker First

    > Then run docker sh docker-start.sh   

    >It will setup whole required architecture includes 

       > 4 App Containers which has

           -nodejs server + source code 

          -superviserd which execute nodes 4 process in different ports (8081,8082,8083,8084)

          -haproxy which accept traffic on port 80 and balancing service to 8081,8082,8083,8084

      > 1 mongodb +superviserd container to store user data

      > 1 Redis Cluster container which has 3 Master and 3 Slaves +superviserd  which used to store user session data after login
	  

# Build and Start Containers Images with following command
sh docker-start.sh

# Stop Containers Images with following command
sh docker-stop.sh

# TO rebuild Images with following command
sh docker-rebuild.sh

# TO to remove docker-compose 
sh remove_compose.sh

# Services Running on following ports

1] Main Application URL (Haproxy Main Load Balancer "user-haproxy" ):
http://localhost:8089

2] HaProxy Stats Url of Main Load Balancer "user-haproxy"
http://localhost:8090

Username: admin
Password: password

3] app1 , app2 , app3 , app4 haproxy stats running on following ports

app1:  http://localhost:8081
app2:  http://localhost:8082
app3:  http://localhost:8083
app4:  http://localhost:8084

4] Mongodb service runs on 27017 external port , we can connect db using robomongodb

5] Redis service runs on 6379 external port , we can connect redis using fastnosql tool

[![user-microservice-docker-architecture](https://raw.githubusercontent.com/sinalkar/user-microservice-docker-architecture-example/master/User-Service.png "user-microservice-docker-architecture")](https://raw.githubusercontent.com/sinalkar/user-microservice-docker-architecture-example/master/User-Service.png "user-microservice-docker-architecture")


# Credit Reference
1] Nodejs:https://github.com/bradtraversy/node_passport_login
2] Docker:https://github.com/InconceivableDuck/Nodevember
