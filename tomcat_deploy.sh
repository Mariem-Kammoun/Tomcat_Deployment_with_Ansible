export ENVIRONMENT=$1

usage() {
    echo "Usage:  $0 <ENVIRONMENT>"
    exit 1
}

if [ $# -ne 1 ]
then
    usage
fi

docker image build -t ansible .
docker run --rm -it --privileged -p 8080:8080 -v $(pwd)/deploy/:/data -e ENVIRONMENT='${ENVIRONMENT}' ansible bash