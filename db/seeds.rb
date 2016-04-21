user_admin = User.create(
  first_name: "Tim",
  last_name: "Craig",
  email: "tim@odsc.com",
  password: "asdfasdf",
  role: "admin"
)

user1 = User.create(
  first_name: "Alpha",
  last_name: "Alpherson",
  email: "alpha@gmail.com",
  password: "asdfasdf"
)

user2 = User.create(
  first_name: "Beta",
  last_name: "Beterson",
  email: "beta@gmail.com",
  password: "asdfasdf"
)

user3 = User.create(
  first_name: "Delta",
  last_name: "Delterson",
  email: "delta@gmail.com",
  password: "asdfasdf"
)

user4 = User.create(
  first_name: "Gamma",
  last_name: "Gammerson",
  email: "gamma@gmail.com",
  password: "asdfasdf"
)

user5 = User.create(
  first_name: "Phi",
  last_name: "Phison",
  email: "phi@gmail.com",
  password: "asdfasdf"
)

Profile.create(
  company: "ODSC",
  biography: "I make sick Web Apps",
  user: user_admin
)

Profile.create(
  company: "Alpha Data Science",
  biography: "Data Science is awesome!",
  user: user1
)

Profile.create(
  company: "Beta Machine Learning",
  biography: "I love scikit-learn!",
  user: user2
)

Profile.create(
  company: "Delta Data Visualization",
  biography: "I want to learn more about Data Visualization.",
  user: user3
)

Profile.create(
  company: "Gamma Deep Learning",
  biography: "I build neural networks for my company.",
  user: user4
)

Profile.create(
  company: "",
  biography: "",
  user: user5
)
