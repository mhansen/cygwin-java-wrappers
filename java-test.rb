#!/bin/ruby
require 'test/unit'
require 'java.rb'

class Java < Test::Unit::TestCase

    def test_windows_java_args
        require 'java.rb'
        expected="-classpath c:\\\\test\\;c:\\\\test2"
        actual = windows_java_args("-classpath /cygdrive/c/test:/cygdrive/c/test2".split)
        assert_equal(expected.split, actual)
    end
end
