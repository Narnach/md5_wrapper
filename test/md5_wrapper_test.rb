$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'test/unit'
require 'md5_wrapper'
require 'tempfile'

class Md5WrapperTest < Test::Unit::TestCase
  def setup
    @fixture = File.expand_path(File.join(File.dirname(__FILE__),'fixtures','test.txt'))
    @md5sum = 'd8e8fca2dc0f896fd7cb4cb0031ba249'
  end

  def test_get_md5sum
    assert_equal @md5sum, Md5Wrapper.get_md5sum(@fixture)
  end

  def test_check_md5sum
    assert Md5Wrapper.check_md5sum(@fixture, @md5sum)
  end

  def test_get_md5sum_for_filenames_with_spaces
    Tempfile.open('text file with spaces.txt') do |f|
      File.open(f.path,'w') do |fp|
        fp.puts 'test'
      end
      assert_equal @md5sum, Md5Wrapper.get_md5sum(f.path)
    end
  end

  def test_check_md5sum_for_filenames_with_spaces
    Tempfile.open('text file with spaces.txt') do |f|
      File.open(f.path,'w') do |fp|
        fp.puts 'test'
      end
      assert Md5Wrapper.check_md5sum(f.path,@md5sum)
    end
  end
end
