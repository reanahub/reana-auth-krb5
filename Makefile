IMAGE=reanahub/reana-auth-krb5

all:
	@echo "Usage: make <action> where action is build, test, or push."

build: Dockerfile
	docker build -t $(IMAGE) .

test:
	docker run -i --rm $(IMAGE) klist 2>&1 | grep "klist: No credentials"

push:
	docker push $(IMAGE)
