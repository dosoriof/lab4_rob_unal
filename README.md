# Laboratorio 5 - Robótica Industrial IRB140 
- Rafael Ricardo Galindo
- Diego Fabian Osorio Fonseca
- Cristian Cuestas

![Vista superior](/imagenes/Vista_sup.jpeg)

## Herramienta

### Diseño

Para el proceso de fabricación de la herramiento de planteó realizarlo en un modelo CAD y posteriormente realizar la respectiva impresión 3D. El modelo CAD se muestra a continuación:

![CAD herramienta](/imagenes/Porta_marcador.PNG)

Se compone de una base con agujeros M6 (según el manual) para atornillarla a la superficie de anclaje del Robot y además un cilindro hueco para introducir el marcador, con unas cartelas para darle más soporte. El plano con los detalles de las medidas se presenta aquí, y el PDF está en la carpeta:

![plano herramienta](/imagenes/Herramienta_plano.bmp)

Para permitir un juego en el marcador que hace que exista menos ...... en el momento de realizar los trazos, se dejo un espacio libre en el cilindro y allí se introdujo un resorte, que permite una retracción en el marcador cuando se realiza el contacto con la superficie:

![herramienta](/imagenes/Herramienta_foto.jpeg)

### Calibración de herramienta en RobotStudio y en IRB140.  
#### Calibración de herramienta en RobotStudio.  
En el modelo de RobotStudio se realiza la importación de la geometría STL de la herramienta, como se muestra en la siguiente imagen:  

![Importar herramienta RobotSutio](/imagenes/Imp_Tool.jpg)   

Teniendo importada la herramienta esta nos aparece posicionada en el origen de la base, en este caso se arrastra en la pestaña de diseño sobre el robot y de esta forma ella se vincula al sistema de coordenadas de la herramienta, sin embargo, la escala no es la correcta, para solucionarlo se siguen los siguientes pasos:

![Escalar herramienta](/imagenes/Tool_Scale.jpg)    

Se realiza un proceso similar para ajustar la orientación de la herramienta de forma que quede posicionada correctamente.  
Luego de tener configurada la herramienta se procede a realizar la configuración del sistema de coordenadas de herramienta, para ello se realiza el siguiente proceso:  
Primero se debe crear el dato de la herramienta asi:  

![Creación del Data Tool.](/imagenes/Tool_Create.jpg)   

Luego se configura la posición y orientación del sistema de coordenadas de efector final, así:  
![Configuración TCP de la herramienta.](/imagenes/Tool_Config.jpg)   
En este caso de acurdo a la geometría del portaherramientas y la longitud que sobresale del marcador desde la punta se sabe que la herramienta presenta un desfase de 150 mm desde la base de anclaje, se usa este valor para realizar la configuración y se verifica la posición de dicho TCP.  
#### Calibración de herramienta en IRB140 y IRC5.  
Inicialmente se entra a la ventana de Program Data, se selecciona en la pantalla principal tooldata, como se muestra a continuación:  
![Creación del Data Tool.](/imagenes/ToolData.jpg)   
Luego se da en New, así:  
![Creación del Data Tool.](/imagenes/NewTool.jpg)   
Luego se le asigna un nombre a la herramienta, y se crea, asi:   
![Creación del Data Tool.](/imagenes/NameTool.jpg)   
Luego se selecciona la herramienta recién creada y se inicia el proceso de definición de su configuración, así:  
![Creación del Data Tool.](/imagenes/DefineTool.jpg)   
En este caso se realiza la definición de la herramienta con 4 puntos en diferentes orientaciones y un punto vertical, para ello se selecciona TPC & Z, así:  
![Creación del Data Tool.](/imagenes/TCPZ.jpg)   
Luego se hace Jogging con el robot hasta las orientaciones y posiciones indicadas en las que la punta de la herramienta alcance la misma posición absoluta, de esta forma el programa puede calcular los desplazamientos relativos que tiene el TCP de la herramienta y adicionalmente calcula con que error esta dado ese punto, de acuerdo a la precisión obtenida en el posicionamiento del robot, esto se hace como se muestra a continuación:   
![Creación del Data Tool.](/imagenes/ModifyTool.jpg)   


## Trayectorias
### Diseño Trayectoria. 
Para genera la trayectoria se realizó un dibujo en AutoCAD de forma que nos permitirá visualizar la trayectoria deseada y extraer los putos de los vértices y los centros de los arcos, como se muestra a continuación:
![Creación del Data Tool.](/imagenes/RDS_Drawing.jpg)   
Dicha trayectoria tiene unidades de milímetros y se toman los datos de vértices y centros de arcos, se tomó como origen la esquina de la R y se realizan los trazos en el cuadrante I, x+ , y+; esto se debe tener en cuenta en cómo se realiza el posicionamiento y orientación del sistema de coordenadas del workObject. Adicionalmente en el eje Z todas las coordenadas se manejan en el plano Z=0, excepto en el caso que haya que levantar la herramienta, en este caso se trabaja en plano z=50…
### Definición de los Work Objects.
Como se menciono anteriormente las trayectorias están definidas respecto a su propio sistema de coordenadas, esto se realiza para reutilizar dichas coordendas para los dos casos que se deben realizar, el caso del dibujo en plano y el caso del dibujo en plano inclinado; esto nos obliga realizar la definion de un sistema de coordenamas base para cada trayectoria, esto se conoce como workObject, este se define de acuerdo al sistema de coordenadas de la base.  
Para el primer caso de la trayectoria plana se define el sistema de coordenadas del workObject con solo el origen del plano y las rotaciones indicadas para que la orientación del recorrido sea la deseada, en este caso se rota el eje Z -90°, para obtener las coordenadas del origen se hace Jogging con el robot en coordenadas de base, hasta que la herramienta entre en contacto con la superficie en el punto deseado, en este caso [400, 550, 4].
Para el caso de la trayectoria inclinada se hace uso de una herramienta de definición de sistemas de coordenadas de RobotStudio en la cual se puede definir un sistema de coordenadas con un punto base, un punto sobre el eje x y un punto en el plano xy, como se muestra a continuación:  
![Creación del Data Tool.](/imagenes/WOb_Create.jpg)   
Para realizar la obtención de dichos puntos se realiza Joggin del robot hasta las posiciones deseadas y se pone en contacto la herramienta con la superficie, se toman dichos valores y el programa realiza el cálculo de desplazamiento y rotaciones necesarias para definir dicho sistema de coordenadas y usarlo como el workObject de referencia para la segunda trayectoria, como se muestra a continuación:  
![Creación del Data Tool.](/imagenes/WOb_Define.jpg)   
En el caso de nuestro ejercicio las coordenadas de los puntos de referencia son las siguientes:
P1=[525, -440, 148]; P2=[390, -520, 148]; P3=[503, -595, 207]  
Estas coordenadas nos dan un sistema de referencia con las siguientes características:  
O= [440,-490,148]  
Rx, Ry, Rz=[25.78, 0, -149.35] RPY Euler ZYX Deg.  
Teniendo Creados y definidos los dos sistemas de coordenadas de los workObjects necesarios se procede a programar las trayectorias.



## Resultados

El video con la simulación en Robotstudio y la implementación de la práctica con el robot real se encuentra en el siguiente Link:  **[Video Laboratorio 4](https://youtu.be/RAd8DfRgSsY)**


### Código en RAPID
#### Código para trayectoria en plano.  
```rapid
MODULE Module_RDS
    CONST robtarget home_RDS:=[[636.195461814,0,604.5],[0.5,0,0.866025404,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_1:=[[0,0,50],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_2:=[[0,0,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_3:=[[0,94,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_4:=[[25.5,94,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_5:=[[48,71.5,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_6:=[[25,49,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_7:=[[0,49,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_8:=[[34.5,43,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_9:=[[40.5,33.5,0],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_10:=[[53,0,0],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_11:=[[53,0,0],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget D_1:=[[67.6,0,50],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget D_2:=[[67.6,0,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget D_3:=[[67.6,94,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget D_4:=[[97.5,94,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget D_5:=[[130,47,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget D_6:=[[97.5,0,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_12:=[[53,0,50],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_1:=[[150,6,50],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_2:=[[150,6,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_3:=[[169,0,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_4:=[[193,14,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_5:=[[184,40,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_6:=[[160,55,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_7:=[[152,81,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_8:=[[176,94.5,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_9:=[[194.5,89,0],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_10:=[[194.5,89,50],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_1_2:=[[0,0,50],[0,0,1,0],[-1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_2_2:=[[0,0,0],[0,0,1,0],[-1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_3_2:=[[0,94,0],[0,0,1,0],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_4_2:=[[25.5,94,0],[0,0,1,0],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_5_2:=[[48,71.5,0],[0,0,1,0],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_6_2:=[[25,49,0],[0,0,1,0],[-1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_7_2:=[[0,49,0],[0,0,1,0],[-1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_8_2:=[[34.5,43,0],[0,0,1,0],[-1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_9_2:=[[40.5,33.5,0],[0,0,1,0],[-1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_10_2:=[[53,0,0],[0,0,1,0],[-1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_11_2:=[[53,0,0],[0,0,1,0],[-1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_12_2:=[[53,0,50],[0,0,1,0],[-1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget D_1_2:=[[67.6,0,50],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget D_2_2:=[[67.6,0,0],[0,0,1,0],[-1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget D_3_2:=[[67.6,94,0],[0,0,1,0],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget D_4_2:=[[97.5,94,0],[0,0,1,0],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget D_5_2:=[[130,47,0],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget D_6_2:=[[97.5,0,0],[0,0,1,0],[-1,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_1_2:=[[150,6,50],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_2_2:=[[150,6,0],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_3_2:=[[169,0,0],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_4_2:=[[193,14,0],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_5_2:=[[184,40,0],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_6_2:=[[160,55,0],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_7_2:=[[152,81,0],[0,0,1,0],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_8_2:=[[176,94.5,0],[0,0,1,0],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_9_2:=[[194.5,89,0],[0,0,1,0],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_10_2:=[[194.5,89,50],[0,0,1,0],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS tooldata TCP_Porta_marcador:=[TRUE,[[0,0,150],[1,0,0,0]],[1,[0,0,1],[1,0,0,0],0,0,0]];
    TASK PERS wobjdata Workobject_1:=[FALSE,TRUE,"",[[0,0,0],[1,0,0,0]],[[400,550,14],[0.707106781,0,0,-0.707106781]]];
    
!***********************************************************

    PROC main()
        !Añada aquí su código
        MoveJ home_RDS,v200,fine,TCP_Porta_marcador\WObj:=wobj0;
        R;
        D;
        S;
        MoveJ home_RDS,v200,fine,TCP_Porta_marcador\WObj:=wobj0;
    ENDPROC
    PROC R()
        MoveJ R_1,v200,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL R_2,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL R_3,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL R_4,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveC R_5,R_6,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL R_7,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL R_6,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveC R_8,R_9,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL R_10,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL R_11,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL R_12,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
    ENDPROC
    PROC D()
        MoveL D_1,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL D_2,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL D_3,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL D_4,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveC D_5,D_6,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL D_2,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL D_1,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
    ENDPROC
    PROC S()
        MoveL S_1,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL S_2,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL S_3,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveC S_4,S_5,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL S_6,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveC S_7,S_8,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL S_9,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL S_10,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
    ENDPROC
ENDMODULE
```

#### Código para trayectoria en plano inclinado.  
```rapid
MODULE Module_RDS_in
    CONST robtarget home_RDS:=[[636.195461814,0,604.5],[0.5,0,0.866025404,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_1:=[[0,0,50],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_2:=[[0,0,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_3:=[[0,94,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_4:=[[25.5,94,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_5:=[[48,71.5,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_6:=[[25,49,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_7:=[[0,49,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_8:=[[34.5,43,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_9:=[[40.5,33.5,0],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_10:=[[53,0,0],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_11:=[[53,0,0],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget D_1:=[[67.6,0,50],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget D_2:=[[67.6,0,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget D_3:=[[67.6,94,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget D_4:=[[97.5,94,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget D_5:=[[130,47,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget D_6:=[[97.5,0,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget R_12:=[[53,0,50],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_1:=[[150,6,50],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_2:=[[150,6,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_3:=[[169,0,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_4:=[[193,14,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_5:=[[184,40,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_6:=[[160,55,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_7:=[[152,81,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_8:=[[176,94.5,0],[0,0,1,0],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_9:=[[194.5,89,0],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget S_10:=[[194.5,89,50],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS tooldata TCP_Porta_marcador:=[TRUE,[[0,0,150],[1,0,0,0]],[1,[0,0,1],[1,0,0,0],0,0,0]];
    TASK PERS wobjdata Workobject_1:=[FALSE,TRUE,"",[[440,-490,148],[0.257633724,0.058958677,-0.215147749,-0.940138386]],[[0,0,0],[1,0,0,0]]];
    TASK PERS tooldata tool1:=[TRUE,[[0,0,0],[1,0,0,0]],[-1,[0,0,0],[1,0,0,0],0,0,0]];
    
!***********************************************************

    PROC main()
        !Añada aquí su código
        MoveJ home_RDS,v200,fine,TCP_Porta_marcador\WObj:=wobj0;
        R;
        D;
        S;
        MoveJ home_RDS,v200,fine,TCP_Porta_marcador\WObj:=wobj0;
    ENDPROC
    PROC R()
        MoveJ R_1,v200,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL R_2,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL R_3,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL R_4,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveC R_5,R_6,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL R_7,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL R_6,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveC R_8,R_9,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL R_10,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL R_11,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL R_12,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
    ENDPROC
    PROC D()
        MoveL D_1,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL D_2,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL D_3,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL D_4,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveC D_5,D_6,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL D_2,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL D_1,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
    ENDPROC
    PROC S()
        MoveL S_1,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL S_2,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL S_3,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveC S_4,S_5,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL S_6,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveC S_7,S_8,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL S_9,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
        MoveL S_10,v100,fine,TCP_Porta_marcador\WObj:=Workobject_1;
    ENDPROC
ENDMODULE

```
```javascript I'm tab B
console.log('Code Tab B');
```
## Conclusiones

