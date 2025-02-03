package com.es.mongocomp.model

class Usuario (
    val _id: String,
    val nombre: String,
    val contrasenia: String,
    val nick: String,
    val estado:Boolean,
    val tlfn: List<String>
)