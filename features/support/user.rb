Before do
  User.create!(
    email: 'catface@drydiary.com',
    username: 'catface',
    password: 'test1234',
    pronoun:  'their',
    addiction: 'catnip'
  )
  User.create!(
    email: 'dogface@drydiary.com',
    username: 'dogface',
    password: 'test1234',
    pronoun:  'their',
    addiction: 'fetch'
  )
end
