# https://leetcode.com/problems/simplify-path/description/
#
# Given an absolute path for a file (Unix-style), simplify it.
#
# For example,
# path = "/home/", => "/home"
# path = "/a/./b/../../c/", => "/c"
# path = "/a/../../b/../c//.//", => "/c"
# path = "/a//b////c/d//././/..", => "/a/b/c"
#
# In a UNIX-style file system, a period ('.') refers to the current directory,
# so it can be ignored in a simplified path. Additionally, a double period ("..")
# moves up a directory, so it cancels out whatever the last directory was.
# For more information,
# look here: `https://en.wikipedia.org/wiki/Path_(computing)#Unix_style`
#
# Corner Cases:
#
# Did you consider the case where path = "/../"?
# In this case, you should return "/".
# Another corner case is the path might contain multiple slashes '/' together,
# such as "/home//foo/".
# In this case, you should ignore redundant slashes and return "/home/foo".

# @param {String} path
# @return {String}

def simplify_path(path)
  items = []

  path.split('/').each do |item|
    case item
    when ''   ; nil
    when '.'  ; nil
    when '..' ; items.pop
    else      ; items.push(item)
    end
  end

  "/#{items.join('/')}"
end

path = "/home/"
p simplify_path(path) # => "/home"

path = "/a/./b/../../c/"
p simplify_path(path) # => "/c"

path = "/a/../../b/../c//.//"
p simplify_path(path) # => "/c"

path = "/a//b////c/d//././/.."
p simplify_path(path) # => "/a/b/c"
