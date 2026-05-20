require 'fileutils'
require 'digest'
require 'open3'

Jekyll::Hooks.register [:pages, :documents], :post_convert do |page|
  next unless page.ext == ".md" || page.ext == ".html"
  
  # Look for <script type="text/tikz"> blocks
  next unless page.content.include?('type="text/tikz"')

  page.content.gsub!(/<script type="text\/tikz">(.*?)<\/script>/m) do |match|
    tikz_code = $1.strip
    
    # Create a unique hash for caching
    hash = Digest::MD5.hexdigest(tikz_code)
    cache_dir = File.join(Dir.pwd, ".tikz_cache")
    FileUtils.mkdir_p(cache_dir)
    
    svg_path = File.join(cache_dir, "#{hash}.svg")
    
    # Only render if the SVG doesn't exist in cache
    unless File.exist?(svg_path)
      Jekyll.logger.info "TikZ:", "Generating SVG for hash #{hash} in #{page.path}"
      
      tex_template = <<~TEX
        \\documentclass[tikz]{standalone}
        \\usetikzlibrary{backgrounds}
        \\begin{document}
        #{tikz_code}
        \\end{document}
      TEX
      
      tex_file = File.join(cache_dir, "#{hash}.tex")
      File.write(tex_file, tex_template)
      
      # Run latex to generate DVI, then dvisvgm to generate SVG
      # We use --no-fonts to convert glyphs to paths for maximum compatibility
      latex_cmd = "latex -interaction=nonstopmode #{hash}.tex > /dev/null 2>&1"
      Open3.capture3(latex_cmd, chdir: cache_dir)

      svg_cmd = "dvisvgm --font-format=woff2 --exact --stdout --verbosity=0 #{hash}.dvi"
      stdout, stderr, status = Open3.capture3(svg_cmd, chdir: cache_dir)
      
      if status.success?
        # Extract only the <svg> element to strip XML headers and any leaking logs
        svg_only = stdout[/<svg.*<\/svg>/m]
        File.write(svg_path, svg_only || "<!-- SVG parsing failed -->")
      else
        Jekyll.logger.error "TikZ Error:", stderr
      end
    end
    
    if File.exist?(svg_path)
      File.read(svg_path)
    else
      "<!-- TikZ Render Failed -->" + match
    end
  end
end