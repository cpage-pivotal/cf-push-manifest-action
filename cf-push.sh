echo "Getting Java version"
java -version

wget https://packages.cloudfoundry.org/stable?release=linux64-binary&version=v8&source=github -O /tmp/cf.tar.gz
tar -xvf /tmp/cf.tar.gz -C /tmp
install /tmp/cf8 /usr/local/bin/cf

cf login -a $CF_API -u $CF_USER -p $CF_PASSWORD
cf target -o $CF_ORG -s $CF_SPACE

./mvnw package

cf push -f $MANIFEST_FILE