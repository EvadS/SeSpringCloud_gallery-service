println_2:
	echo "---------"  && \
	echo "---2"

compile-eureka:
	@echo "	*************************	*** compile eureka server 	***" && \
	cd eureka-server && mvn clean package

compile-config-server:
	@echo "*************************	*** config-server 	***" && \
	cd config-server && mvn clean package

compile-gallery-service:
	@echo "**********************************************************************************" && \
	echo "*************************	*** compile-gallery-service 	********************" && \
	echo "**********************************************************************************" && \
	cd gallery-service && mvn clean package

compile-movie-service:
	@echo "*************************-	*** compile-movie-service 	***" && \
	cd movie-service && mvn clean package

compile-security-service:
	@echo "*************************	*** compile-security-service 	***" && \
	cd security-service && mvn clean package

compile-user-service:
	@echo "*************************	*** compile-user-service 	***" && \
	cd user-service && mvn clean package

compile-zuul-service:
	@echo "*************************	*** compile-zuul-service 	***" && \
	cd zuul-service && mvn clean package


compile: compile-eureka compile-config-server compile-gallery-service compile-movie-service compile-security-service compile-user-service compile-zuul-service



run-eureka:
	cd eureka-server && java -jar target/eappl.jar
run-config-server:
	cd config-server && java -jar target/cappl.jar
run-gallery-service:
	cd gallery-service && java -jar target/gappl.jar
run-movie-service:
	cd movie-service && java -jar target/mappl.jar
run-security-service:
	cd security-service && java -jar target/sappl.jar
run-user-service:
	cd user-service && java -jar target/uappl.jar
run-zuul-service:
	cd zuul-service && java -jar target/zappl.jar

run: compile run-eureka run-config-server run-gallery-service run-movie-service run-security-service run-user-service run-zuul-service