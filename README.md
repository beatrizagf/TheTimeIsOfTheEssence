# TimeIsOfTheEssence
Primeira abordagem: nivel incompleto com todas as mecanicas do jogo

TODO

  	-se atacada fica mais stunned em vez de se ver um drop no tempo
  	-tirar as escadas
  	-6 botões: seta esquerda/a, seta direita/d, seta baixo/s, seta cima(salto)/spacebar?, botão para trocar de arma, tecla para disparar
  	-3 armas: espada(dano perto), arco(dano longe), escudo(reflectir)
  	-"técnicas": salto, doublejump, dash /ponderar passar o reflect do escudo para skill em vez de weapon para ser usada de forma mais activa e conjunta com um contra-ataque sem ter que estar sempre a trocar entre shield e weapon?	
  	-pequena aceleração quando começa a andar, esta passagem é muito rápida(velocidade depois da aceleração é menor nos primeiros niveis)	
  	-quando o tempo começa a acabar aparece sombre do dragão. Se for muito dificil ela fica parada a descansar quando o tempo chega ao zero até o dragao aparecer ----- para já basta mostrar que ela morre quando o tempo termina
	
	-max time é 10? (power ups metem sempre o tempo a 10) ----só no hardmode
	-ou passa do 10? (power ups dao random value entre 5 e 10 segundos extra para exemplificar?) ----easymode
  	isto depende se queremos que se apanhe power ups com mais frequencia e focar menos na luta ou menos frequencia e focar mais na luta. 
  
 Mais tarde:
 
 3 niveis

	 Base - masmorras / torre
	 Intermédio - ?
	 Avançado - no exterior

	 

-Colisões (basically fazer algo melhor que aquele demo para termos uma boa base)
- Plataformas - Só tem colisão por cima
- Tiles a toa de chao - de preferencia mudar isto para algo nosso
- Fazer a camara seguir o jogador smooth
- Double jump
- O salto depende do tempo que premimos o botao de saltar
- Usar comandos de ps/xbox
- Corações aumentar vida/pickup
- Healthbar em cima da princesa a basicamente a mesma coisa que esta la em cima no canto esquerdo
- Inimigos que se mexem simplesmente sempre na mesma direçao, com as mesmas leis de fisica que o jogador. Quando tocam numa parede trocam a direçao
- Quando inimigos tocam no jogador este perde vida consoante o tipo de inimigo. O jogador ganha tambem x tempo de imunidade e fica parado y tempo (a definir)
-Ela de momento salta 4 quadrados 32*32 é o max e esta ali mesmo no ponto. Pode se mudar mas convem ter uma medida fixa aka x vezes um objeto parede
-Ataque
- WASD + left mouse click (attacar). Facil de mudar no create no oPlayer