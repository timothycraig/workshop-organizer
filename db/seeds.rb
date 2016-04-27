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
  first_name: "Andreas",
  last_name: "Meuller",
  email: "scikitlearn@gmail.com",
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
  first_name: "Wes",
  last_name: "McKinney",
  email: "phi@gmail.com",
  password: "asdfasdf"
)

Profile.create(
  company: "Open Data Science",
  biography: "I make sick Web Apps",
  linkedin_url: "https://www.linkedin.com",
  twitter_url: "https://twitter.com",
  user: user_admin
)

Profile.create(
  company: "Alpha Data Science",
  biography: "Data Science is awesome!",
  linkedin_url: "https://www.linkedin.com",
  twitter_url: "https://twitter.com",
  user: user1
)

Profile.create(
  company: "NYU Center for Data Science",
  biography: "I love scikit-learn!",
  linkedin_url: "https://www.linkedin.com",
  twitter_url: "https://twitter.com",
  user: user2
)

Profile.create(
  company: "Delta Data Visualization",
  biography: "I want to learn more about Data Visualization.",
  linkedin_url: "https://www.linkedin.com",
  twitter_url: "https://twitter.com",
  user: user3
)

Profile.create(
  company: "Gamma Deep Learning",
  biography: "I build neural networks for my company.",
  linkedin_url: "https://www.linkedin.com",
  twitter_url: "https://twitter.com",
  user: user4
)

Profile.create(
  company: "Cloudera",
  biography: "Wes McKinney is the main author of pandas, the popular open source
  Python library for data analysis. He is an active speaker and participant in the Python
  and open source communities and is currently an engineer at Cloudera. He worked as a
  quantitative analyst at AQR Capital Management and Python consultant before founding DataPad,
  a data analytics company, in 2013. He graduated from MIT with an S.B. in Mathematics.",
  linkedin_url: "https://www.linkedin.com",
  twitter_url: "https://twitter.com",
  user: user5
)

Workshop.create(
  title: "Intro to Machine Learning",
  date: "2016-5-20-08:00",
  capacity: 25,
  abstract: "In this workshop, I will give an introduction to machine learning.
  We will use python and the jupyter notebook.  We will go over the history of machine learning.",
  user: user1
)

Workshop.create(
  title: "Intro to scikit-learn",
  date: "2016-5-20-16:00",
  capacity: 25,
  abstract: "Scikit-learn has emerged as one of the most popular open source machine learning toolkits,
  now widely used in academia and industry. scikit-learn provides easy-to-use interfaces to perform
  advanced analysis and build powerful predictive models. This workshop will provide an
  interactive introduction into using scikit-learn. on us will cover basic concepts of machine learning,
  such as supervised and unsupervised learning, cross validation and model selection.
  We will see how to prepare data for machine learning, and go from applying a single algorithm
  to building a machine learning pipeline. Please download the material beforehand.
  It will be provided at https://github.com/amueller/odscon-sf-2015 It is recommended to use the
  anaconda python distribution, which comes with all packages that are needed for the workshop
  https://store.continuum.io/cshop/anaconda/ The requirements are numpy, scipy, matplotlib,
  Jupyter notebook and scikit-learn. Make sure you can run the jupyter notebooks included in the material.",
  user: user2
)

Workshop.create(
  title: "Intro to R for Data Science",
  date: "2016-5-20-14:00",
  capacity: 25,
  abstract: "Bayesian statistical methods are becoming more common and more important,
  but there are not many resources to help beginners get started.
  People who know Python can use their programming skills to get a head start.
  I will present simple programs that demonstrate the concepts of Bayesian statistics,
  and apply them to a range of example problems.
  Participants will work hands-on with example code and practice on example problems.
  Attendees should have at least basic level Python and basic statistics.",
  user: user3
)

Workshop.create(
  title: "Intro to Deep Learning",
  date: "2016-5-20-10:00",
  capacity: 25,
  abstract: "In this workshop, I will give an introduction to deep learning and neural
  networks.  We will use python.  We will go over the history of deep learning.",
  user: user4
)

Workshop.create(
  title: "Ibis: Scalable Python Analytics on Hadoop and SQL Engines",
  date: "2016-5-20-18:00",
  capacity: 25,
  abstract: "While Python is a de-facto language for modern data engineering and data science,
  Python development has been confined to local data processing—thereby limiting its users to smaller data sets.",
  user: user5
)
