package com.example.listadetarefas   // deixe igual ao seu package

import android.os.Bundle
import android.widget.ArrayAdapter
import android.widget.Button
import android.widget.ListView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {

    private lateinit var listaTarefas: ListView
    private lateinit var btnAdicionar: Button
    private lateinit var adapter: ArrayAdapter<String>

    private val tarefas = mutableListOf(
        "Reunião diária",
        "Enviar relatório",
        "Avisar equipe"
    )

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        listaTarefas = findViewById(R.id.listaTarefas)
        btnAdicionar = findViewById(R.id.btnAdicionar)

        adapter = ArrayAdapter(
            this,
            android.R.layout.simple_list_item_1,
            tarefas
        )

        listaTarefas.adapter = adapter

        btnAdicionar.setOnClickListener {
            tarefas.add("Nova tarefa ${tarefas.size + 1}")
            adapter.notifyDataSetChanged()
        }
    }
}
