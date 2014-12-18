require 'pp'
require_relative '../data/CRM'

result = []

CRM[:companies].each do |company|
  @employment_hash = {}
  @employment_hash[:company_id] = company[:id]
  @employment_hash[:company_name] = company[:name]
  result << @employment_hash
end

result.each do |company|
  CRM[:people].each do |person|
    person[:employments].each do |employment|
      if employment[:company_id] == company[:company_id]
        company[:person_id] = person[:id]
        company[:person_first_name] = person[:first_name]
        company[:person_last_name] = person[:last_name]
        company[:title] = employment[:title]
      end
    end
  end
end


pp result
