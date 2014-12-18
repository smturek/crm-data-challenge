require 'pp'
require_relative '../data/CRM'

result = []

CRM[:companies].each do |company|
  @company_hash = {}
  @company_hash[:name] = company[:name]
  @company_hash[:employees] ||= []

  CRM[:people].each do |person|
    @employment_hash = {}
    @employment_hash[:id] = person[:id]
    @employment_hash[:first_name] = person[:first_name]
    @employment_hash[:last_name] = person[:last_name]
    person[:employments].each do |employment|
      if employment[:company_id] == company[:id]
        @employment_hash[:title] = employment[:title]
        @company_hash[:employees] << @employment_hash
      end
    end
  end
  result << @company_hash
end

pp result
