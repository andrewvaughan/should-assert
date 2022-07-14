##
# should-assert utility controls
#
# This Makefile is provided as a utility and convenience for testing and deployment.


.PHONY : test lint

test: lint

lint:
	@npx --version >/dev/null 2>&1 || (echo "Node.js must be installed to run linting."; exit 1)
	@docker ps >/dev/null 2>&1 || (echo "Docker must be installed and accessible to run linting."; exit 2)

	npx mega-linter-runner --containername should-assert-mega-linter
	docker stop should-assert-mega-linter
	docker rm should-assert-mega-linter



########################################################################################


.PHONY : clean

clean:
	rm -rf megalinter-reports
