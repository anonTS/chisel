require "minitest/autorun"
require "minitest/pride"
require "../lib/lists_parser"

class ListsParserTest < Minitest::Test
  def test_it_exist
    list = ListsParser.new("markdown")
    assert list
  end

  def test_it_makes_unordered_lists_of_two
    list = ListsParser.new("* Sushi\n* Barbeque\n")
    assert_equal "<ul>\n<li>Sushi</li>\n<li>Barbeque</li>\n</ul>", list.to_ulist
  end

  def test_it_makes_unordered_lists_of_three
    list = ListsParser.new("* Sushi\n* Barbeque\n* Mexican\n")
    assert_equal "<ul>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican</li>\n</ul>", list.to_ulist
  end

  def test_it_replaces_ordered_lists_of_two
    list = ListsParser.new("1. Sushi\n2. Barbeque\n")
    assert_equal "<ol>\n<li>Sushi</li>\n<li>Barbeque</li>\n</ol>", list.to_olist
  end

  def test_it_replaces_ordered_lists_of_three
    list = ListsParser.new("1. Sushi\n2. Barbeque\n3. Mexican\n")
    assert_equal "<ol>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican</li>\n</ol>", list.to_olist
  end
end
