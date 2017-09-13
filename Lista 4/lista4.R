#custo total = somatorio custos + prob * custo contigencia
# prob = bernoulli(uniform(0.35, 0.40))
library(triangle)

cenarios <- 3000
#distancia em km
distancia <- 260

#distancia em km
distancia_contorno <- 290

#tamanho do tubo em m
tubo <- 8

prob_contorno_fixa <- seq(0.35, 0.40, by=0.01)
prob_contorno_fixa
prob_contorno <- runif(cenarios, 0.35, 0.40)
#ev <- rbinom(cenarios, 1, prob_contorno)
ev <- sapply(prob_contorno_fixa, rbinom, n=cenarios, size=1)
ev

#comprimento total do gasoduto
comprimento_total <- distancia + ev*(distancia_contorno - distancia)
comprimento_total

#colors <- colorRampPalette(c("blue", "green"))(ncol(comprimento_total))
colors <- palette(rainbow(6))

tempo_soldagem <- function(tam_tubo, total, n_cenarios){
  juncoes <- ceiling(total/tam_tubo)-1
  tempo <- juncoes * rtriangle(n_cenarios, 4, 5, 4.5)
  tempo
}

custo_soldagem <- function(custo_hora, tam_tubo, total, n_cenarios){
  tempo_solda <- tempo_soldagem(tam_tubo, total, n_cenarios)
  custo <- custo_hora * tempo_solda
  custo
}

custo_tubulacao <- function(tam_tubo, total, n_cenarios){
  tubos <- ceiling(total/tam_tubo)
  custo <- tubos * rtriangle(n_cenarios, 725, 790, 740)
  custo
}

custo_vala <- function(custo_hora, tam_vala, total, n_cenarios){
  valas <- ceiling(total/tam_vala)
  tempo_vala <- valas * rtriangle(n_cenarios, 12, 25, 16)
  custo <- custo_hora * tempo_vala
  custo
}

custo_trans_tub <- function(tam_tubo, total, n_cenarios){
  tubos <- ceiling(total/tam_tubo)
  custo <- tubos * rtriangle(n_cenarios, 6.1, 7.4, 6.6)
  custo
}

custo_acab <- function(total, n_cenarios){
  custo <- total * rtriangle(n_cenarios, 14000, 17000, 15000)
  custo
}

custo_filt <- function(n_exp, n_cenarios){
  n_c <- rep(n_cenarios, n_exp)
  custo <- sapply(n_c, rtriangle, a=165000, b=188000, c=173000)
  custo
}

calcula_custo <- function(tubo, distancia, cenarios){
  custo_trabalho <- rtriangle(cenarios, 17, 23, 18.5)
  
  tubulacao <- custo_tubulacao(tubo, distancia*1000, cenarios)
  vala <- custo_vala(custo_trabalho, tubo, distancia*1000, cenarios)
  transporte <- custo_trans_tub(tubo, distancia*1000, cenarios)
  soldagem <- custo_soldagem(custo_trabalho, tubo, distancia*1000, cenarios)
  custo_filtragem <- custo_filt(ncol(distancia), cenarios)
  acabamento <- custo_acab(distancia, cenarios)
  
  list(tubulacao=tubulacao, vala=vala, transporte=transporte, soldagem=soldagem, custo_filtragem=custo_filtragem, acabamento=acabamento)
}

custos <- calcula_custo(tubo, comprimento_total, cenarios)
tubulacao <- custos$tubulacao 
vala <- custos$vala
transporte <- custos$transporte
soldagem <- custos$soldagem
custo_filtragem <- custos$custo_filtragem
acabamento <- custos$acabamento

matriz_custo_total <- list()
for(i in 1:ncol(comprimento_total)){
  matriz_custo <- cbind(tubulacao=tubulacao[,i], vala=vala[,i], transporte=transporte[,i], soldagem=soldagem[,i],
                        custo_filtragem=custo_filtragem[,i], acabamento=acabamento[,i])
  custo_total <- rowSums(matriz_custo)
  matriz_custo_total[[i]] <- cbind(matriz_custo, custo_total)
}

plot(ecdf(matriz_custo_total[[1]][,7]), col=colors[1])
for(i in 2:ncol(comprimento_total))
  plot(ecdf(matriz_custo_total[[i]][,7]), add=T, col=colors[i])
legend("bottomright", legend=c("0.35", "0.36", "0.37", "0.38", "0.39", "0.40"), col=colors, lty=1:2, cex=1.2)
