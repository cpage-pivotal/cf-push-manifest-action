echo "Getting Java version"
java -version

wget https://s3-us-west-1.amazonaws.com/v8-cf-cli-releases/releases/v8.8.0/cf8-cli_8.8.0_linux_x86-64.tgz -O /tmp/cf.tar.gz
tar -xvf /tmp/cf.tar.gz -C /tmp
install /tmp/cf8 /usr/local/bin/cf

cf login -a $CF_API -u $CF_USER -p $CF_PASSWORD
cf target -o $CF_ORG -s $CF_SPACE

./mvnw package -DskipTests

cf push -f $MANIFEST_FILE