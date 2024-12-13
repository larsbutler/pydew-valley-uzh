local:
	python main.py

clean:
	rm -rf build
	rm -rf .tox

web-debug: clean
	# pygbag --ume_block=0 ./main.py
	pygbag --ume_block=0 --PYBUILD 3.12 ./main.py

web: clean
	# pygbag --ume_block=0 --git --PYBUILD 3.12 ./main.py
	pygbag --ume_block=0 --PYBUILD 3.12 .

git: clean
	pygbag --git ./main.py

package: clean
	pygbag --build --ume_block=0 --git --PYBUILD 3.12 ./main.py

run-server:
	cd pydew_valley/build/web && python -m http.server

docker-build-frontend:
	docker build -f docker/frontend/Dockerfile -t frontend . 

docker-run-frontend: docker-build-frontend
	docker run --publish 8000:8000 -it frontend

