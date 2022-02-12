# Ruby integration:
# Use Twitter API data to make a function which decides the cut off point for valence of a particular emotion (anger, fear)
# Sets the threshold for removing a tweet.
# The function would then tell the js controller which tweets to remove.

# Scores
#  < .5 = None
#  .5 ~ .75 = Normal
#  > .75 = Strong

#  Threshhold = Hide tweets labeled with a STRONG

#  Notes:
#  If statement that invokes JS to hidetweets deemed strong by the IBM API
