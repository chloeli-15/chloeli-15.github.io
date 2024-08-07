module Jekyll
    class ListPhotos < Generator
      safe true
  
      def generate(site)
        # Define the directories you want to read
        cat_photos_dir = File.join(site.source, 'assets/images/cats')
        art_photos_dir = File.join(site.source, 'assets/images/art')
  
        # Read the files from the directories
        site.data['cat_photos'] = Dir.children(cat_photos_dir).select { |f| File.file?(File.join(cat_photos_dir, f)) }
        site.data['art_photos'] = Dir.children(art_photos_dir).select { |f| File.file?(File.join(art_photos_dir, f)) }
      end
    end
  end
  