class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods

  def city_openings(date1, date2)
    city = City.all
    openings = []
    city.each do |listing|
      listing.listings.each do |list|
        if (list.created_at.strftime("%Y-%m-%d").between?(date1, date2))
          openings << list
        end
      end
    end
    return openings
  end

end

#  City.first.listings[1].created_at.strftime("%Y-%m-%d").between?("2023-09-10", "2023-09-13")