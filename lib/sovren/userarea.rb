module Sovren
  class UserArea
    attr_accessor :language, :country, :description, :months_worked, :best_fit, :fit_percentage, :parse_time

    def self.parse(user_area)
      return Array.new if user_area.nil?
      result = user_area.css('sov|ResumeUserArea').collect do |item|
        r = UserArea.new
        r.language = item.css('sov|Culture sov|Language').text
        r.country = item.css('sov|Culture sov|Country').text
        r.description = item.css('sov|ExperienceSummary sov|Description').text
        r.months_worked = item.css('sov|ExperienceSummary sov|MonthsOfWorkExperience').text
        r.fit_percentage = item.css('sov|ExperienceSummary sov|BestFitTaxonomies sov|BestFitTaxonomy').first.attribute('percentOfOverall').text
        r.best_fit = item.css('sov|ExperienceSummary sov|BestFitTaxonomies sov|BestFitTaxonomy').first.attribute('name').text
        r.parse_time = item.css('sov|ParseTime').text
        r
      end
      result
    end
  end
end