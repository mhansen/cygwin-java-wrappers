install: javac.rb java.rb
	cp javac.rb /usr/bin/javac
	cp java.rb /usr/bin/java
	chmod +x /usr/bin/java /usr/bin/javac

clean:
	rm /usr/bin/javac /usr/bin/java
