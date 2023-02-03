class Candidate < ApplicationRecord

    validates :name , presence: true
    has_many :vote_logs

    scope :young_people,-> {where("age<60")}
    scope :order_than, -> (x) { unscope(:where).where("age < #{x} ")}

    default_scope {where ('age > 0')}
end
