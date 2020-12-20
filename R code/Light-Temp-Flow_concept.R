#CONCEPTURAL FIGURES FOR LIGHT-TEMP-FLOW PAPER
#Issues:
#1 - Need distributions to reflect same total response, even if peak intensity decreases

#Setup
x <- seq(-6, 6, length=100)

colors <- c("red", "blue", "gold", "grey25")
labels <- c("Temperature", "Flow", "Light", "Response")

#Idealized Normal####
plot(x,  type="l", lty=1, xlab="Spring                       Summer                            Fall",
     ylab="Intensity", main="Natural Conditions", xaxt='n', yaxt='n', ylim=c(0,.8), xlim= c(-4, 3))
# for lines the x +/- shifts along x axis, 
# the dt(x, value) number changes amplitude,
# addting to the dt() before comma shifts up and down on y axis
lines(x-1, dt(x,100), lwd=3, col="grey25") #response
lines(x-.5, dt(x,1), lwd=3, col="red") #temp
lines(x-2.5, dt(x,1), lwd=3, col="blue") #flow
lines(x-1, dt(x,1), lwd=3, col="gold") #light


legend("topright", inset=.05, title="Distributions",
       labels, lwd=3, lty=c(1, 1, 1, 1, 2), col=colors)



#Light alteration####
plot(x,  type="l", lty=2, xlab="Spring                       Summer                            Fall",
     ylab="Intensity", main="Urban Light", xaxt='n', yaxt='n', ylim=c(0,.8), xlim= c(-4, 3))

lines(x-1, dt(x,1)+.03, lwd=3, col="grey25") #response
lines(x-.5, dt(x,1), lwd=3, col="red") #temp
lines(x-2.5, dt(x,1), lwd=3, col="blue") #flow
lines(x-1, dt(x,0.00001)+.32, lwd=3, col="gold") #light


legend("topright", inset=.05, title="Distributions",
       labels, lwd=3, lty=c(1, 1, 1, 1, 2), col=colors)


#Temperature####
plot(x,  type="l", lty=1, xlab="Spring                       Summer                            Fall",
     ylab="Intensity", main="Urabn Temperature", xaxt='n', yaxt='n', ylim=c(0,.8), xlim= c(-4, 3))
# for lines the x +/- shifts along x axis, 
# the dt(x, value) number changes amplitude,
# addting to the dt() before comma shifts up and down on y axis
lines(x-1, dt(x,0.4)+0.1, lwd=3, col="grey25") #response
lines(x-2, dt(x,2)+0.1, lwd=3, col="red") #temp
lines(x-2.5, dt(x,1), lwd=3, col="blue") #flow
lines(x-1, dt(x,1), lwd=3, col="gold") #light


legend("topright", inset=.05, title="Distributions",
       labels, lwd=3, lty=c(1, 1, 1, 1, 2), col=colors)


