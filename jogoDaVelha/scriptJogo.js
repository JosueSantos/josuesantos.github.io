var jogo = []; // matriz de registro
var tabuleiro = []; // matriz de objetos
var mapa = [
	[1,2,3],
	[4,5,6],
	[7,8,9]
];

var jogando = true;
var jogadas = 0;
var quemComeca = 1;
var vitoria;

var msn = [
	"TU GANHOU PESTE!",
	"PERDEU ABESTADO!",
	"PERDEU MAXO!",
	"TU PERDEU!!<br/>ARMARIA NÃN!",
	"ARMARIA PERDEU!",
	"MINHA MÃE JOGA MELHOR QUE TU!",
	"SÓ SABE PERDER",
	"EGUA PERDEU!",
	"VAI APRENDER A JOGAR!",
	"ABESTADO!"
];

var quemJoga = 0; // 0 - jogador / 1 - cpu

var nivel = 2;

var jogadaCpu = 1;

function marcaTabuleiro( p ){
	if( jogando ){
		var marca = (quemJoga)? "O": "X";
		var col, row;
		
		if ( p%3 == 0)
			col = 2;
		else
			col = p%3 -1;
		
		if ( p/3 > 2)
			row = 2;
		else if ( p/3 > 1)
			row = 1;
		else
			row = 0;
		
		if ( jogo[row][col] == "" ){
			jogo[row][col] = marca;
			
			tabuleiro[row][col].innerHTML = marca;
			tabuleiro[row][col].style.cursor = "default";
			
			if ( verificaVitoria() ){
				document.getElementById("dvCabecalho").style.display = "none";
				document.getElementById("dvVitoria").style.display = "block";
				
				if(quemJoga){
					n = Math.round( Math.random() * ( msn.length - 1 ) );
					n = (n <= 0)? 1 : n;
					n = (n >= 10)? 9 : n;
					mensagem = msn[n];
				}else{
					mensagem = msn[ 0 ];
				}
				document.getElementById("mensagemFinal").innerHTML = mensagem;
				
				jogando = false;
			}else{
				jogadas += 1;
				if( jogadas >= 9 ){
					document.getElementById("dvCabecalho").style.display = "none";
					document.getElementById("dvVitoria").style.display = "block";
					
					document.getElementById("mensagemFinal").innerHTML = "DEU VÉA NESSE CARAMBA!";
					
					jogando = false;
				}
			}
			
			quemJoga = !quemJoga;
			return true;
		}else{
			return false;
		}
	}
}

function jogar( p ){
	if ( jogando ){
		if( quemJoga == 0){
			if ( marcaTabuleiro( p ) ){
				cpuJoga();
			}
		}
	}
}

function cpuJoga(){
	if ( jogando ){
		if( nivel == 1 ){ // Aleatorio
			do{
				posicao = Math.round( Math.random()*9);
			}while( !marcaTabuleiro( posicao ));
		}else if( nivel == 2){
			if( jogadaCpu == 0){
				do{
					posicao = Math.round( Math.random()*9);
					
				}while( !marcaTabuleiro( posicao ));
				
				jogadaCpu ++;
			}else{
				if( ( jogo[0][0] == jogo[1][1] ) && ( jogo[2][2] == "" ) && ( jogo[0][0] != "" ) ){
					if ( marcaTabuleiro( mapa[2][2] ) )
						return true;
				}else if( ( jogo[0][0] == jogo[2][2] ) && ( jogo[1][1] == "" ) && ( jogo[0][0] != "" ) ){
					if ( marcaTabuleiro( mapa[1][1] ) )
						return true;
				}else if( ( jogo[1][1] == jogo[2][2] ) && ( jogo[0][0] == "" ) && ( jogo[2][2] != "" ) ){
					if ( marcaTabuleiro( mapa[0][0] ) )
						return true;
				}else if( ( jogo[2][0] == jogo[1][1] ) && ( jogo[0][2] == "" ) && ( jogo[2][0] != "" ) ){
					if ( marcaTabuleiro( mapa[0][2] ) )
						return true;
				}else if( ( jogo[2][0] == jogo[0][2] ) && ( jogo[1][1] == "" ) && ( jogo[2][0] != "" ) ){
					if ( marcaTabuleiro( mapa[1][1] ) )
						return true;
				}else if( ( jogo[0][2] == jogo[1][1] ) && ( jogo[2][0] == "" ) && ( jogo[0][2] != "" ) ){
					if ( marcaTabuleiro( mapa[2][0] ) )
						return true;
				}else {
					for( var i = 0; i < 3; i++ ){
						if( ( jogo[i][0] == jogo[i][1] ) && ( jogo[i][2] == "" ) && ( jogo[i][0] != "" ) ){
							if ( marcaTabuleiro( mapa[i][2] ) )
								return true;
						}else if( ( jogo[i][0] == jogo[i][2] ) && ( jogo[i][1] == "" ) && ( jogo[i][0] != "" ) ){
							if ( marcaTabuleiro( mapa[i][1] ) )
								return true;
						}else if( ( jogo[i][1] == jogo[i][2] ) && ( jogo[i][0] == "" ) && ( jogo[i][1] != "" ) ){
							if ( marcaTabuleiro( mapa[i][0] ) )
								return true;
						}else if( ( jogo[0][i] == jogo[1][i] ) && ( jogo[2][i] == "" ) && ( jogo[0][i] != "" ) ){
							if ( marcaTabuleiro( mapa[2][i] ) )
								return true;
						}else if( ( jogo[0][i] == jogo[2][i] ) && ( jogo[1][i] == "" ) && ( jogo[0][i] != "" ) ){
							if ( marcaTabuleiro( mapa[1][i] ) )
								return true;
						}else if( ( jogo[1][i] == jogo[2][i] ) && ( jogo[0][i] == "" ) && ( jogo[1][i] != "" ) ){
							if ( marcaTabuleiro( mapa[0][i] ) )
								return true;
						}
					}
				}
				
				do{
					posicao = Math.round( Math.random()*9);
					
				}while( !marcaTabuleiro( posicao ));
			}
		}else if( nivel == 3){
			if( jogadaCpu == 0){
				if( jogadas == 0 ){
					marcaTabuleiro( 5 );
				}else{
					do{
						posicao = Math.round( Math.random()*9);
						
					}while( !marcaTabuleiro( posicao ));
				}
				jogadaCpu ++;
			}else{
			//ATAQUE
				if( ( jogo[0][0] == "O" ) && ( jogo[2][2] == "" ) && ( jogo[1][1] == "O" ) ){
					if ( marcaTabuleiro( mapa[2][2] ) )
						return true;
				}else if( ( jogo[0][0] == "O" ) && ( jogo[1][1] == "" ) && ( jogo[2][2] == "O" ) ){
					if ( marcaTabuleiro( mapa[1][1] ) )
						return true;
				}else if( ( jogo[1][1] == "O" ) && ( jogo[0][0] == "" ) && ( jogo[2][2] == "O" ) ){
					if ( marcaTabuleiro( mapa[0][0] ) )
						return true;
				}else if( ( jogo[2][0] == "O" ) && ( jogo[0][2] == "" ) && ( jogo[1][1] == "O" ) ){
					if ( marcaTabuleiro( mapa[0][2] ) )
						return true;
				}else if( ( jogo[2][0] == "O" ) && ( jogo[1][1] == "" ) && ( jogo[0][2] == "O" ) ){
					if ( marcaTabuleiro( mapa[1][1] ) )
						return true;
				}else if( ( jogo[0][2] == "O" ) && ( jogo[2][0] == "" ) && ( jogo[1][1] == "O" ) ){
					if ( marcaTabuleiro( mapa[2][0] ) )
						return true;
				}else {
					for( var i = 0; i < 3; i++ ){
						if( ( jogo[i][0] == "O" ) && ( jogo[i][2] == "" ) && ( jogo[i][1] == "O" ) ){
							if ( marcaTabuleiro( mapa[i][2] ) )
								return true;
						}else if( ( jogo[i][0] == "O" ) && ( jogo[i][1] == "" ) && ( jogo[i][2] == "O" ) ){
							if ( marcaTabuleiro( mapa[i][1] ) )
								return true;
						}else if( ( jogo[i][1] == "O" ) && ( jogo[i][0] == "" ) && ( jogo[i][2] == "O" ) ){
							if ( marcaTabuleiro( mapa[i][0] ) )
								return true;
						}else if( ( jogo[0][i] == "O" ) && ( jogo[2][i] == "" ) && ( jogo[1][i] == "O" ) ){
							if ( marcaTabuleiro( mapa[2][i] ) )
								return true;
						}else if( ( jogo[0][i] == "O" ) && ( jogo[1][i] == "" ) && ( jogo[2][i] == "O" ) ){
							if ( marcaTabuleiro( mapa[1][i] ) )
								return true;
						}else if( ( jogo[1][i] == "O" ) && ( jogo[0][i] == "" ) && ( jogo[2][i] == "O" ) ){
							if ( marcaTabuleiro( mapa[0][i] ) )
								return true;
						}
					}
				}
			//DEFESA
				if( ( jogo[0][0] == "X" ) && ( jogo[2][2] == "" ) && ( jogo[1][1] == "X" ) ){
					if ( marcaTabuleiro( mapa[2][2] ) )
						return true;
				}else if( ( jogo[0][0] == "X" ) && ( jogo[1][1] == "" ) && ( jogo[2][2] == "X" ) ){
					if ( marcaTabuleiro( mapa[1][1] ) )
						return true;
				}else if( ( jogo[1][1] == "X" ) && ( jogo[0][0] == "" ) && ( jogo[2][2] == "X" ) ){
					if ( marcaTabuleiro( mapa[0][0] ) )
						return true;
				}else if( ( jogo[2][0] == "X" ) && ( jogo[0][2] == "" ) && ( jogo[1][1] == "X" ) ){
					if ( marcaTabuleiro( mapa[0][2] ) )
						return true;
				}else if( ( jogo[2][0] == "X" ) && ( jogo[1][1] == "" ) && ( jogo[0][2] == "X" ) ){
					if ( marcaTabuleiro( mapa[1][1] ) )
						return true;
				}else if( ( jogo[0][2] == "X" ) && ( jogo[2][0] == "" ) && ( jogo[1][1] == "X" ) ){
					if ( marcaTabuleiro( mapa[2][0] ) )
						return true;
				}else {
					for( var i = 0; i < 3; i++ ){
						if( ( jogo[i][0] == "X" ) && ( jogo[i][2] == "" ) && ( jogo[i][1] == "X" ) ){
							if ( marcaTabuleiro( mapa[i][2] ) )
								return true;
						}else if( ( jogo[i][0] == "X" ) && ( jogo[i][1] == "" ) && ( jogo[i][2] == "X" ) ){
							if ( marcaTabuleiro( mapa[i][1] ) )
								return true;
						}else if( ( jogo[i][1] == "X" ) && ( jogo[i][0] == "" ) && ( jogo[i][2] == "X" ) ){
							if ( marcaTabuleiro( mapa[i][0] ) )
								return true;
						}else if( ( jogo[0][i] == "X" ) && ( jogo[2][i] == "" ) && ( jogo[1][i] == "X" ) ){
							if ( marcaTabuleiro( mapa[2][i] ) )
								return true;
						}else if( ( jogo[0][i] == "X" ) && ( jogo[1][i] == "" ) && ( jogo[2][i] == "X" ) ){
							if ( marcaTabuleiro( mapa[1][i] ) )
								return true;
						}else if( ( jogo[1][i] == "X" ) && ( jogo[0][i] == "" ) && ( jogo[2][i] == "X" ) ){
							if ( marcaTabuleiro( mapa[0][i] ) )
								return true;
						}
					}
				}
				
				do{
					posicao = Math.round( Math.random()*9);
					
				}while( !marcaTabuleiro( posicao ));
			}
		}
	}
}

function verificaVitoria(){
	if( ( jogo[0][0] == jogo[1][1] ) && ( jogo[0][0] == jogo[2][2] ) && ( jogo[0][0] != "" ) ){
		vitoria = jogo[0][0];
		return true;
	}
	
	if( ( jogo[2][0] == jogo[1][1] ) && ( jogo[2][0] == jogo[0][2] ) && ( jogo[2][0] != "" ) ){
		vitoria = jogo[2][0];
		return true;
	}
	
	for( var i = 0; i < 3; i++ ){
		if( ( jogo[i][0] == jogo[i][1] ) && ( jogo[i][0] == jogo[i][2] ) && ( jogo[i][0] != "" ) ){
			vitoria = jogo[i][0];
			return true;
		}
		
		if( ( jogo[0][i] == jogo[1][i] ) && ( jogo[0][i] == jogo[2][i] ) && ( jogo[0][i] != "" ) ){
			vitoria = jogo[0][i];
			return true;
		}
	}
	
	return false;
}

function zerarTabuleiro(){
	for( var row = 0; row < 3; row++ ){
		for( var col = 0; col < 3; col++ ){
			tabuleiro[row][col].innerHTML = "";
			tabuleiro[row][col].style.cursor = "pointer";
		}
	}
}

function inicia(n){
	nivel = n;
	
	jogando = true;
	jogadas = 0;
	jogadaCpu = 0;
	quemComeca = !quemComeca;
	quemJoga = quemComeca;
	
	jogo = [
		["","",""],
		["","",""],
		["","",""]
	];
	
	tabuleiro = [
		[ document.getElementById("p1"), document.getElementById("p2"), document.getElementById("p3") ],
		[ document.getElementById("p4"), document.getElementById("p5"), document.getElementById("p6") ],
		[ document.getElementById("p7"), document.getElementById("p8"), document.getElementById("p9") ]
	];
	
	zerarTabuleiro();
	
	if( quemComeca ){
		document.getElementById("dvQuemComeca").innerHTML = "ROBO";
		cpuJoga();
	}else{
		document.getElementById("dvQuemComeca").innerHTML = "É TU MERMO";
	}
	
	switch(nivel){
		case 1:
			document.getElementById("dvNivel").innerHTML = "FÁCIM";
			break;
		case 2:
			document.getElementById("dvNivel").innerHTML = "MARROMENO";
			break;
		case 3:
			document.getElementById("dvNivel").innerHTML = "PESTE";
			break;
	}
	
	document.getElementById("telaInicial").style.display = "none";
	document.getElementById("telaJogo").style.display = "flex";
	
	document.getElementById("dvCabecalho").style.display = "block";
	document.getElementById("dvVitoria").style.display = "none";
}

function fimDeJogo(){
	document.getElementById("telaInicial").style.display = "flex";
	document.getElementById("telaJogo").style.display = "none";
}