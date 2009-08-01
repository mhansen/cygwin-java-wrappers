def to_winPath(unixPath)
  cp = IO.popen("cygpath -w " + unixPath)
  cp.readline.chomp
end

def to_winPathList(unix_path_list)
    cygpath = IO.popen("cygpath -w -p " + unix_path_list)
    cygpath.readline.chomp
end
