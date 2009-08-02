#!/bin/ruby
require 'test/unit'
require 'javac.rb'

class 
    Javac < Test::Unit::TestCase
    
    def test_pathList
        expected = "-classpath c:/test\\;c:/test2"
        actual = windows_javac_args("-classpath /cygdrive/c/test:/cygdrive/c/test2".split)
        assert_equal(expected.split, actual)
    end


    def test_windows_javac_cmd_one_input
        expected = "c:/test.java"
        actual = windows_javac_args("/cygdrive/c/test.java".split)
        assert_equal(expected.split, actual)
    end

    def test_windows_javac_cmd_two_inputs
        expected = "c:/test.java c:/test2.java"
        actual = windows_javac_args("/cygdrive/c/test.java /cygdrive/c/test2.java".split)
        assert_equal(expected.split, actual)
    end

    def test_windows_javac_cmd_options
        expected = "-classpath c:/classpath"
        actual = windows_javac_args("-classpath /cygdrive/c/classpath".split)
        assert_equal(expected.split, actual)
    end

    def test_windows_javac_cmd_home
        expected = "C:/cygwin/home.java"
        actual = windows_javac_args("/home.java")
        assert_equal(expected.split, actual)
    end

    def test_windows_javac_cmd_slash
        expected = "wrappers/hello.java"
        actual = windows_javac_args("./wrappers/hello.java")
        assert_equal(expected.split, actual)
    end

    def test_find_javac
        expected = "/cygdrive/c/Program Files/Java/jdk1.6.0_13/bin/javac.exe"
        actual = javac_path()
        assert_equal(expected, actual)
    end

    def test_javac_command
        expected = '"/cygdrive/c/Program Files/Java/jdk1.6.0_13/bin/javac.exe" 1.java 2.java'
        actual = windows_javac_command(["1.java", "2.java"])
        assert_equal(expected, actual)
    end

end
