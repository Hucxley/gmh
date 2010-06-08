class Monster
  include Mongoid::Document

  field :name, :type => String
  field :initiative, :type => Integer

  def self.parse_from_google_html(html)
    doc = Nokogiri::HTML::Document.parse(html)
    name = doc.xpath('/html/body/p/span/font').first.content.titleize
    initiative = doc.xpath('/html/body/table/tr[3]/td[2]/p/span/font').first.content

    Monster.new(:name => name,
                :initiative => initiative)
  end
end
