Jekyll::Hooks.register :site, :post_write do |site|
    readme_file = File.join(site.dest, "README.md")
    
    if File.exist?(readme_file)
      File.delete(readme_file)
    end
end  