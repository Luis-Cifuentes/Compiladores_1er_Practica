package com.example.compiladores_1er_practica.informacion;

import java.util.ArrayList;

public class Datos {
    //Atributos
    private static ArrayList<String[]> errores = new ArrayList<>();
    private static ArrayList<String[]> operadoresMatematicos = new ArrayList<>();


    //Metodos
    public static void reiniciarListas(){
        errores = new ArrayList<>() ;
        operadoresMatematicos = new ArrayList<>() ;
    }

    public static ArrayList entregarErrores(){
        return errores;
    }

    public static ArrayList entregarOperaciones(){
        return operadoresMatematicos;
    }

    public static void agregarElementoError(String[] errorNuevo){
        errores.add(errorNuevo);
    }

    public static void agregarElementoAritmetico(String[] operacionNuevo){
        operadoresMatematicos.add(operacionNuevo);
    }


}
