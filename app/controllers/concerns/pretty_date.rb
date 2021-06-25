module PrettyDate extend ActiveSupport::Concern

    included do
    end

    def pretty_date(date)
        date = date.to_s.split('T',1)[0].split(' ')
        #date = date[0].to_s + '_' + date[1].to_s
        date = date[0].split('-')[0].to_s
    end
end