# space150 vine-to-GIF
# given a vine.co uri, downloads the MP4 and creates an image sequence / GIF from it
# requires ruby, ffmpeg, and imagemagick

require 'open-uri'
require 'nokogiri'

id = ARGV[0]

# try to convert from URL to id. 
id = id.match(/\/v\/(.+)$/)[1] rescue nil # id

unless id 
  puts "usage: gifvine.rb {url}"
  exit
end

# extract the MP4 url
response = open("https://vine.co/v/#{id}/card").read
doc = Nokogiri::HTML(response)

src       = doc.at_css("video source").attr(:src)
basename  = URI(src).path.gsub('/videos/', '')
query     = URI(src).query
filename  = basename + "?" + query
folder    = "v/#{basename.gsub(/\.mp4$/, '')}"


# download the MP4
`mkdir -p v`
`curl -s "#{src}" -o "v/#{basename}"`


# make a folder for the images
`mkdir -p #{folder}`


# convert the MP4 to 24 frames (4fps * 6s = 24)
`ffmpeg -i "v/#{basename}" -y -f image2 -vf fps=fps=4 "#{folder}/output%04d.jpg"`


# and also convert the MP4 to a GIF
`ffmpeg -i "v/#{basename}" -pix_fmt rgb24 -r 4 "#{folder}.gif"`


# optimize the gif
#   via http://superuser.com/questions/436056/how-can-i-get-ffmpeg-to-convert-a-mov-to-a-gif
`convert -layers Optimize "#{folder}.gif" "#{folder}.gif"`

