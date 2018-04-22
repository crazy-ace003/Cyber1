require'colorize'
require 'mechanize'
#require'json'


#Just change the url bellow to the def con 
#https://media.defcon.org/DEF%20CON%2025/DEF%20CON%2025%20presentations/
#https://media.defcon.org/DEF%20CON%2023/DEF%20CON%2023%20presentations/
#.....

#gem install colorize
#gem install mechanize

agent = Mechanize.new
page = agent.get("https://media.defcon.org/DEF%20CON%2023/DEF%20CON%2023%20presentations/")
link = page.parser.xpath('//*[@id="list"]/tbody/tr["i"]/td[1]/a')
link.each do |links|
f_name = links['href']
link = "https://media.defcon.org/DEF%20CON%2023/DEF%20CON%2023%20presentations/" + f_name
if link.include?("Extra")
    puts"[+] Skipping directory".red
elsif link.include?(".pdf")
    puts"[+] Downloading: #{f_name}".green
agent.get(link).save(f_name)
else
    puts""
end
end
