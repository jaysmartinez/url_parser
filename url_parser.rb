
# "http://www.google.com:60/search?q=cat&name=Tim#img=FunnyCat"

class UrlParser

  attr_accessor :new_url

 def initialize(new_url)
   @new_url = new_url
 end

 def scheme
   scheme = @new_url.split(":")[0]
 end

 def domain
   @new_url.split(":")[1].split("//")[1]
 end

 def port
  port = @new_url.split("/")[2].split(":")[1]
   if scheme == "https"
     if port == nil
       return "443"
     else
       return port
     end
   elsif scheme == "http"
      if port == nil
        return "80"
      else
        return port
      end
   end
 end

 def path
   path = @new_url.split("/")[3].split("?")[0]
   if path == ""
     return nil
   else
     path
   end
 end

 def query_string
   query_string = @new_url.split("?")[1].split("#")[0].split("&")
   split_query = []
   query_string.each do |string|
     split_query << string.split("=")
     split_query.flatten
  end
    Hash[*split_query.flatten(1)]
 end

 def fragment_id
   @new_url.split("/")[3].split("#")[1]
 end
end
