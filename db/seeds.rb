user_admin = User.create(
  first_name: "Tim",
  last_name: "Craig",
  email: "tim@odsc.com",
  password: "asdfasdf",
  role: "admin"
)

user1 = User.create(
  first_name: "Dhiana",
  last_name: "Deva",
  email: "dhiana@gmail.com",
  password: "asdfasdf"
)

user2 = User.create(
  first_name: "Andreas",
  last_name: "Meuller",
  email: "andreas@gmail.com",
  password: "asdfasdf"
)

user3 = User.create(
  first_name: "Zachary",
  last_name: "Deane-Mayer",
  email: "delta@gmail.com",
  password: "asdfasdf"
)

user4 = User.create(
  first_name: "Emily",
  last_name: "Fuhrman",
  email: "emily@gmail.com",
  password: "asdfasdf"
)

user5 = User.create(
  first_name: "Wes",
  last_name: "McKinney",
  email: "wes@gmail.com",
  password: "asdfasdf"
)

user6 = User.create(
  first_name: "Owen",
  last_name: "Zhang",
  email: "owen@gmail.com",
  password: "asdfasdf"
)

Profile.create(
  company: "Open Data Science",
  biography: "I make sick Web Apps.",
  linkedin_url: "https://www.linkedin.com",
  twitter_url: "https://twitter.com",
  user: user_admin
)

Profile.create(
  company: "Spotify",
  biography: " Dhiana Deva is a software developer and applies agile and lean
  practices on companies with big ambitions. As a student of Electronics and
  Computer Engineering at the Federal University of Rio de Janeiro, she engaged
  in relevant research, including a web system to support the diagnosis of tuberculosis
  using neural networks and an online selection algorithm for electrons at CERN, the
  European Organization for Nuclear Research, in Switzerland, where she had the opportunity
  to live the routine of one of the largest centers for scientific research of the world.
  Together with her career in software development, she also continues to dedicate to the
  machine learning field, studying and participating in challenges in this area. Recently,
  she received a special mention in the announcement of the winners of the Higgs
  Machine Learning Challenge",
  linkedin_url: "https://www.linkedin.com",
  twitter_url: "https://twitter.com",
  user: user1
)

Profile.create(
  company: "NYU Center for Data Science",
  biography: "Andreas Mueller received his MS degree in Mathematics (Dipl.-Math.)
  in 2008 from the Department of Mathematics at the University of Bonn. In 2013,
  he finalized his PhD thesis at the Institute for Computer Science at the University
  of Bonn. After working as a machine learning scientist at the Amazon Development
  Center Germany in Berlin for a year, he joined the Center for Data Science at the
  New York University in the end of 2014. In his current position as assistant
  research engineer at the Center for Data Science, he works on open source tools
  for machine learning and data science. He is one of the core contributors of scikit-learn,
  a machine learning toolkit widely used in industry and academia, for several years,
  and has authored and contributed to a number of open source projects related to machine learning",
  linkedin_url: "https://www.linkedin.com",
  twitter_url: "https://twitter.com",
  user: user2
)

Profile.create(
  company: "Data Robot",
  biography: "Zach is fascinated by predicting the future, and spends all of his
  free time competing in predictive modeling competitions. He is currently one of
  top 500 data scientists on Kaggle, and took 9th place in the Heritage Health Prize
  as part of the Analytics Inside team",
  linkedin_url: "https://www.linkedin.com",
  twitter_url: "https://twitter.com",
  user: user3
)

Profile.create(
  company: "Freelancer",
  biography: "Emily is a freelance data visualization designer and developer based
  in Brooklyn, NY. Prior to running her own practice, she held data visualization
  and analytics positions at Booz Allen Hamilton and Huge. Emily holds an M.S. in
  Predictive Analytics, and is currently pursuing an M.A. in English and Comparative
  Literature at Columbia University with a focus on the digital humanities.",
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

Profile.create(
  company: "Data Robot",
  biography: "Owen Zhang is the Chief Product Officer at DataRobot, and is ranked #1
  on the Kaggle leaderboard out of a community of 200,000 data scientists. Owen spent
  most of his career in the Property & Casualty insurance industry, most recently
  serving as Vice President of Modeling in the newly formed AIG Science team.
  After spending several years in IT building transactional systems for commercial
  insurance, Owen discovered his passion in Machine Learning and started building
  insurance underwriting, pricing, and claims models. Owen has a Masters degree in
  Electrical Engineering from University of Toronto and a Bachelors degree from University
  of Science and Technology of China.",
  linkedin_url: "https://www.linkedin.com",
  twitter_url: "https://twitter.com",
  user: user6
)

Workshop.create(
  title: "Machine Learning for Everyone",
  date: "2016-5-20-08:00",
  capacity: 50,
  abstract: "It’s no longer needed supercomputers and a team with PhDs from MIT
  to create predictive models based on data. We are witnessing innovations in machine
  learning that are making it an increasingly accessible field. This lecture aims to
  demystify machine learning through exposure to concepts and use of a number of technologies.
  In this talk, we will address the types of problems (classification, regression, clustering,
  dimensionality reduction, etc)., the steps (standardization, training, optimization,
  regularization, etc.) and the algorithms (linear regression, k-means, decision trees,
  neural networks, etc.), always applied to real problems. Also, open source tools like
  Scikit-learn, Pandas and R will be presented as well as a way to practice and try these
  ideas through competitions like Kaggle",
  user: user1
)

Workshop.create(
  title: "Introduction to scikit-learn",
  date: "2016-5-20-16:00",
  capacity: 50,
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
  title: "Introduction to R for Data Science",
  date: "2016-5-20-14:00",
  capacity: 50,
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
  title: "Data Visualization for Social Good",
  date: "2016-5-20-10:00",
  capacity: 50,
  abstract: "In this session, we will examine the process and implications of
  storytelling by composing and visualizing open data. We will focus on two areas.
  First, the weather across New York City is fairly uniform, but the temperature
  inside its buildings is not. Visualizing the frequency of 311 service calls about
  inadequate heat during winter on top of demographic data reveals a pattern that
  invites further investigation and raises questions about tenants’ rights and
  gentrification. Second, it is important for government, community organizers,
  and renters to know who owns the buildings in their neighborhood in order to
  be able to respond and mobilize effectively if the buildings are poorly maintained.
  It becomes especially important to know when a single owner has multiple properties
  throughout the city, though the process of finding this information is difficult
  and convoluted, often involving multiple city databases. Creating a user-friendly
  way for organizers to access this information reduces their workload and allows them
  to support more tenants.",
  user: user4
)

Workshop.create(
  title: "Scalable Python Analytics on Hadoop and SQL Engines",
  date: "2016-5-20-18:00",
  capacity: 25,
  abstract: "While Python is a de-facto language for modern data engineering and data science,
  Python development has been confined to local data processing—thereby limiting its users to smaller data sets.",
  user: user5
)

Workshop.create(
  title: "How I became a Data Scientist",
  date: "2016-5-20-18:00",
  capacity: 25,
  abstract: "This non-technical talk will describe how the presenter transitioned
  from a software developer in a corporate IT to a data scientist in a startup,
  with a focus on the practical lessons learned and interesting points observed along
  the way.",
  user: user6
)
