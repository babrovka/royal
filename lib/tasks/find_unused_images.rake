# to work need ack
# It requires ACK - http://betterthangrep.com/
# brew install ack | apt-get install ack-grep
#
#
#
# last version in https://gist.github.com/justVitalius/25318a1d71bcc657ee21
task :find_unused_images do
  images = Dir.glob('app/assets/images/**/*')

  images_to_delete = []
  images.each do |image|
    unless File.directory?(image)
      # print "\nChecking #{image}..."
      print "."
      result = `ack -1 --ruby --html --css --js #{File.basename(image)}`
      if result.empty?
        images_to_delete << image
      else
      end
    end
  end
  puts "\n\nDelete #{images_to_delete.count} unused files running the command below:"
  puts "rm #{images_to_delete.join(" ")}"
end