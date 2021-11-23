//Proceso para revisar si la columna se repita
SubProceso RepiteColumna(A Por Referencia,Repite Por Referencia, nazar Por Referencia,col Por Referencia)
	Definir i,j,s Como Entero	
	para i=0 hasta 4 Hacer
		si A[i,col]=nazar
			Repite=Verdadero	
		FinSi
	FinPara
FinSubProceso

SubProceso salida(mensaje)
	Definir i Como Entero
	Escribir "                              ************************************************************************************"
	para i= 0 hasta 6 hacer
		Escribir "                              *                                                                                  *"
	FinPara
	Escribir "                                                          ",mensaje,"                                               "
	para i= 0 hasta 6 hacer
		Escribir "                              *                                                                                  *"
	FinPara	
	Escribir "                              ************************************************************************************"
FinSubProceso

//Muestra el bingo en pantalla
SubProceso MuetraBingo(A Por Referencia, nA, B Por Referencia, nB)
	Escribir Sin Saltar"  -------------------------------    "
	escribir "                       -------------------------------        "
	Escribir Sin Saltar"        Carton de ", na             
	Escribir  "                                                Carton de ", nb
	Escribir Sin saltar "   B      I      N      G     O           "
	Escribir "                    B      I      N      G     O           "           
	Definir i,j Como Entero
	para i=0 hasta 4 Hacer
		Para j=0 hasta 4 Hacer
			si(A[i,j]=0)
				Escribir Sin Saltar "  "," -","   "
			sino
				si  A[i,j] > 9
					Escribir Sin Saltar "  ", A[i,j],"   "
				SiNo
					Escribir Sin Saltar "  0", A[i,j],"   "
				FinSi
			FinSi
		FinPara
		Escribir Sin Saltar "                        "
		Para j=0 hasta 4 Hacer
			si(B[i,j]=0)
				Escribir Sin Saltar "  "," -","   "
			sino
				si  B[i,j] > 9
					Escribir Sin Saltar "  ", B[i,j],"   "
				SiNo
					Escribir Sin Saltar "  0", B[i,j],"   "
				FinSi
			FinSi
		FinPara
		Escribir " "
		//Escribir " "
	FinPara
FinSubProceso


//Precedimiento para crear un carton de bingo
SubProceso Creabingo(A Por Referencia, num)
	Definir i,j,agranda, NumAzar, coll Como Entero	
	Definir Repite Como Logico
	Repite=Falso
	NumAzar=0
	agranda=0
	para i=0 hasta 4 Hacer
		coll=i
		para j=0 hasta 4 Hacer
			NumAzar=azar(15)+1+agranda
			RepiteColumna(A,Repite,NumAzar,coll)
				si Repite =  Falso
					si (i=2)Y(j=2] Entonces
						A[i,j]=0	
					SiNo
						A[j,i]=NumAzar
					FinSi
				SiNo
					j=j-1
					Repite= Falso
				FinSi
		FinPara
		agranda=agranda+15
	FinPara
FinSubProceso

//Este procedimiento escoge como quiere jugar el usuario
Funcion TipoJuego <- EscogerTipodejuego()
	Definir  op Como Entero
	Limpiar Pantalla
	Escribir "                              ************************************************************************************"
	Escribir "                              *                                                                                  *"
	Escribir "                              *                  Seleccione como desea jugar bingo                               *"
	Escribir "                              *                                                                                  *"
	Escribir "                              *             1 Diagonal, Horizontal o Vertical                                    *"
	Escribir "                              *             2 Letra L                                                            *"
	Escribir "                              *             3 Letra U                                                            *"
	Escribir "                              *             4 Letra C                                                            *"
	Escribir "                              *             5 Cartón lleno                                                       *" 
	Escribir "                              *             6 Para salir                                                         *"
	Escribir "                              *                                                                                  *"
	Escribir "                              ************************************************************************************"
	leer op
	TipoJuego=op
FinFuncion

//LLena la matriz de bolitas de una a 75
SubProceso llenabD(bD Por Referencia)
	para i = 0 hasta 74 Hacer
		bD[i]=i+1
	FinPara
FinSubProceso

//Saca una bolita de  1 a 75
SubProceso cualBolita(mbolta Por Referencia,bolita Por Referencia)
	Definir bolitaAzar, x Como Entero
	Definir disponible Como Logico
	disponible=falso
	Mientras  disponible=falso Hacer
		bolitaAzar=azar(75)+1
		si mbolta[bolitaAzar-1]=bolitaAzar
			bolita=bolitaAzar
			mbolta[bolitaAzar-1]=0
			disponible=Verdadero
		FinSi	
	FinMientras
FinSubProceso

//Este prceso marca en el carton
SubProceso MarcarCarton(A Por Referencia, bolita)
	para i=0 hasta 4 Hacer
		para j=0 hasta 4 hacer
			si(A[i,j]=bolita)
				A[i,j]=0
			FinSi
		FinPara
	FinPara	
FinSubProceso

//cual carton es el que gana en U
SubProceso  cualCartonGanaU(a Por Referencia, gano Por Referencia,Nombregano Por Referencia, nombreganador,TJ)	
	definir correcto Como Logico
	correcto = Verdadero
	//  revisa si gana en L
	Si TJ = 2 Entonces
		correcto = Verdadero
		para i = 0 hasta 4 Hacer
			para j=0 hasta 4 Hacer
				si(A[j,0])<>0 O (A[4,j])<>0
					correcto= falso
				FinSi
			FinPara
		FinPara
	FinSi
	//Revisa si ganó en U
	Si TJ = 3 Entonces
		para i = 0 hasta 4 Hacer
			para j=0 hasta 4 Hacer
				si(A[j,0])<>0 O (A[4,j])<>0 O (A[j,4])<>0 
					correcto= falso
				FinSi
			FinPara
		FinPara
	FinSi
	//Resisa si gana en C
	Si TJ = 4 Entonces 
		para i = 0 hasta 4 Hacer
			para j=0 hasta 4 Hacer
				si(A[j,0])<>0 O (A[4,j])<>0 O (A[0,j])<>0 
					correcto= falso
				FinSi
			FinPara
		FinPara
	FinSi
	// Revisa si ganó cartón lleno
	Si TJ = 5 Entonces  
		correcto = Verdadero	
		para i = 0 hasta 4 Hacer
			para j=0 hasta 4 Hacer
				si(A[j,i])<>0
					correcto= falso
				FinSi
			FinPara
		FinPara
	FinSI
	//Ingresa si el uusario ganó
	Si correcto = verdadero Entonces
		gano=verdadero
		Nombregano=Nombregano+"      "+nombreganador
	FinSi 
FinSubProceso

//Reviza si gana en U
SubProceso 	GanarEnU(A Por Referencia,B Por Referencia,C Por Referencia,D Por Referencia,gano Por Referencia, Nombregano Por Referencia,n1,n2,n3,n4,TJ)
	Definir i,j Como Entero
	definir correcto Como Logico
	correcto = verdadero
	cualCartonGanaU(a, gano,Nombregano,n1,TJ)
	cualCartonGanaU(B, gano,Nombregano,n2,TJ)
	cualCartonGanaU(C, gano,Nombregano,n3,TJ)
	cualCartonGanaU(D, gano,Nombregano,n4,TJ)
FinSubProceso


//cual carton es el que gana en linea ya sea diagonal, horzontal o vertical
SubProceso  cualCartonGanaLLlinea(a Por Referencia, gano Por Referencia,Nombregano Por Referencia, nombreganador)	
	definir correctoF, correctoC, CorrectoDA, CorrectoDB Como Logico
	definir col, diagoB Como Entero
	col=0
	Mientras col<5 Hacer
		correctoF = Verdadero
		correctoC = Verdadero
		correctoDA = Verdadero
		correctoDB = Verdadero
		para i = 0 hasta 4 Hacer
			para j=0 hasta 4 Hacer
				si(A[col,i])<>0   //Revisa si gana por columna
					correctoF= falso
				FinSi
				si(A[i,col])<>0 //Revisa si gana por Fila
					correctoC= falso
				FinSi
				Si i=j Entonces //Revisa si gana Diagonal derecha
						correctoDA= falso
					FinSi
				//FinSi
				diagoB=4-j
				si(A[diagoB,j])<>0 //Revisa si gana diagonal izquiera
					correctoDB= falso
				FinSi
			FinPara
		FinPara
		col=col+1
		Si correctoF = verdadero O  correctoC = verdadero O  correctoDA = verdadero O correctoDB = verdadero Entonces
			col=5
		FinSi
	FinMientras
	Si correctoF = verdadero O  correctoC = verdadero O  correctoDA = verdadero O correctoDB = verdadero Entonces
		gano=verdadero
		Nombregano=Nombregano+"      "+nombreganador
	FinSi 
FinSubProceso

//Reviza si gana horizontal, diagonal o verticalmente.
SubProceso 	GanarEnLinea(A Por Referencia,B Por Referencia,C Por Referencia,D Por Referencia,gano Por Referencia, Nombregano Por Referencia,n1,n2,n3,n4)
	Definir i,j Como Entero
	definir correcto Como Logico
	correcto = verdadero
	cualCartonGanaLLlinea(a, gano,Nombregano,n1)
	cualCartonGanaLLlinea(B, gano,Nombregano,n2)
	cualCartonGanaLLlinea(C, gano,Nombregano,n3)
	cualCartonGanaLLlinea(D, gano,Nombregano,n4)
FinSubProceso

SubProceso MUetraTombola(Mbol]
	Definir i,j, cont Como Entero
	Escribir ""
	Escribir "      Bolitas en la tómbola"
	cont=0
	para i=0 hasta 4
		si cont= 0
			Escribir Sin Saltar "      B "
		FinSi
		si cont>0 Y cont <=15
			Escribir Sin Saltar "      I "
		FinSi
		si cont>15 Y cont <=30
			Escribir Sin Saltar "      N "
		FinSi
		si cont>30 Y cont <=45
			Escribir Sin Saltar "      G "
		FinSi
		si cont>45
			Escribir Sin Saltar "      O "
		FinSi
		para j=0 hasta 14 hacer
			Si (MBol[cont+j])<>0
				Escribir Sin Saltar "  ",MBol[cont+j], "  "
			FinSi
		FinPara
		cont=cont+15
		escribir ""
	FinPara
FinSubProceso

//Pbolita en carton y llama para mostrar cartones y llama par revizar si gana
SubProceso PonerBolita(A Por Referencia,bolita, MBol,gano Por Referencia,n1,B Por Referencia, n2,C Por Referencia,n3,D Por Referencia,n4, TipoJuego,mensaje,Nombregano Por Referencia)
	Definir i,j Como Entero
	Definir seguirJugando Como Caracter
	Limpiar Pantalla
	MuetraBingo(A, n1,B, n2)
	MuetraBingo(C, n3,D,n4)
	Escribir ""    
	Escribir mensaje
	Escribir "     *         Bolita   * ",bolita," *"
	MarcarCarton(A, bolita)
	MarcarCarton(B, bolita)
	MarcarCarton(C, bolita)
	MarcarCarton(D, bolita)
	MUetraTombola(Mbol]
	Si TipoJuego= 1
		GanarEnLinea(A,B,C,D,gano,Nombregano,n1,n2,n3,n4)
	FinSi
	Si TipoJuego= 2
		GanarEnU(A,B,C,D,gano,Nombregano,n1,n2,n3,n4,TipoJuego)
	FinSi
	Si TipoJuego= 3
		GanarEnU(A,B,C,D,gano,Nombregano,n1,n2,n3,n4,TipoJuego)
	FinSi
	Si TipoJuego= 4
		GanarEnU(A,B,C,D,gano,Nombregano,n1,n2,n3,n4,TipoJuego)
	FinSi
	Si TipoJuego= 5
		GanarEnU(A,B,C,D,gano,Nombregano,n1,n2,n3,n4,TipoJuego)
	FinSi
	Leer seguirJugando
FinSubProceso

//este procedimiento es para empezar a jugar
SubProceso JugarBingo(A Por Referencia,TipoJuego,n1, B Por Referencia,n2,C Por Referencia,n3,D Por Referencia, n4)
	Definir MBol Como Entero
	Definir gano Como Logico
	Definir mensaje, Nombregano, mensajeSalida Como Caracter
	Dimension MBol[75]
	llenabD(Mbol)
	gano=Falso
	Segun TipoJuego hacer
		1:mensaje = "Puede Ganar.Diagonal, Horizontal o Verticalmente"
		2:mensaje=  "Puede ganar con Letra L"
		3:mensaje= "Puede ganar con  Letra U"
		4:mensaje= "Puede ganar con  Letra C"
		5:mensaje= "Puede Ganar con carton lleno"
	FinSegun
		mientras gano=falso Hacer
			cualBolita(Mbol,bolita)
			PonerBolita(A,bolita,MBol,gano,n1,B,n2,C,n3,D,n4,TipoJuego,mensaje,Nombregano)
		FinMientras
		si gano=Verdadero
			Limpiar Pantalla 
			mensajeSalida= "Felicidades "+ Nombregano 
			salida(mensajeSalida)
		FinSi
FinSubProceso

//Nombre de los Jugadores
SubProceso NombreJugadores(jugador Por Referencia)
	Definir i Como Entero
	para i=0 hasta 3 Hacer
		Limpiar Pantalla
		Escribir ""
		Escribir ""
		Escribir ""
		Escribir "              ******************************************************************"
		Escribir "              *                                                                *"
		Escribir "              *                                                                *"
		Escribir "              *         Escriba el nombre del jugador ",i+1,"                        *"
		Leer jugador[i]
	FinPara
FinSubProceso

//Convierte la matriz en un vector de numeros ordenados
SubProceso CombierteEnVector(A Por Referencia,VA Por Referencia)
	Definir i,j,cont,aux Como Entero
	para i=0 hasta 4 Hacer
		para j=0 hasta 4 Hacer
			VA[cont]=A[i,j]
			cont=cont+1
		FinPara
	FinPara
	para i=0 hasta 24 Hacer
		para j=0 hasta 23 Hacer
		SI VA[j] > VA[j+1] Entonces
			aux=VA[j]
			VA[j]=VA[j+1]
			VA[j+1]=aux
		FinSi
		FinPara
	FinPara
FinSubProceso

// compara dos arreglos si si son iguales devuelve verdadero
SubProceso ComparaDosArreglos(VA Por Referencia,VB Por Referencia,igual Por Referencia)
	igual=Verdadero
	para i= 0 hasta 24 Hacer
		si VA[i]<>VB[i]
			igual=falso
		FinSi
	FinPara	
FinSubProceso

// Crea los cartones de bingo y llama a un proceso para rebizar si alguno esta repetido
SubProceso CreaRevizaBingo(A Por Referencia,j1,B Por Referencia,j2,C Por Referencia,j3,D Por Referencia,j4)
	Definir iguales Como Logico
	Definir VA,VB,VC,VD Como Entero
	Definir otravez Como Caracter
	Dimension VA[25],VB[25],VC[25],VD[25]
	iguales = Falso	
	Repetir
		Limpiar Pantalla
		Creabingo(A,j1)
		CombierteEnVector(A,VA)
		Creabingo(B,j2)
		CombierteEnVector(B,VB)		
		Creabingo(C,j3)	
		CombierteEnVector(C,VC)
		Creabingo(D,j4)
		CombierteEnVector(D,VD)	
		ComparaDosArreglos(VA,VB,iguales)
		Si iguales = Falso
			ComparaDosArreglos(VA,VC,iguales)	
		FinSi
		Si iguales = Falso
			ComparaDosArreglos(VA,VD,iguales)
		FinSi
		Si iguales = Falso
			ComparaDosArreglos(VB,VC,iguales)
		FinSi
		Si iguales = Falso
			ComparaDosArreglos(VB,VD,iguales)
		FinSi
		Si iguales = Falso
			ComparaDosArreglos(VC,VD,iguales)
		FinSi		
		Si iguales = Verdadero
			Escribir "Salieron dos Cartones iguales, Presiones una tecla para generarlos de nuevo "
			Leer otravez
		FinSi
	Hasta Que iguales = Falso
FinSubProceso

//Proceso Principal
Algoritmo Bingo
	//Variable
	Definir A,B,C,D,i,j,TipoJuego Como Entero
	Definir ju,mensajeSalida Como Caracter
	Dimension A[5,5],B[5,5],C[5,5],D[5,5],ju[4] //ju es el nombre del jugador
	TipoJuego=EscogerTipodejuego()
		si TipoJuego <= 5 entonces
			NombreJugadores(ju)
			CreaRevizaBingo(A,ju[0],B,ju[1],C,ju[2],D,ju[3])
			JugarBingo(A,TipoJuego,ju[0],B,ju[1],C,ju[2],D,ju[3])
		Sino	
			Limpiar Pantalla
			mensajeSalida= "Gracias por usar el Bingo, regrese pronto "
			salida(mensajeSalida)
		FinSi

FinAlgoritmo
