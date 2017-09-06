library(rCharts)
require(reshape2)
require(PerformanceAnalytics)
# 複数の図の配置 cf. http://d.hatena.ne.jp/dichika/20110116/1295183973
library(grid) 
library(gridBase) 


par(oma = c(0, 0, 4, 0))
x <- read.csv("20170905_2229.txt",header=F,as.is=T)
LT=as.numeric(as.POSIXct(x$V1))*1000
HHH<-(x$V2-2^15)/2^15*10.24/10*600 + 0.5
DDD<-(x$V2-2^15)/2^15*10.24/10*600 + 0.25
ZZZ<-(x$V2-2^15)/2^15*10.24/10*600

d <- data.frame(x=LT,y1=HHH,y2=DDD,y3=ZZZ)
p <- mPlot(x="x", y=c("y1","y2","y3"), data = d,type ="Line", smooth = FALSE,labels = c("H[nT]","D[nT]","Z[nT]"),pointSize = 0, lineWidth = 2 ,layout = c(1, 3))
# グリッドと軸
p$set(grid = TRUE, axes = TRUE)
# 線の色
p$set(lineColors = list("orchid","deepskyblue","seagreen"))
p$show("inline", include_assets = FALSE)

p$set(width = 800, height = 600)
p$save("outp01.html", cdn = TRUE)
browseURL("http://localhost/~sato/outp01.html")

m <- Leaflet$new()
# 中心の指定
m$setView(c(-36.9, 174.76), 7)
# マーカーを追加
m$marker(c(-36.9, 174.76), bindPopup = "X01")
# 地図のサイズを指定
m$save("outp02.html", cdn=TRUE)
browseURL("http://localhost/~sato/outp02.html")

#bec<-c(LT, HHH)
#filename = paste("AidAllGraph_01.pdf", sep = "")
#pdf(filename,width=10,height=4.25)
#grid.newpage() #作図領域を新規作成する
#l <- grid.layout(1,2)
#レイアウトを表示する
#grid.show.layout(l)
#v <- viewport(layout = l) # [l]を作図領域として[v]に格納する
#pushViewport(v) #グラフを埋め込む前に，pushViewport()関数に作図領域を指定する。

#pushViewport(viewport(layout=grid.layout(1, 2))) #画面を区切る（今回は1行2列の2分割）
#print(p, vp=viewport(layout.pos.row=1, layout.pos.col=1)) #1行目の1列
#print(m, vp=viewport(layout.pos.row=1, layout.pos.col=2)) #1行目の2列
3popViewport()  #作図を終了する

dev.off()
