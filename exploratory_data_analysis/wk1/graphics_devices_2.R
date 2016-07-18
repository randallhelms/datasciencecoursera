#main vector formats

  #pdf
  #svg
  #win.metafile
  #postscript

#main bitmap formats

  #png
  #jpeg
  #tiff
  #bmp

#open multiple graphics devices at once:

  #plotting only on one device at a time

dev.cur() #see currently active graphics device

#copy plots between devices

library(datasets)

with(faithful, plot(eruptions, waiting))

title(main = "Old Faithful Geyser data")

dev.copy(png, file = "geyserplot.png")

dev.off()