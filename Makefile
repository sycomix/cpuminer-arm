all: cpuminer
push: push-cpuminer
.PHONY: push push-cpuminer cpuminer

TAG = v1

spark:
	docker build -t afritzler/cpuminer-arm .
	docker tag afritzler/cpuminer-arm afritzler/cpuminer-arm:$(TAG)

push-spark: cpuminer
	docker push afritzler/cpuminer-arm
	docker push afritzler/cpuminer-arm:$(TAG)

clean:
	docker rmi afritzler/cpuminer-arm:$(TAG) || :
	docker rmi afritzler/cpuminer-arm || :