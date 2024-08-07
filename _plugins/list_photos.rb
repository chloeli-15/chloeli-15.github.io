module Jekyll
    class ListPhotos < Generator
      safe true
  
      def generate(site)
        # Define the directories you want to read
        cat_photos_dir = File.join(site.source, 'assets/images/cats')
        art_photos_dir = File.join(site.source, 'assets/images/art')
  
        # Read the files from the directories
        cat_photos = Dir.children(cat_photos_dir).select { |f| File.file?(File.join(cat_photos_dir, f)) }
        art_photos = Dir.children(art_photos_dir).select { |f| File.file?(File.join(art_photos_dir, f)) }
  
        # Output to the console for debugging
        puts "Cat Photos: #{cat_photos.inspect}"
        puts "Art Photos: #{art_photos.inspect}"
  
        # Assign to site data
        site.data['cat_photos'] = cat_photos
        site.data['art_photos'] = art_photos
      end
    end
  end
  