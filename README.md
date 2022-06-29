# Laboratorio 5 - Robótica Industrial IRB140 
- Rafael Ricardo Galindo
- Diego Fabian Osorio Fonseca

## Herramienta

### Diseño

Para el proceso de fabricación de la herramiento de planteó realizarlo en un modelo CAD y posteriormente realizar la respectiva impresión 3D. El modelo CAD se muestra a continuación:

![CAD herramienta](/imagenes/Porta_marcador.PNG)

Se compone de una base con agujeros M6 (según el manual) para atornillarla a la superficie de anclaje del Robot y además un cilindro hueco para introducir el marcador, con unas cartelas para darle más soporte.


### Calibración de herramienta en RobotStudio y en IRB140.  
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


## Trayectorias


## Resultados

El video con la simulación en Robotstudio y la implementación de la práctica con el robot real se encuentra en el siguiente Link:  **[Video Laboratorio 4](https://youtu.be/RAd8DfRgSsY)**


### Código en RAPID

### Robot Studio

### Robot Real

## Conclusiones
