package com.example.compiladores_1er_practica;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.example.compiladores_1er_practica.analizadores.Lexer;
import com.example.compiladores_1er_practica.analizadores.parser;
import com.example.compiladores_1er_practica.informacion.Datos;

import java.io.Reader;
import java.io.StringReader;

public class MainActivity extends AppCompatActivity {

    private EditText txtEntrada;
    private Button btnEntrada;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        txtEntrada = findViewById(R.id.txtEntrada);
        btnEntrada = findViewById(R.id.btnAnalizar);

        btnEntrada.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String textoAnalizar = txtEntrada.getText().toString();
                if (!textoAnalizar.isEmpty()){
                    Reader reader = new StringReader(textoAnalizar);
                    Lexer lexer = new Lexer(reader);
                    parser parser = new parser(lexer);
                    try {
                        //parser.debug_parse();
                        parser.parse();
                    } catch (Exception e) {
                        System.out.println("Error manejado correctamente");
                        if (Datos.entregarErrores().size() != 0){
                            for (int i = 0; i < Datos.entregarErrores().size() ; i++) {
                                String[] error = (String[]) Datos.entregarErrores().get(i);
                                for (int j = 0; j < error.length ; j++) {
                                    System.out.print(error[j] + " ");
                                }
                                System.out.println("");
                            }
                        }
                    }
                }
            }
        });
    }
}