
image:
	docker build -t demo-mentoring .

stack: image
	docker run --rm -it -e keyname="`whoami`" -v `pwd`:/code demo-mentoring ./stack.sh
		
