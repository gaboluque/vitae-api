User.create(
  email: 'admin@vitae.com',
  password: '123456',
  password_confirmation: '123456',
  admin: true,
  profile_attributes: {
    name: 'Gabriel',
    phone: '314046079',
    location: 'Bogotá, Colombia',
    gender: 'male',
    description: '',
    birth_date: '03-03-1995'
  }
)
