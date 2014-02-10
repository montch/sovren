module Sovren
  class NonXMLResume
    attr_accessor :text_resume

    def self.parse(non_xml_resume)
      return Array.new if non_xml_resume.nil?
      result = non_xml_resume.css('NonXMLResume').collect do |item|
        r = NonXMLResume.new
        r.text_resume = item.css('TextResume').text  rescue nil
        r
      end
      result
    end
  end
end