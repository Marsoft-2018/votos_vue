<template>
    <div class="container box mt-6">        
        <section class="body box">
            <header class="logo-sistema">
                <img
                    src="https://colegiosanrafael.com.co/sisvot/IMG/Sisvot_P1.png"
                    alt="Lightweight UI components for Vue.js based on Bulma"
                >
            </header>
            <div class="seccion-votante">
                <h3 class="title is-3 mt-4 t2">TARJETON DE CANDIDATOS</h3>
                Estudiante votando: 
                <b>nombre del usuario {{ $route.params.id }}</b>
                <span style='float: right;'>
                    <a href='/' style='color: #fff; margin-right: 100px;'>Salir</a>
                </span>
            </div>

            <div class="principal">
                <div class="container">
                    <div class="tarjeton box" v-for="candidato in candidatos" :key="candidato.Id" @click="votar(candidato.Id,$route.params.id)">
                        <div class="foto">
                            <!-- <img src="IMG/candidato.FOTO "/> -->
                            FOTO
                        </div>
                        <div class="datos">                            
                            <div class="nombre">
                                <h3>	
                                    {{ candidato.nombre1 }} {{ candidato.nombre2 }} {{ candidato.apellido1 }} {{ candidato.apellido2 }}                                    
                                </h3>
                            </div>
                            <div class="numero">                                
                                # 0{{candidato.Id }}
                            </div>
                            <div class="partido" v-if="candidato.partido">
                                <h3>Partido: {{ candidato.partido }} </h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>
<script>
    import axios from 'axios'
    export default{
        data() {
            const candidatos = []

            return {
                candidatos,
                isBordered: false,
                selected: candidatos[0],
                voto:{
                    idEstudiante: '',
                    numero: '',
                    Anio:"2022"
                }                
            }
        },
        mounted(){
            axios.get("http://localhost:21896/api/Candidatos").then(response => (this.candidatos = response.data))
        },
        methods:{
            votar(num,id){
                this.voto.idEstudiante = id;
                this.voto.numero = num;
                this.$buefy.dialog.confirm({
                    title:"CONFIRMACION",
                    message: '¿Está seguro de votar por este candidato?'+num,
                    cancelText: 'Cancelar',
                    confirmText: 'Aceptar',
                    type: 'is-success',
                    hasIcon: true,
                    onConfirm: () =>{ 
                        axios.post("http://localhost:21896/api/Registro_Votos/",this.voto).then(response => (
                            this.$buefy.toast.open({message:'Voto realizado: '+response.data,type: 'is-success'}),
                            this.$router.push("../")
                            )
                        );
                        
                    }
                })
            }
        }
    }
</script>
<style scoped>
.body{
    display: flex;
    flex-flow: column nowrap;
    padding: 0px;
    margin: 0px;
    font-family: 'Roboto', sans-serif;
	background-color: #444451;
}

.logo-sistema{
    padding: 10px 5px;
    background-color: #E8E8E8;
}

.logo-sistema img{
    width: 10%;
}


.seccion-votante{
    width: 100%; 
    background-color: #4455F9; 
    color: #fff; 
    padding: 10px;
}
.seccion-votante .t2{
    color: #fff;
}

.principal{
	padding: 0px;
}

.principal .container{
	margin: 0 auto;
	width: 100%;
	display: flex;
	justify-content: space-around;
	align-items: center;
	flex-flow: row wrap;
    padding: 20px;
}

.tarjeton{
    border: 1px solid #1D1D23;
	display: flex;
	justify-content: space-between;
	align-items: stretch;
	flex-flow: row nowrap;
	background-color: #fff;
    margin: 20px;
    width: 40%;
    padding: 15px;
    border-radius: 5px;
    transition: 0.5s ease;
}


.tarjeton .datos{
    flex-grow: 3;
    padding: 10px 20px;
    box-sizing: border-box;
    display: flex;
    flex-flow: column nowrap;
    justify-content: space-between;
    color: #fff;
    background-color: #1d3d23;
}

.tarjeton .partido h3{
    color: #fff;
}
.tarjeton .datos .nombre{
    font-family: 'Montserrat', sans-serif;
    text-transform: uppercase;
    border-bottom: 1px solid #cecece;
    font-size: 1em;
}

.tarjeton .datos .numero{
    align-self: center;
    font-size: 3em;
}

.tarjeton:hover{
    cursor: pointer;
    transform: scale(1.1);
    box-shadow: 0px 0px 15px rgba(153,153,153,1);
    border: none;
    border: 3px solid transparent;
    border-image: -webkit-radial-gradient(red,transparent) 1 10;
    animation: animar 0.6s ease-in alternate infinite;
}    


@keyframes animar{
    0%{border-image: -webkit-radial-gradient(yellow,red,transparent) 1 10;box-shadow: 0px 0px 5px rgba(153,153,153,0.2)}
    50%{border-image: -webkit-linear-gradient(left,orange,brown) 1 10;box-shadow: 0px 0px 25px rgba(200,200,200,0.5)}
    100%{border-image: -webkit-radial-gradient(lightgreen, lightblue,transparent) 20 100;box-shadow: 0px 0px 50px rgba(253,253,253,1)}
}
</style>
