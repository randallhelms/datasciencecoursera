#example from Rosner, fundamentals of biostatistics


  #Comparing SBP for 8 oral contraceptive users versus 21 controls
  #$\bar X_{OC} = 132.86$ mmHg with $s_{OC} = 15.34$ mmHg
  #$\bar X_{C} = 127.44$ mmHg with $s_{C} = 18.23$ mmHg
  #Pooled variance estimate

#pooled standard deviation

sp <- sqrt((7 * 15.34^2 + 20 * 18.23^2) / (8 + 21 - 2))

#t-interval formula

132.86 - 127.44 + c(-1, 1) * qt(.975, 27) * sp * (1 / 8 + 1 / 21)^.5

#pooled variance estimate

pve = (7 * 15.34^2 + 20 * 18.23^2) / (8 + 21 - 2)

#sum of sample sizes

sss = (8 + 21 - 2)

#group calculations: df - 1 * st_dev ^ 2

barX = 7 * 15.34^2 

barY = 20 * 18.23^2

#interval calculation

132.86 - 127.44 #difference of the means

qt(.975, 27) #relevant t-quantile, plus degrees of freedom

sp #pooled standard deviation

(1 / 8 + 1 / 21)^.5 #1/n1 + 1/n2 raised to the one-half power