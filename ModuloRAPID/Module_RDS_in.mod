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
    PERS wobjdata Workobject_2:=[FALSE,TRUE,"",[[494,-621,133],[0.282716368,0.091654542,-0.405734537,-0.864320766]],[[0,0,0],[1,0,0,0]]];
    PERS wobjdata Workobject_3:=[FALSE,TRUE,"",[[440.738071066,-489.932994924,148],[0.257636687,0.058970931,-0.215187541,-0.940127698]],[[0,0,0],[1,0,0,0]]];
!***********************************************************
    !
    ! Módulo:  Module1
    !
    ! Descripción:
    !   <Introduzca la descripción aquí>
    !
    ! Autor: difao
    !
    ! Versión: 1.0
    !
    !***********************************************************
    
    
    !***********************************************************
    !
    ! Procedimiento Main
    !
    !   Este es el punto de entrada de su programa
    !
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