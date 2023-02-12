<template>
    <section class="box">
        <form action="" class="formulario">
            <div class="modal-card" style="width: auto">
                <b-field label="Código">
                    <b-input v-model="estudiante.id" name="id"></b-input>
                </b-field>

                <b-field label="Primer nombre">
                    <b-input name="nombre1" v-model="estudiante.nombre1"></b-input>
                </b-field>
                <b-field label="Segundo nombre">
                    <b-input name="nombre2" v-model="estudiante.nombre2"></b-input>
                </b-field>
                <b-field label="Primer apellido">
                    <b-input name="apellido1" v-model="estudiante.apellido1"></b-input>
                </b-field>
                <b-field label="Segundo apellido">
                    <b-input name="apellido2" v-model="estudiante.apellido2"></b-input>
                </b-field>
                <div class="columns b-tooltips">
                    <div class="column is-two-fifths">
                        <b-field label="Sexo">
                            <b-select placeholder="Seleccione" name="sexo"  v-model="estudiante.sexo" required expanded>
                                <option value="M">M</option>
                                <option value="F">F</option>
                            </b-select>
                        </b-field>
                    </div>
                    <div class="column is-half">
                        <b-field grouped class="">                            
                            <b-field label="Curso del estudiante">
                                <b-tooltip label="Grado">
                                    <b-select placeholder="Grado" name="grado"  v-model="estudiante.grado" required>
                                        <option v-for="grado  in grados" :key="grado.id" :value="grado.id">{{ grado.nombre }}</option>
                                    </b-select>
                                </b-tooltip>
                                <b-tooltip label="Grupo">
                                    <b-select placeholder="Grupo" name="grupo"  v-model="estudiante.grupo" required>
                                        <option>1</option>
                                        <option>2</option>
                                    </b-select>
                                </b-tooltip>
                            </b-field>
                        </b-field>
                    </div>
                </div>
                <div class="columns">
                    <div class="column is-half">
                        <b-field >
                            <b-button expanded size="is-medium" v-if="agregar" type="is-primary" @click="agregarEstudiante">Guardar</b-button>
                            <b-button expanded size="is-medium" v-else type="is-success" @click="modificarEstudiante">Guardar</b-button>
                        </b-field>
                    </div>
                    <div class="column is-half">
                        <router-link to="/alumnos"><b-button type="is-warning" expanded size="is-medium">Regresar</b-button></router-link>
                    </div>                    
                </div>
            </div>
        </form>
    </section>
</template>

<script>

    import axios from 'axios';
    export default{
        props:["idEstudiante"],   
        data(){
            const grados = []
            const estudiante = {
                id  : "",
                grado  : "",
                grupo  : "",
                apellido1  : "",
                apellido2  : "",
                nombre1  : "",
                nombre2  : "",
                estado  : "",
                codInst  : "1",
                sexo  : "",
                rol  : "Estudiante",
                contrasena  : "123456"
            }
            //let agregar = false
            return{
                grados,
                estudiante,
                agregar:true
            }
        },
        mounted(){
            axios.get("http://localhost:21896/api/Grados").then(response => { this.grados = response.data });
            if(this.$route.params['id']){
                let idEst = this.$route.params['id'];
                axios.get("http://localhost:21896/api/Estudiantes/cargar/"+idEst).then(response => { this.estudiante = response.data[0]; this.agregar = false; });
            }
        },
        methods:{
            agregarEstudiante(){
                axios.post("http://localhost:21896/api/Estudiantes",this.estudiante).then(response => 
                    this.$buefy.toast.open({message: response.data,type: 'is-success'}),
                    this.$router.push("/alumnos")
                );
            },
            modificarEstudiante(){
                axios.put("http://localhost:21896/api/Estudiantes",this.estudiante).then(response => 
                    this.$buefy.toast.open({message: response.data,type: 'is-success'}),
                    this.$router.push("/alumnos")
                );
            }
        }
  }
</script>
<style scoped>
  
</style>