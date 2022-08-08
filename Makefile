build-%:
	docker build --tag amneale/$*:latest ./$*

push-%: build-%
	docker push amneale/$*:latest