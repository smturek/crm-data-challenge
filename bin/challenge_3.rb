require 'pp'
require_relative '../data/CRM'

result = []

CRM[:people].each do |person|
  if person[:employments].empty?
    @unemployed = {}
    @unemployed[:id] = person[:id]
    @unemployed[:first_name] = person[:first_name]
    @unemployed[:last_name] = person[:last_name]
    result << @unemployed
  end
end



pp result
