Ransack.configure do |config|
  config.add_predicate 'dateequals',
                       :arel_predicate => 'eq',
                       :formatter => proc {|v| v.to_date.to_s(:db) },
                       :validator => proc {|v| v.present?},
                       :compounds => true,
                       :type => :datetime
end