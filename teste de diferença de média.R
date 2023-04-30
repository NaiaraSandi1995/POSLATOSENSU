
#SCRIPT PARA TESTE DO TCC

BASE <- X_contratacoes_pcmv_pcva



summary(BASE$`VLR CVEA`)
options(scipen = 9999)

# Min.    1st Qu.     Median       Mean    3rd Qu.       Max.       NA's 
#      35000     201000     615000   12065281    2257625 6522040587     143526 

summary(BASE$`VLR MCMV`)

BASE$`VLR MCMV` <- as.numeric(BASE$`VLR MCMV`)
# Min.   1st Qu.    Median      Mean   3rd Qu.      Max.      NA's 
#  -3295200    141553    400000   2728787   1257800 578240000     97707

t.test(BASE$`VLR CVEA`,  BASE$`VLR MCMV`)

# Welch Two Sample t-test
# 
# data:  BASE$`VLR CVEA` and BASE$`VLR MCMV`
# t = -40.515, df = 113457, p-value < 0.00000000000000022
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   -52766881 -47897041
# sample estimates:
#   mean of x mean of y 
# 12065281  62397242 

ggplot(data = dados,
       mapping = aes(x = Posicao_Sala, y = Nota_Biol)) +
  geom_dotplot(binaxis = "y", stackdir = "center",
               fill="#D8D8D8", color="#D8D8D8", dotsize = 0.8) +
  geom_point(stat = "summary", fun = "mean", size = 2) +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.1) +
  ylab("Notas de biologia") +
  xlab("Posição na sala") +
  scale_y_continuous(limits=c(0,10), expand = c(0,0)) +
  theme_classic(base_size=12)

ggplot(data= BASE, 
       mapping =  aes(x= `VLR CVEA`, y= `VLR MCMV`))+
  geom_dotplot(binaxis = "y", stackdir = "center",
               fill="#D8D8D8", color="#D8D8D8", dotsize = 0.8) +
  geom_point(stat = "summary", fun = "mean", size = 2) +
  geom_errorbar(stat = "summary", fun.data = "mean_se", width = 0.1) +
  theme_classic(base_size=12)
