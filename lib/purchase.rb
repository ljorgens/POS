class Purchase < ActiveRecord::Base
  has_and_belongs_to_many(:products)
  scope(:between, -> do (start_and_end_dates)
    where("created_at >= :start_date AND created_at <= :end_date", { start_date: start_date_and_end_dates.at(0), end_date: start_and_end_dates.at(1) })
  end)

end
