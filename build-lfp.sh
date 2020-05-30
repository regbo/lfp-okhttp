REPO_ID=$1
REPO_URL=$2
if [ -z "$REPO_URL" ]
then
	echo "repositoryId not specified, assuming 'central'"
	REPO_URL=$REPO_ID
	REPO_ID="central"
fi
if [ -z "$REPO_URL" ]
then
	echo "repositoryURL is required"
	exit 1
fi
echo "repositoryId:$REPO_ID"
echo "repositoryURL:$REPO_URL"
cmd.exe /c mvn clean package deploy \
-DaltDeploymentRepository="$REPO_ID::default::$REPO_URL" \
-Dmaven.test.skip=true \
-DskipTests \
-Dcheckstyle.skip \
-pl "!okcurl,!samples"