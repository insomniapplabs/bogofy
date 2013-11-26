class Transaction < ActiveRecord::Base

	belongs_to :user
	belongs_to :store

	validates :spent, numericality: true, presence: true
	validates :saved, numericality: true, presence: true
	validates :date, presence: true

	def average_savings
		total = self.spent + self.saved
		average = self.saved / total
		average * 100
	end

end
