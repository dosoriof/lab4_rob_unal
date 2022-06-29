# Laboratorio 5 - Robótica Industrial IRB140 
- Rafael Ricardo Galindo
- Diego Fabian Osorio Fonseca

## Herramienta

### Diseño

Para el proceso de fabricación de la herramiento de planteó realizarlo en un modelo CAD y posteriormente realizar la respectiva impresión 3D. El modelo CAD se muestra a continuación:

![CAD herramienta](/imagenes/Porta_marcador.PNG)

Se compone de una base con agujeros M6 (según el manual) para atornillarla a la superficie de anclaje del Robot y además un cilindro hueco para introducir el marcador, con unas cartelas para darle más soporte.


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

### Robot Studio

### Robot Real

## Conclusiones
