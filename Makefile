.PHONY: php-nginx-unit

php-nginx-unit: TARGET=php-nginx-unit
php-nginx-unit: build push

build:
	docker build --tag amneale/$(TARGET):latest ./$(TARGET)

push:
	docker push amneale/$(TARGET):latest