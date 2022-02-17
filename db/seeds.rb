
puts "Deleting users ..."
User.destroy_all
puts "Done."
puts "Creating users ..."
mom = User.create(email: "mom@gmail.com", password: 1234567, first_name: "Mom", last_name: "Mommy")
dad = User.create(email: "dad@gmail.com", password: 1234567, first_name: "Dad", last_name: "Daddy")
puts "Done."
puts "Creating kids ..."
luke = Kid.new(
  first_name: "Luke",
  last_name: "Benly",
  age: 12,
  birthday: "Wed, Jan 13 2010",
  user: mom
)
brenna = Kid.new(
  first_name: "Brenna",
  last_name: "Bentel",
  age: 13,
  birthday: "Thur, Feb 13 2009",
  user: dad
)
luke.dictionary = Dictionary.new
brenna.dictionary = Dictionary.new
luke.save
brenna.save
puts "done"

puts "destroying articles ..."
Article.destroy_all
puts "done"
puts "creating articles"
Article.create(
  title: "Kid Fears",
  date: "January 1, 2003",
  author: "Colin Allen",
  content: "
  Both the nature and amount of abuse play a role in a child's future mental health. But all abuse works on the mind in a similar way, explains Berrill. 'What happens is a kid is psychologically ground down. They are diminished. They are traumatized emotionally and physically.'
  Why do abusers strike? There is some truth to the notion that violence begets more violence. But stress—from work, relationships and even the children themselves—is also a major factor. '[Abusers] find these kids as easy targets,' explains Berrill.
  'Rearing kids can be stressful. If you are feeling overwhelmed or stressed, immediately reach out for help,' he advises. The good news is that abusive behavior can be prevented through learning how to better cope with stress.
  ",
  image: "blue"
)
Article.create(
  title: "Antidepressants: The Kid Question",
  date: "February 1, 2004",
  author: "Hara Estroff Marano",
  content: "
As 2004 gets underway, antidepressant medications are on the pharmacologic
equivalent of orange alert. Safety concerns raised anew in mid-2003 shadow
the skyrocketing use of selective serotonin reuptake inhibitors in children and adolescents.
Last June, the Food and Drug Administration advised U.S. physicians that America’s most
prescribed antidepressant, the SSRI Paxil, should not be used in children and adolescents
under age 18 due to a possible increased risk of suicidal thoughts and attempts.
The agency recommendation followed close on the heels of a similar action in Britain.
By late October, however, the FDA, had, in its own words, 'backed off a little bit.'
It issued a public health advisory stating that the agency had grown 'increasingly skeptical'
that there was any link between antidepressant use and the risk of suicide in children and teenagers.
Specialists around the country believe that in contrast to a ban imposed by British regulators, the FDA is
already charting a nuanced approach to medication availability, one that grapples with the difficult
realities of depression and its treatment at a stage in life when impulsive behavior is at its height.
  ",
  image: "blue"
)
Article.create(
  title: "Stressing Your Kids Out",
  date: "March 1, 2000",
  author: "Camille Chatterjee",
  content: "
With people working longer hours and more families bringing in two incomes,
it's harder than ever for parents to leave their stress in the office.
But for their children's sake, they should.
'Parents who experience more pressure at work feel more overloaded
in general and are more prone to arguing with their children,'
explains Ann Crouter, Ph.D., professor of human development at Penn State University.
'In turn, their kids feel less good about themselves,' becoming depressed or developing
feelings of low self-worth. Parents under pressure may be less tolerant of tempestuous
adolescent behavior, Crouter believes, causing additional conflict.
  ",
  image: "blue"
)
puts "done"
