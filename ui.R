
shinyUI(pageWithSidebar(
    titlePanel("Estimate Weekly Box Office Gross"),
    sidebarPanel(
      helpText("This prediction engine utilizes the MARS algorithm to predict the estimated 
              total box office in North America on any given week of the year, based on 
               the historical box office data from 2003-2013. The other parameters 
               which it utilizes in this prediction are:
               1) Total number of films that will be in theaters in that week.
               2) Total number of theaters in which these films are showing. 
               3) Total estimated production cost for all these films.
               4) Number of Sequels in theaters that week."),
      selectInput("WK", label = h4("Select Week Number between 1 to 48"),
                  choices = list('Wk1','Wk2','Wk3','Wk4','Wk5','Wk6','Wk7','Wk8','Wk9','Wk10',
                                'Wk11','Wk12','Wk13','Wk14','Wk15','Wk16','Wk17','Wk18','Wk19',
                                'Wk20','Wk21','Wk22','Wk23','Wk24','Wk25','Wk26','Wk27','Wk28',
                                'Wk29','Wk30','Wk31','Wk32','Wk33','Wk34','Wk35','Wk36','Wk37',
                                'Wk38','Wk39','Wk40','Wk41','Wk42','Wk43','Wk44','Wk45','Wk46',
                                'Wk47','Wk48'), selected = 'Wk1'),
      sliderInput('PROD', label = h4("Enter Estimated Production Cost for All the Movies in Theaters that week"),
                     0,min=0,max=2500,step=100),
      sliderInput('NUMTHEATERS', label = h4("Enter Total Number of Theaters for All the Movies in release that week"),
                 0,min=0,max=100000,step=1000),
      sliderInput('SEQFLAG', label = h4("Enter Total Number of Sequels In Theaters that week"),
                 0,min=0,max=10,step=1),
      sliderInput('NUMFILMS', label = h4("Enter Total Number of Films in Theaters that week"),
                 0,min=0,max=50,step=5),
      width = 10,
      submitButton('Run Weekly')),
      mainPanel(
        h2("Estimated Box Office is:"),
        textOutput("pred_bo")
    )
))
