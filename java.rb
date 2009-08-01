#!/bin/ruby
require 'paths.rb'

def java_path
    javaName="java.exe"
    javaPath= ENV["JAVA_HOME"]
    IO.popen("find \"#{javaPath}\" -name #{javaName}").readlines[0].chomp
end


def windows_java_args(unixARGV)
    unixARGV.map do | arg |
        if arg.include? '/' #if it looks like a path
            arg = to_winPath(arg).gsub(/\\/,"\\\\\\") #convert it to a windows path
        else
            arg = arg
        end
    end
end

def windows_java_command(unixARGV)
    '"' << java_path << '" ' << windows_java_args(unixARGV).join(" ")
end

if __FILE__ == $0
    ENV["CLASSPATH"] = to_winPath(ENV["CLASSPATH"])

    if ARGV.include? "-DEBUG"
        puts windows_java_command(ARGV)
    else
        system(windows_java_command(ARGV))
    end
end
