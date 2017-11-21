# TimeIsOfTheEssence
Segunda abordagem: nivel intermédio


TODO ESSENCIAL
	
	Limar o nível (intermédio)
	Munição limitada com imagem a dizer quanta munição resta -no mesmo sitio da estrela- (mais tarde pensar como passar esta info)
	Mudar o coração e estrela que estão em cima para baixo (?)
	Monstros servem para completar o nível a 100% (só aparece no fim do nivel tipo 10/10 monstros derrotados)
		->Monstros dropam flecha (testar)
	Sprites para as armas (NÃO as animações da arma (rosa e preto), só elas paradas)
	Sprites dodge -imagem com cooldown em baixo- (mais tarde mudar cor dos sapatos(?)); aumentar o cooldown

	
 
 EXTRAS
 	
	Sombra/Escuridão quando a vida tiver a chegar ao fim, em vez de vermos com uma barra de vida
		IDEAL: brilho no coração e na princesa, resto preto sem ser totalmente preto (para nao se deixar de ver a 100%)
			Se dificil: - glow demoniaco em redor da princesa (sprite "transparente" que segue o jogador)
				    - gota de suor (sprite "transparente" que segue o jogador)
	
	Sprite para mostrar inimigo parado (inicialmente mudar cor; mais tarde inimigo fica com estrelas na cabeça)
	Mudar o sprite coração para [....]
	Animação trocar de sala/nivel (com parede a descer para bloquear o caminho de volta)
	Animação pickups (coração e estrela) a rodar sobre si (tipo o bounce da demo)
 
 
 
 
 
 
 MAIS TARDE:
 
 
 escudo(reflectir) -> escudo para mecanica de boss (mostrar feito ou so falar no relatorio )
 Sprites para andar
 Sons
 
 3 niveis

	 Base - masmorras / torre
	 Intermédio - ?
	 Avançado - no exterior









JA FEITO
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
