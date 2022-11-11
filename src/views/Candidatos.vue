<template>
    <div class="container">
        <h3 class="title is-1 mt-4">LISTADO DE CANDIDATOS</h3>
        <section class="box mt-6">
            <router-link to="aspirantes"><b-button class="is-primary" type="button">Agregar Candidato</b-button></router-link>
            <b-table
                :data="datos"                
                focusable>
                <b-table-column field="Id" label="ID" width="40" numeric v-slot="props">
                    {{ props.row.Id }}
                </b-table-column>
                <b-table-column field="nombre1" label="Primer nombre"    v-slot="props">
                    {{ props.row.nombre1 }}
                </b-table-column>
                <b-table-column field="nombre2" label="Segundo nombre"  v-slot="props">
                    {{ props.row.nombre2 }}
                </b-table-column>
                <b-table-column field="apellido1" label="Primer Apellido"    v-slot="props">
                    {{ props.row.apellido1 }}
                </b-table-column>
                <b-table-column field="apellido2" label="Segundo apellido"  v-slot="props">
                    {{ props.row.apellido2 }}
                </b-table-column>
                <b-table-column field="" label="Acciones" centered v-slot="props">
                    <b-button type="is-danger" outlined>Eliminar {{ props.row.CODEST }}</b-button>
                    <b-button type="is-primary" outlined>Editar {{ props.row.CODEST }}</b-button>
                </b-table-column>
            </b-table>
        </section>
        <router-view></router-view>
    </div>
</template>
<script>
    import axios from 'axios';
    export default {
        data() {
            const datos = []

            return {
                datos,
                isBordered: false            
            }
        },
        mounted(){
            axios.get("http://localhost:21896/api/Candidatos").then(response => (this.datos = response.data))
        },
        methods: {
            
        },
    }
</script>
<style scoped>

</style>