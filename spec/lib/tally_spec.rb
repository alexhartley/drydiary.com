require 'spec_helper'

describe Tally do

  before do
    DatabaseCleaner.clean
  end

  let (:user) { User.create!(email: 'cat@cat.com',
                             addiction: 'catnip',
                             password: 'password1',
                             username: 'catface') }

  let (:calculator) { Tally.new(user) }

  it 'counts the number of consecutive ticked days' do
    user.days.create(date: Date.today,     ticked: true)
    user.days.create(date: Date.yesterday, ticked: true)
    user.days.create(date: 2.days.ago,     ticked: true)
    user.days.create(date: 3.days.ago,     ticked: false)
    user.days.create(date: 4.days.ago,     ticked: true)
    calculator.calculate.should eq 3
  end

  it 'does not count today as a failure if it has not yet been ticked' do
    user.days.create(date: Date.today,     ticked: false)
    user.days.create(date: Date.yesterday, ticked: true)
    user.days.create(date: 2.days.ago,     ticked: true)
    user.days.create(date: 3.days.ago,     ticked: false)
    user.days.create(date: 4.days.ago,     ticked: true)
    calculator.calculate.should eq 2
  end

  it 'counts any missing days as failures' do
    user.days.create(date: Date.today,     ticked: true)
    user.days.create(date: Date.yesterday, ticked: true)
    user.days.create(date: 3.days.ago,     ticked: false)
    user.days.create(date: 4.days.ago,     ticked: true)
    calculator.calculate.should eq 2
  end

end
