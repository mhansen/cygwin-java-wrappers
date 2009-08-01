install: javac.rb java.rb
	cp javac.rb /usr/bin/javac
	cp java.rb /usr/bin/java
	cp paths.rb /usr/lib/ruby/site_ruby/1.8
	chmod +x /usr/bin/java /usr/bin/javac

clean:
	rm /usr/bin/javac /usr/bin/java

test:
	ruby java-test.rb
	ruby javac-test.rb
