library(earth)

#PREDICTION FUNCTION
wkly_predict<- function(PROD,NUMTHEATERS,SEQFLAG,NUMFILMS,WK) {
  x <- read.csv("WklyGrosses.11.22.2015.csv",header=TRUE,sep=",")
  fit <- earth(log(x$WEEKLYGROSS)~., data=x, degree=2)
  wks<-matrix(rep(0,48),nrow=1,ncol=48)
  wks<-data.frame(wks)
  names(wks)<-c('Wk1','Wk2','Wk3','Wk4','Wk5','Wk6','Wk7','Wk8','Wk9','Wk10',
                'Wk11','Wk12','Wk13','Wk14','Wk15','Wk16','Wk17','Wk18','Wk19',
                'Wk20','Wk21','Wk22','Wk23','Wk24','Wk25','Wk26','Wk27','Wk28',
                'Wk29','Wk30','Wk31','Wk32','Wk33','Wk34','Wk35','Wk36','Wk37',
                'Wk38','Wk39','Wk40','Wk41','Wk42','Wk43','Wk44','Wk45','Wk46',
                'Wk47','Wk48')
  wks[WK]<-1
  new_input <- data.frame('PROD'=PROD,'NUMTHEATERS'=NUMTHEATERS,
                          'SEQFLAG'=SEQFLAG,'NUMFILMS'=NUMFILMS)
  new_input <- cbind(new_input,wks)
  paste("$",formatC(exp(predict(fit,new_input)),format = 'd', big.mark = ','),sep="")
}

#SERVER
shinyServer(
    function(input, output) {
      
      output$pred_bo <- renderPrint({wkly_predict(input$PROD,input$NUMTHEATERS,
                                                  input$SEQFLAG,input$NUMFILMS,input$WK)})
    }
)