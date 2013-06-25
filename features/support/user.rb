Before do
  u1 = User.new(
    email: 'catface@drydiary.com',
    username: 'catface',
    password: 'test1234',
    pronoun:  'their',
    addiction: 'catnip'
  )
  u2 = User.create!(
    email: 'dogface@drydiary.com',
    username: 'dogface',
    password: 'test1234',
    pronoun:  'their',
    addiction: 'fetch'
  )

  [u1,u2].each { |u| u.skip_confirmation! ; u.save }
end
