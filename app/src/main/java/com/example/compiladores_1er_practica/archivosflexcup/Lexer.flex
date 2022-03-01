/*primer seccion: codigo de usuario*/
package com.example.compiladores_1er_practica.analizadores;

import com.example.compiladores_1er_practica.informacion.Datos;
import java_cup.runtime.*;
%%

/*segunda seccion: configuracion*/

%class Lexer
%unicode
%public
%line
%column
%cup

%{
    public String devolverComentario(String comentario){
        String nuevoComentario = "";
        for(int i = 0; i < comentario.length() - 1 ; i++){
            char temp = comentario.charAt(i);
            nuevoComentario += temp;
        }
        return nuevoComentario;
    }
%}

/*Palabras reservadas*/
DEF = "Def"|"def"
BARRAS = "Barras"
PIE = "PIE"
TITULO = "titulo"
EJEX = "ejex"
EJEY = "ejey"
ETIQUETAS = "etiquetas"
VALORES = "valores"
UNIR = "unir"
TIPO = "tipo"
TIPO_CANTIDAD = "Cantidad"
TIPO_PORCENTAJE = "Porcentaje"
TOTAL = "total"
EXTRA = "extra"
EJECUTAR = "Ejecutar"

/*Tokens*/
PUNTO_COMA = ";"
DOS_PUNTOS = ":"
COMA = ","
PALABRA = [a-zA-Z]
ID = [\u0022]{PALABRA}({PALABRA}|[0-9])+[\u0022]
NUMERO = [0-9]+("."[0-9]+)?
COR_A = "["
COR_C = "]"
LLV_A = "{"
LLV_C = "}"
PAR_A = "("
PAR_C = ")"
SUMA = "+"
RESTA = "-"
MULTIPLICACION = "*"
DIVISION = "/"
COMENTARIO = #([^])+\n
ESPACIOS = [\r|\n|\r\n] | [ \t\f]

%%


/*tercer seccion: reglase lexicas*/

{DEF}   { return new Symbol(sym.DEF, yyline+1, yycolumn+1); }
{BARRAS}    { return new Symbol(sym.BARRAS, yyline+1, yycolumn+1); }
{PIE}   { return new Symbol(sym.PIE, yyline+1, yycolumn+1); }
{TITULO}    { return new Symbol(sym.TITULO, yyline+1, yycolumn+1); }
{EJEX}  { return new Symbol(sym.EJEX, yyline+1, yycolumn+1); }
{EJEY}  { return new Symbol(sym.EJEY, yyline+1, yycolumn+1); }
{ETIQUETAS} { return new Symbol(sym.ETIQUETAS, yyline+1, yycolumn+1); }
{VALORES}   { return new Symbol(sym.VALORES, yyline+1, yycolumn+1); }
{UNIR}  { return new Symbol(sym.UNIR, yyline+1, yycolumn+1); }
{TIPO}  { return new Symbol(sym.TIPO, yyline+1, yycolumn+1); }
{TIPO_CANTIDAD} { return new Symbol(sym.TIPO_CANTIDAD, yyline+1, yycolumn+1); }
{TIPO_PORCENTAJE}   { return new Symbol(sym.TIPO_PORCENTAJE, yyline+1, yycolumn+1); }
{TOTAL} { return new Symbol(sym.TOTAL, yyline+1, yycolumn+1); }
{EXTRA} { return new Symbol(sym.EXTRA, yyline+1, yycolumn+1); }
{EJECUTAR}  { return new Symbol(sym.EJECUTAR, yyline+1, yycolumn+1); }
{PUNTO_COMA}    { return new Symbol(sym.PUNTO_COMA, yyline+1, yycolumn+1); }
{DOS_PUNTOS}    { return new Symbol(sym.DOS_PUNTOS, yyline+1, yycolumn+1); }
{COMA}  { return new Symbol(sym.COMA, yyline+1, yycolumn+1); }
{ID}    { return new Symbol(sym.ID, yyline+1, yycolumn+1); }
{NUMERO}    { return new Symbol(sym.NUMERO, yyline+1, yycolumn+1); }
{LLV_A} { return new Symbol(sym.LLV_A, yyline+1, yycolumn+1); }
{LLV_C} { return new Symbol(sym.LLV_C, yyline+1, yycolumn+1); }
{COR_A} { return new Symbol(sym.COR_A, yyline+1, yycolumn+1); }
{COR_C} { return new Symbol(sym.COR_C, yyline+1, yycolumn+1); }
{PAR_A} { return new Symbol(sym.PAR_A, yyline+1, yycolumn+1); }
{PAR_C} { return new Symbol(sym.PAR_C, yyline+1, yycolumn+1); }
{SUMA}  { return new Symbol(sym.SUMA, yyline+1, yycolumn+1); }
{RESTA} { return new Symbol(sym.RESTA, yyline+1, yycolumn+1); }
{MULTIPLICACION}    { return new Symbol(sym.MULTIPLICACION, yyline+1, yycolumn+1); }
{DIVISION}  { return new Symbol(sym.DIVISION, yyline+1, yycolumn+1); }
{COMENTARIO} {}
{ESPACIOS}  {}
[^] 		{ Datos.agregarElementoError(new String[]{yytext(), yyline+1+"",yycolumn+1+"", "Lexico", "Lexema no identificado"}); }

<<EOF>> {return new Symbol(sym.EOF);}