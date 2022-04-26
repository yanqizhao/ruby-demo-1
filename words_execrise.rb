def to_words(s)
	# 字符替换
	s.gsub(/[^\da-zA-Z\s]/, '') # 除了数字字母空格之外，其他都用空字符替换
end

require 'test/unit'

class TowordsTest < Test::Unit::TestCase
	def test_1
		puts TowordsTest.superclass
		assert_equal '3 the Magic Number', to_words('#3, the *Magic, Number*?')
	end
end