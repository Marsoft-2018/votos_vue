<template>
    <b-navbar>
        <template #brand>
            <b-navbar-item tag="router-link" :to="{ path: '/' }">
                <img
                    src="https://colegiosanrafael.com.co/sisvot/IMG/Sisvot_P1.png"
                    alt="Lightweight UI components for Vue.js based on Bulma"
                >
            </b-navbar-item>
        </template>
        <template #start>
          <b-navbar-dropdown label="Inicio">
                <b-navbar-item href="">Usuarios</b-navbar-item>
                <b-navbar-item href="#"><router-link to="candidatos">Candidatos</router-link></b-navbar-item>
                <b-navbar-item href="#"><router-link to="alumnos">Alumnos</router-link></b-navbar-item>
                <b-navbar-item href="/">Salir</b-navbar-item>
            </b-navbar-dropdown>
          <b-navbar-dropdown label="Administrar">
                <b-navbar-item href="#">Iniciar votación</b-navbar-item>
                <b-navbar-item href="#">Cerrar votación</b-navbar-item>
                <b-navbar-item href="#"><router-link to="tarjetonAdmin">Ver Tarjetón</router-link></b-navbar-item>
            </b-navbar-dropdown>
            <b-navbar-dropdown label="Reportes">
                <b-navbar-item href="#"><router-link to="conteo">Conteo de votos</router-link></b-navbar-item>
                <b-navbar-item href="#">Abstencionismo</b-navbar-item>
            </b-navbar-dropdown>
            <b-navbar-dropdown label="Info">
                <b-navbar-item href="#" @click="modalAcercade = true">
                    Acerca de
                </b-navbar-item>
                <b-navbar-item href="#">
                    Contact
                </b-navbar-item>
            </b-navbar-dropdown>
        </template>
  
        <template #end>
            <b-navbar-item tag="div">
                <div class="buttons">
                    <a href="/" class="button is-danger">
                        <strong>Salir</strong>
                    </a>
                </div>
            </b-navbar-item>
        </template>
    </b-navbar>
</template>
<script>
    export default{
        props: {
            msg: String
        },
        data(){
            return{
                modalAcercade: false
            }
        }
    }
</script>