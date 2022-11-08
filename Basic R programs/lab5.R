# Lab 5, Team 1
# Patrick Walsh, Mark Stiles, Blessy Thomas, Hannah VanTilburg, Kelsey Kirby

# 0. load the ggplot library
library(ggplot2)

#1. Run those two lines of code. What happens? 
# How do you actually “invoke” the plot (i.e., how do you get it to draw in the plot window)? 
myPlot <- ggplot(economics, aes(x=date))  # This line loads the economics dataset and sets the X axis to date
myPlot <- myPlot + geom_line(aes(y=psavert))  # This line specifies the type of chart as a line chart and sets Y axis to psavert
myPlot  # This line invokes the chart


#2. Run help("economics") to find out the meaning of the psavert variable. 
help("economics")

#3. Examine the plot to estimate when the personal savings rate reached its maximum value. 
# Also examine the plot to estimate when the personal savings rate reached its minimum value. 
# The personal savings rate reached its max value around 1975-1976.
# The personal savings rate reached its min value around 2006.

#4. Use which.max( ) and which.min( ) to verify your guesses from problem 3. 
which.max(economics$psavert)  # <---get index
economics[95,]

which.min(economics$psavert)  # <---get index
economics[457,]

#5. Change the color of the plot line to green. Hint: Changing a line to a constant color happens in the specification of the geometry. 
myPlot <- myPlot + geom_line(aes(y=psavert), color="green")
myPlot

#6. Add a title to the plot with the ggtitle("Put title here") sub-command. 
# The title "Personal Savings Rate: 1967-2014" would be a good choice. 
# This is the end of the first breakout session. Please send a chat message to your instructor when you are finished. 
myPlot <- ggplot(economics, aes(x=date))+
  geom_line(aes(y=psavert), color="green")+
  ggtitle("Personal Savings Rate: 1967-2014")
myPlot

###Second Breakout Session Starts Here 



#7. Add another data series to your plot to show the variable uempmed as a red line. 
myPlot <- ggplot(economics, aes(x=date))+
  geom_line(aes(y=psavert), color="green")+
  geom_line(aes(y=uempmed), color="red")+
  ggtitle("Personal Savings Rate: 1967-2014")
myPlot 

#8. Change the title of the plot to mention both variables.
myPlot <- ggplot(economics, aes(x=date))+
  geom_line(aes(y=psavert), color="green")+
  geom_line(aes(y=uempmed), color="red")+
  ggtitle("Personal Savings Rate: 1967-2014 & Uempmed Chart")
myPlot  

#9. You can modify the axis labels in a ggplot with ylab( ) and xlab( ) subcommands. 
# Change the axis labeling as needed to account for plotting both psavert and uempmed in the same window. 
myPlot <- ggplot(economics, aes(x=date))+
  geom_line(aes(y=psavert), color="green")+
  geom_line(aes(y=uempmed), color="red")+
  xlab("Year")+
  ylab("Personal Savings & Uempmed")+
  ggtitle("Personal Savings Rate: 1967-2014 & Uempmed Chart")
myPlot 

#10. Create one last plot, creating a scatter plot, having the unemploy on the x-axis, psavert on the yaxis. 
# Color each point based on the uempmed. 
myPlot <- ggplot(economics, aes(x=unemploy, y=psavert))+
  geom_point(color=economics$uempmed)+
  xlab("Unemployment")+
  ylab("Personal Savings Rate")+
  ggtitle("Scatter Plot")
myPlot


#11. Interpret what you see in this last graph 
# Most people have a personal savings rate of around 5%. 

#12. Make sure your code has nice comments!
# nice!

