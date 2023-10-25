# Opensearch Cluster Docker Compose
To spin up a cluster using docker, you'll need docker-compose installed. Once its installed, run
`docker-compose up -d`
Opensearch Dashboards will be available on `localhost:5601`
Opensearch will be available on `localhost:9200`

The admin credentials are admin and admin.

# Password Hash Generation
Since we dont want to store password on version control, we need to generate hashes using opensearch's tool. 
`docker run -it opensearchproject/opensearch:2.9.0 plugins/opensearch-security/tools/hash.sh -p SomePassword2023!`
