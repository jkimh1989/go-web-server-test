1. oc new-project go-web-test
2. oc new-build --strategy=docker --name=go-webserver https://github.com/jkimh1989/go-web-server-test.git 
3. oc apply -f go-web-deployment.yaml 
