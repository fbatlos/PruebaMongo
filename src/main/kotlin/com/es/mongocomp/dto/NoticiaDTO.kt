package com.es.mongocomp.dto

import java.util.Date

data class NoticiaDTO(
    val titulo: String,
    var cuerpo: String,
    var user: String,
    val tag: List<String>,
    val fecha_pub:Date
)
