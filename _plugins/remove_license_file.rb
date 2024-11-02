Jekyll::Hooks.register :site, :post_write do |site|
    license_file = File.join(site.dest, "LICENSE")
    
    if File.exist?(license_file)
      File.delete(license_file)
    end
end  