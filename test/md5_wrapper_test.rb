require 'test/unit'
require 'md5_wrapper'

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
end
