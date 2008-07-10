# Wraps the command line utilities md5sum (Linux) and md5 (Mac).
class Md5Wrapper
  class << self
    # Validate that the file has this md5 hexdigest.
    def check_md5sum(filename, md5sum)
      raise ArgumentError, "Invalid md5sum" unless md5sum.size == 32
      raise ArgumentError, "Invalid file" unless File.exist? filename and File.file? filename and File.readable? filename
      
      if RUBY_PLATFORM =~ /darwin/
        md5 = `md5 #{filename} 2>&1`.strip[-32,32]
        return md5 == md5sum
      else # linux
        cmd = "echo \"#{md5sum} *#{filename}\" | md5sum -c --status 2>&1"
        return system(cmd)
      end
    end
    
    # Extract the md5 hexdigest from a file.
    def get_md5sum(filename)
      raise ArgumentError, "Invalid file" unless File.exist? filename and File.file? filename and File.readable? filename
      if RUBY_PLATFORM =~ /darwin/
        return `md5 #{filename} 2>&1`.strip[-32,32]
      else # linux
        return `md5sum -b #{filename} 2>&1`[0,32]
      end
    end
  end
end