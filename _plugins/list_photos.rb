module Jekyll
    class ListPhotos < Generator
      safe true
  
      def generate(site)
        # Define the directories you want to read
        cat_photos_dir = File.join(site.source, 'assets/images/cats')
        art_photos_dir = File.join(site.source, 'assets/images/art')
  
        # Read the files from the directories and handle common image extensions
        site.data['cat_photos'] = read_images(cat_photos_dir)
        site.data['art_photos'] = read_images(art_photos_dir)
  
        # Output to the console for debugging
        puts "Cat Photos: #{site.data['cat_photos'].inspect}"
        puts "Art Photos: #{site.data['art_photos'].inspect}"
      end
  
      def read_images(dir)
        return [] unless Dir.exist?(dir)
        Dir.children(dir).select { |f| f =~ /\.(jpg|jpeg|png|gif)$/i && File.file?(File.join(dir, f)) }
      end
    end
  end
  