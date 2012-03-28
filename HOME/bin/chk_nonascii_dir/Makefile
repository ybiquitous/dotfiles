compile: *.scala
	rm -rf classes/
	mkdir classes/
	scalac -unchecked -deprecation *.scala -d classes
	rm -f chk_nonascii.jar
	jar cvfm chk_nonascii.jar manifest -C classes/ .
	rm -rf classes/
