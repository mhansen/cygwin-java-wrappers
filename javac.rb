#!/bin/ruby
require 'paths.rb'


def windows_javac_args(unixARGV)
    unixARGV.map do | arg |
        if arg[0] != '-'[0] 
          #need to escape slashes or javac swallows them
          to_winPath(arg).gsub(/\\/,"\\\\\\") 
        else 
          #options like '-d' aren't paths, so don't convert them
          arg
        end
    end
end

def javac_path
    javacName = "javac.exe"
    javaPath = ENV["JAVA_HOME"]
    IO.popen("find \"#{javaPath}\" -name #{javacName}").readlines[0].chomp
end

def windows_javac_command(unixARGV)
    '"' << javac_path << '" ' << windows_javac_args(unixARGV).join(" ")
end

if __FILE__ == $0
    ENV["CLASSPATH"] = to_winPathList(ENV["CLASSPATH"])
    system(windows_javac_command(ARGV))
end
